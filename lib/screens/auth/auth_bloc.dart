import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences sharedPreferences;
  AuthBloc(this.sharedPreferences) : super(Unknown()) {
    add(RestoreSession());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    if (event is RestoreSession) {
      yield* _mapRestoreSessionEventToState();
    } else if (event is DidAuthenticate) {
      yield* _mapAuthenticateEventToState(event.user);
    } else if (event is LogOut) {
      yield* _mapLogOutEventToState();
    }
  }

  Stream<AuthState> _mapRestoreSessionEventToState() async* {
    final authenticated =
        await Future.delayed(Duration(milliseconds: 3000), () {
      return false;
    });

    if (authenticated) {
      final user = User('01', 'test.test@gmail.com', 'Test', 'Test');
      yield Authenticated(user);
    } else {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> _mapAuthenticateEventToState(User user) async* {
    /// Store user info into SharedPreferences
    yield Authenticated(user);
  }

  Stream<AuthState> _mapLogOutEventToState() async* {
    /// Call log out from AuthRepository
    yield UnAuthenticated();
  }
}
