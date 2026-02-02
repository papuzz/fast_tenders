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

-- 1.1 BUSINESS PROFILES TABLE
CREATE TABLE IF NOT EXISTS public.business_profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  business_name TEXT,
  business_type TEXT,
  sectors TEXT[],
  license_category TEXT,
  license_grade TEXT,
  vat_registered BOOLEAN,
  tax_compliance TEXT,
  max_contract_size TEXT,
  bid_bond_comfort TEXT,
  years_in_operation TEXT,
  projects_completed TEXT,
  major_client TEXT,
  preferred_institutions TEXT[],
  operating_regions TEXT[],
  alert_match BOOLEAN DEFAULT true,
  alert_favorite BOOLEAN DEFAULT true,
  alert_deadline BOOLEAN DEFAULT false,
  alert_competitor BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.business_profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own business profile." ON public.business_profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can insert their own business profile." ON public.business_profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update their own business profile." ON public.business_profiles
  FOR UPDATE USING (auth.uid() = id);

-- Trigger to create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (new.id, new.email, new.raw_user_meta_data->>'full_name');
  RETURN NEW;
END;
$$ LANGUAGE PLPGSQL SECURITY DEFINER;

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
      WHERE profiles.id = auth.uid() AND profiles.is_pro = true
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
  tender_id UUID REFERENCES public.tenders ON DELETE CASCADE,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  type TEXT DEFAULT 'general' NOT NULL,
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
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
CREATE TRIGGER update_business_profiles_updated_at BEFORE UPDATE ON public.business_profiles FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
CREATE TRIGGER update_tenders_updated_at BEFORE UPDATE ON public.tenders FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();


-- 6. CORPORATE TEAMS & SUBSCRIPTIONS

-- Corporate Plans Table
CREATE TABLE IF NOT EXISTS public.corporate_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  max_seats INTEGER NOT NULL,
  price NUMERIC,
  duration_months INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.corporate_plans ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Corporate plans are viewable by everyone" ON public.corporate_plans
  FOR SELECT USING (true);

-- User Subscriptions / Corporate Accounts
CREATE TABLE IF NOT EXISTS public.corporate_subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  admin_id UUID REFERENCES auth.users ON DELETE CASCADE NOT NULL,
  plan_id UUID REFERENCES public.corporate_plans ON DELETE RESTRICT NOT NULL,
  start_date TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  end_date TIMESTAMP WITH TIME ZONE NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.corporate_subscriptions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own subscriptions" ON public.corporate_subscriptions
  FOR SELECT USING (auth.uid() = admin_id);

-- Team Members Table
CREATE TABLE IF NOT EXISTS public.team_members (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  subscription_id UUID REFERENCES public.corporate_subscriptions ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES auth.users ON DELETE SET NULL, -- Null if pending
  email TEXT NOT NULL, -- Email invited
  role TEXT DEFAULT 'MEMBER', -- 'ADMIN', 'MEMBER'
  status TEXT DEFAULT 'pending', -- 'active', 'pending'
  invited_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  joined_at TIMESTAMP WITH TIME ZONE,
  UNIQUE(subscription_id, email)
);

ALTER TABLE public.team_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can view their team members" ON public.team_members
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.corporate_subscriptions
      WHERE id = team_members.subscription_id
      AND admin_id = auth.uid()
    )
  );

CREATE POLICY "Members can view themselves" ON public.team_members
  FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Admins can invite members" ON public.team_members
  FOR INSERT WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.corporate_subscriptions
      WHERE id = subscription_id
      AND admin_id = auth.uid()
    )
  );

CREATE POLICY "Admins can update members" ON public.team_members
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM public.corporate_subscriptions
      WHERE id = team_members.subscription_id
      AND admin_id = auth.uid()
    )
  );

CREATE POLICY "Admins can remove members" ON public.team_members
  FOR DELETE USING (
    EXISTS (
      SELECT 1 FROM public.corporate_subscriptions
      WHERE id = team_members.subscription_id
      AND admin_id = auth.uid()
    )
  );

-- 7. PERSONAL PLANS
CREATE TABLE IF NOT EXISTS public.personal_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  price NUMERIC NOT NULL,
  duration_months INTEGER NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.personal_plans ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Personal plans are viewable by everyone" ON public.personal_plans
  FOR SELECT USING (true);

-- Seed Data for Corporate Plans
INSERT INTO public.corporate_plans (name, max_seats, price, duration_months) VALUES
('Enterprise Annual', 3, 4000, 12),
('Business 6 Month', 3, 3000, 6),
('Business Quarterly', 3, 2500, 3)
ON CONFLICT DO NOTHING;

-- 8. AUTOMATIC NOTIFICATIONS FOR MATCHING TENDERS
CREATE OR REPLACE FUNCTION public.notify_on_matching_tender()
RETURNS TRIGGER AS $$
BEGIN
  -- Insert notification for each user who has the tender's category in their sectors
  -- AND has alert_match enabled
  INSERT INTO public.notifications (user_id, tender_id, title, message, type)
  SELECT 
    bp.id as user_id,
    NEW.id as tender_id,
    'New Tender Match: ' || NEW.title_en as title,
    'A new tender in "' || NEW.category || '" has been posted by ' || NEW.organization_en as message,
    'tender_match' as type
  FROM public.business_profiles bp
  WHERE NEW.category = ANY(bp.sectors)
  AND bp.alert_match = true;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check existing tenders for a user (called when they update sectors)
CREATE OR REPLACE FUNCTION public.check_existing_tenders_for_user(target_user_id UUID)
RETURNS void AS $$
BEGIN
  INSERT INTO public.notifications (user_id, tender_id, title, message, type)
  SELECT 
    target_user_id,
    t.id,
    'Previously Posted Match: ' || t.title_en,
    'We found an existing tender in "' || t.category || '" from ' || t.organization_en,
    'tender_match'
  FROM public.tenders t
  JOIN public.business_profiles bp ON bp.id = target_user_id
  WHERE t.category = ANY(bp.sectors)
  AND bp.alert_match = true
  AND t.deadline > now() -- Only notify for open tenders
  AND NOT EXISTS (
    SELECT 1 FROM public.notifications n 
    WHERE n.user_id = target_user_id AND n.tender_id = t.id
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


CREATE OR REPLACE TRIGGER on_tender_created
  AFTER INSERT ON public.tenders
  FOR EACH ROW EXECUTE FUNCTION public.notify_on_matching_tender();