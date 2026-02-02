import 'models/team_member.dart';
import 'models/corporate_plan.dart';

abstract class CorporateRepository {
  Future<CorporatePlan> getActivePlan();
  Future<List<TeamMember>> getTeamMembers();
  Future<void> inviteMember(String email);
  Future<void> removeMember(String id);
  Future<void> resendInvitation(String email);
  Future<void> cancelInvitation(String email);
}

class MockCorporateRepository implements CorporateRepository {
  @override
  Future<CorporatePlan> getActivePlan() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return CorporatePlan(
      id: '1',
      name: '1 Year Corporate',
      maxSeats: 3,
      usedSeats: 1,
      renewalDate: DateTime.now().add(const Duration(days: 300)),
      isActive: true,
    );
  }

  @override
  Future<List<TeamMember>> getTeamMembers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const TeamMember(
        id: '1',
        name: 'Abebe Balcha',
        email: 'abebe@enterprise.et',
        role: 'ADMIN',
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBMYCxxuzQ5QDb5ncHAFv-jE51P2fWT_b8votwE0KAF7FvJZl8z0xsI1oWzw4JaE1aqGWDB-SC9c-PaLqUIiopnZc_rkUCxMqnE7UI63W2GOfrl80inqi-BYbAjJLvmXV4LcZxQuKTmArNGUbI6YFegWuDqzFHw6lJLXK_6PPQi5jCWHcBuVWySfLwLw0vczmTCuHxiuxaASm3PD6DAmdsic9mYSjUls6HRWNeVD8WUBkt_xEHSqewXtzfY7uJLoB96E6zxCZSDL-mr',
        isOnline: true,
        status: 'active',
      ),
      const TeamMember(
        id: '2',
        name: 'Pending User',
        email: 'samuel@techtide.et',
        role: 'MEMBER',
        isOnline: false,
        status: 'pending',
      ),
    ];
  }

  @override
  Future<void> inviteMember(String email) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Simulate API call
  }

  @override
  Future<void> removeMember(String id) async {
     await Future.delayed(const Duration(milliseconds: 1000));
  }
  
  @override
  Future<void> resendInvitation(String email) async {
     await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Future<void> cancelInvitation(String email) async {
     await Future.delayed(const Duration(milliseconds: 1000));
  }
}
