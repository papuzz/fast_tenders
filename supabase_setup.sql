-- SUPABASE SQL SETUP FOR TENDERWIN ETHIOPIA
-- This script sets up tables, RLS policies, and triggers for the app.

-- 1. PROFILES TABLE
-- Stores additional user information, linked to auth.users
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  email TEXT UNIQUE,
  full_name TEXT,
  phone_number TEXT,
  preferred_language TEXT DEFAULT 'am',
  is_pro BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public profiles are viewable by everyone." ON public.profiles
  FOR SELECT USING (true);

CREATE POLICY "Users can insert their own profile." ON public.profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update own profile." ON public.profiles
  FOR UPDATE USING (auth.uid() = id);

-- Trigger to create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (new.id, new.email, new.raw_user_meta_data->>'full_name');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- 2. TENDERS TABLE
-- Stores tender listings
CREATE TABLE IF NOT EXISTS public.tenders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title_en TEXT NOT NULL,
  title_am TEXT NOT NULL,
  category TEXT NOT NULL, -- e.g., 'Construction', 'IT', etc.
  organization_en TEXT NOT NULL,
  organization_am TEXT NOT NULL,
  deadline TIMESTAMP WITH TIME ZONE NOT NULL,
  posted_date TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  cpo_amount NUMERIC, -- Can be null
  status TEXT DEFAULT 'OPEN', -- 'OPEN', 'CLOSED'
  min_grade TEXT, -- e.g., 'GC-3', 'BC-5'
  location_en TEXT NOT NULL,
  location_am TEXT NOT NULL,
  is_featured BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.tenders ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Tenders are viewable by everyone" ON public.tenders
  FOR SELECT USING (true);

CREATE POLICY "Only admins can modify tenders" ON public.tenders
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE profiles.id = auth.uid() AND profiles.is_pro = true -- Or a specific role check
    )
  );


-- 3. SAVED TENDERS (Bookmarking)
CREATE TABLE IF NOT EXISTS public.saved_tenders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users ON DELETE CASCADE NOT NULL,
  tender_id UUID REFERENCES public.tenders ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  UNIQUE(user_id, tender_id)
);

ALTER TABLE public.saved_tenders ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own saved tenders" ON public.saved_tenders
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can save tenders" ON public.saved_tenders
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can remove saved tenders" ON public.saved_tenders
  FOR DELETE USING (auth.uid() = user_id);


-- 4. NOTIFICATIONS / ALERTS
CREATE TABLE IF NOT EXISTS public.notifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own notifications" ON public.notifications
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can update their own notification status" ON public.notifications
  FOR UPDATE USING (auth.uid() = user_id);


-- 5. HELPER FOR UPDATED_AT
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
CREATE TRIGGER update_tenders_updated_at BEFORE UPDATE ON public.tenders FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
