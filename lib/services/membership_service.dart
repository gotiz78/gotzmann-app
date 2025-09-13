import 'package:shared_preferences/shared_preferences.dart';

const _kPrefIsMember = 'is_member';

class MembershipService {
  static final MembershipService _i = MembershipService._();
  MembershipService._();
  factory MembershipService() => _i;

  bool _isMember = false;
  bool get isMember => _isMember;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isMember = prefs.getBool(_kPrefIsMember) ?? false;
  }

  Future<void> setMember(bool v) async {
    final prefs = await SharedPreferences.getInstance();
    _isMember = v;
    await prefs.setBool(_kPrefIsMember, v);
  }
}
