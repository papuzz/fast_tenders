import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'corporate_repository.dart';
import 'models/team_member.dart';
import 'models/corporate_plan.dart';

final corporateRepositoryProvider = Provider<CorporateRepository>((ref) {
  return MockCorporateRepository();
});

final corporatePlanProvider = FutureProvider<CorporatePlan>((ref) async {
  final repository = ref.watch(corporateRepositoryProvider);
  return repository.getActivePlan();
});

final teamMembersProvider = FutureProvider<List<TeamMember>>((ref) async {
  final repository = ref.watch(corporateRepositoryProvider);
  return repository.getTeamMembers();
});
