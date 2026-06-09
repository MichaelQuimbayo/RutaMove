import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:RutaMove/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:RutaMove/features/auth/data/services/firestore_user_service.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}
class MockFirestoreUserService extends Mock implements FirestoreUserService {}

void main() {
  late AuthRepositoryImpl repository;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirestoreUserService mockFirestoreUserService;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirestoreUserService = MockFirestoreUserService();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    repository = AuthRepositoryImpl(
      mockFirestoreUserService,
      firebaseAuth: mockFirebaseAuth,
    );
  });

  const tEmail = 'test@test.com';
  const tPassword = 'password123';
  const tUid = '123';

  group('signUp', () {
    test('debe retornar UserEntity cuando el registro es exitoso', () async {
      // Arrange
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn(tUid);

      // Act
      final result = await repository.signUp(email: tEmail, password: tPassword);

      // Assert
      expect(result.uid, tUid);
      expect(result.email, tEmail);
      verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).called(1);
    });

    test('debe lanzar una excepción cuando FirebaseAuth falla', () async {
      // Arrange
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).thenThrow(FirebaseAuthException(code: 'email-already-in-use', message: 'Email ya en uso'));

      // Act & Assert
      expect(
        () => repository.signUp(email: tEmail, password: tPassword),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('signIn', () {
    test('debe retornar UserEntity cuando el login es exitoso', () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn(tUid);

      // Act
      final result = await repository.signIn(email: tEmail, password: tPassword);

      // Assert
      expect(result.uid, tUid);
      expect(result.email, tEmail);
      verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).called(1);
    });

    test('debe lanzar una excepción cuando el login falla', () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          )).thenThrow(FirebaseAuthException(code: 'user-not-found', message: 'Usuario no encontrado'));

      // Act & Assert
      expect(
        () => repository.signIn(email: tEmail, password: tPassword),
        throwsA(isA<Exception>()),
      );
    });
  });
}
