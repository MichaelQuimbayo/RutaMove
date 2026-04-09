import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_user/domain/repositories/user_repository.dart';
import 'package:flutter_user/domain/entities/user_entity.dart';
import 'package:flutter_user/presentation/providers/user_form_provider.dart';
import 'package:flutter_user/presentation/providers/user_providers.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;
  final userFormProviderInstance = userFormProvider(null);

  setUp(() {
    mockUserRepository = MockUserRepository();
    when(() => mockUserRepository.saveUser(any())).thenAnswer((_) async => const Right(1));
  });

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
      ],
    );
  }

  group('UserFormNotifier', () {
    test('saveUser debe fallar si el nombre es muy corto', () async {
      final container = createContainer();
      final states = <UserFormState>[];
      // Escuchamos y guardamos todos los cambios de estado en una lista.
      container.listen<UserFormState>(
        userFormProviderInstance,
        (previous, next) {
          states.add(next);
        },
        fireImmediately: true,
      );

      final notifier = container.read(userFormProviderInstance.notifier);

      final invalidUser = UserEntity(
        firstName: 'J',
        lastName: 'Doe',
        birthDate: DateTime(1990, 1, 1),
        email: 'john.doe@example.com',
        phone: '1234567890',
      );
      notifier.updateField(invalidUser);

      final result = await notifier.saveUser();

      expect(result, isFalse);
      
      // El último estado en la lista debe contener el mensaje de error.
      final lastState = states.last;
      expect(lastState.errorMessage, isNotNull);
      expect(lastState.errorMessage, contains('nombre'));
    });

    test('saveUser debe llamar al repositorio si los datos son válidos', () async {
      final container = createContainer();
      final states = <UserFormState>[];
      // Escuchamos y guardamos todos los cambios de estado.
      container.listen<UserFormState>(
        userFormProviderInstance,
        (previous, next) {
          states.add(next);
        },
        fireImmediately: true,
      );

      final notifier = container.read(userFormProviderInstance.notifier);

      final validUser = UserEntity(
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 1, 1),
        email: 'john.doe@example.com',
        phone: '1234567890',
      );
      notifier.updateField(validUser);

      final result = await notifier.saveUser();

      expect(result, isTrue);
      verify(() => mockUserRepository.saveUser(any())).called(1);
      
      // El último estado no debe tener mensaje de error.
      final lastState = states.last;
      expect(lastState.errorMessage, isNull);
    });
  });
}
