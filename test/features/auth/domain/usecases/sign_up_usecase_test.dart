import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:RutaMove/features/auth/domain/repositories/auth_repository.dart';
import 'package:RutaMove/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:RutaMove/features/auth/domain/entities/authenticated_user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignUpUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = SignUpUseCase(mockAuthRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = UserEntity(uid: '123', email: tEmail, password: tPassword);

  test('debe llamar al repository para crear un usuario', () async {
    // Arrange
    when(() => mockAuthRepository.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => tUser);

    // Act
    final result = await useCase(email: tEmail, password: tPassword);

    // Assert
    expect(result, tUser);
    verify(() => mockAuthRepository.signUp(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
