import 'package:rxdart/rxdart.dart';

import '../../repos/profile_repository.dart';
import 'profile.dart';

class ProfileBloc {

  final ProfileRepository _profileRepository = ProfileRepository();
  final BehaviorSubject<ProfileResponse> _subject = 
    BehaviorSubject<ProfileResponse> ();

  getProfile() async {
    ProfileResponse response = await _profileRepository.getProfile();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProfileResponse> get subject => _subject;
}

final profileBloc = ProfileBloc();