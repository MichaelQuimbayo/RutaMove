import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:RutaMove/features/auth/domain/repositories/auth_repository.dart';
import 'package:RutaMove/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:RutaMove/features/auth/domain/entities/authenticated_user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignInUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = SignInUseCase(mockAuthRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = UserEntity(uid: '123', email: tEmail, password: tPassword);

  test('debe llamar al repository para iniciar sesión con éxito', () async {
    // Arrange
    when(() => mockAuthRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => tUser);

    // Act
    final result = await useCase(email: tEmail, password: tPassword);

    // Assert
    expect(result, tUser);
    verify(() => mockAuthRepository.signIn(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('debe lanzar una excepción cuando el repository falla', () async {
    // Arrange
    when(() => mockAuthRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(Exception('Error de autenticación'));

    // Act
    final call = useCase(email: tEmail, password: tPassword);

    // Assert
    expect(() => call, throwsA(isA<Exception>()));
  });
}
