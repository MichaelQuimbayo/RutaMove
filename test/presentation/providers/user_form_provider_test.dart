import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_user/domain/repositories/user_repository.dart';
import 'package:flutter_user/domain/entities/user_entity.dart';
import 'package:flutter_user/presentation/providers/user_form_provider.dart';
import 'package:flutter_user/presentation/providers/user_providers.dart';

// Mocks y Fakes
class MockUserRepository extends Mock implements UserRepository {}
class Listener<T> extends Mock {
  void call(T? previous, T next);
}
class FakeUserEntity extends Fake implements UserEntity {}
class FakeUserFormState extends Fake implements UserFormState {}

void main() {
  // Configuración global para mocktail
  setUpAll(() {
    registerFallbackValue(FakeUserEntity());
    registerFallbackValue(FakeUserFormState());
  });

  late MockUserRepository mockUserRepository;
  final userFormProviderInstance = userFormProvider(null);

  setUp(() {
    mockUserRepository = MockUserRepository();
    when(() => mockUserRepository.saveUser(any())).thenAnswer((_) async => const Right(1));
  });

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('UserFormNotifier', () {
    test('saveUser debe fallar si el nombre es muy corto', () async {
      // Arrange
      final container = createContainer();
      final listener = Listener<UserFormState>();
      container.listen(userFormProviderInstance, listener.call, fireImmediately: true);
      final notifier = container.read(userFormProviderInstance.notifier);

      final invalidUser = UserEntity(
        firstName: 'J',
        lastName: 'Doe',
        birthDate: DateTime(1990, 1, 1),
        email: 'john.doe@example.com',
        phone: '1234567890',
      );
      notifier.updateField(invalidUser);

      // Act
      final result = await notifier.saveUser();

      // Assert
      expect(result, isFalse);
      verify(() => listener.call(
        any(that: isA<UserFormState>()),
        any(that: isA<UserFormState>()
            .having((s) => s.errorMessage, 'errorMessage', isNotNull)
            .having((s) => s.errorMessage, 'errorMessage content', contains('nombre'))
        ),
      )).called(1);
    });

    test('saveUser debe llamar al repositorio si los datos son válidos', () async {
      // Arrange
      final container = createContainer();
      final listener = Listener<UserFormState>();
      container.listen(userFormProviderInstance, listener.call, fireImmediately: true);
      final notifier = container.read(userFormProviderInstance.notifier);

      final validUser = UserEntity(
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 1, 1),
        email: 'john.doe@example.com',
        phone: '1234567890',
      );
      notifier.updateField(validUser);

      // Act
      final result = await notifier.saveUser();
      // Assert
      expect(result, isTrue);
      verify(() => mockUserRepository.saveUser(any())).called(1);
      
      verifyInOrder([
        () => listener.call(any(), any(that: isA<UserFormState>().having((s) => s.isSaving, 'isSaving', isTrue))),
        () => listener.call(any(), any(that: isA<UserFormState>()
            .having((s) => s.isSaving, 'isSaving', isFalse)
            .having((s) => s.errorMessage, 'errorMessage', isNull)
        )),
      ]);
    });
  });
}
