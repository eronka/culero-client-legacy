import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

/// A provider for a stream that emits the current user when the Firebase
/// authentication state changes.
@riverpod
Stream<User?> firebaseAuthStateChangesStream(
  FirebaseAuthStateChangesStreamRef ref,
) {
  return FirebaseAuth.instance.authStateChanges();
}
