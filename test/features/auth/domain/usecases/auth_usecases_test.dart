import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:RutaMove/features/auth/domain/repositories/auth_repository.dart';
import 'package:RutaMove/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:RutaMove/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:RutaMove/features/auth/domain/entities/authenticated_user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late SignUpUseCase signUpUseCase;
  late SignInUseCase signInUseCase;

  setUp(() {
    mockRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(mockRepository);
    signInUseCase = SignInUseCase(mockRepository);
  });

  const tEmail = 'test@test.com';
  const tPassword = 'password123';
  final tUser = UserEntity(uid: '123', email: tEmail, password: tPassword);

  group('SignUpUseCase', () {
    test('debe llamar al repository.signUp y retornar un UserEntity', () async {
      // Arrange
      when(() => mockRepository.signUp(email: tEmail, password: tPassword))
          .thenAnswer((_) async => tUser);

      // Act
      final result = await signUpUseCase(email: tEmail, password: tPassword);

      // Assert
      expect(result, tUser);
      verify(() => mockRepository.signUp(email: tEmail, password: tPassword)).called(1);
    });
  });

  group('SignInUseCase', () {
    test('debe llamar al repository.signIn y retornar un UserEntity', () async {
      // Arrange
      when(() => mockRepository.signIn(email: tEmail, password: tPassword))
          .thenAnswer((_) async => tUser);

      // Act
      final result = await signInUseCase(email: tEmail, password: tPassword);

      // Assert
      expect(result, tUser);
      verify(() => mockRepository.signIn(email: tEmail, password: tPassword)).called(1);
    });
  });
}
