# Gemini Project Configuration

## 1. Project Overview

This is a Flutter application for user management. It's built following modern, scalable practices. The primary goal is to manage a list of users, including their personal data and addresses, with local persistence.

## 2. Core Architecture & Technologies

The project follows a **Clean Architecture** pattern, organized into three main layers (`presentation`, `domain`, `data`). State management and dependency injection are handled by **Riverpod**. The local database is **Isar**.

- **`lib/presentation`**: Contains all UI-related code (Widgets, Screens) and UI-specific state holders (using Riverpod Providers). This layer's responsibility is to display data and handle user input.
- **`lib/domain`**: The core of the application. It contains the business logic, completely independent of any framework or implementation detail.
    - **`entities`**: Pure Dart objects representing the core business models (e.g., `UserEntity`).
    - **`repositories`**: Abstract classes defining contracts for data operations (e.g., `UserRepository`).
    - **`usecases`**: Encapsulate specific business rules or actions (e.g., `GetUserUseCase`).
- **`lib/data`**: Implements the repository contracts from the `domain` layer. It's responsible for fetching data from its source, whether it's the network or the local **Isar** database.
    - **`models`**: Data Transfer Objects (DTOs) that are tied to a specific data source (e.g., Isar models annotated with `@collection`). They include methods for converting to/from `domain` entities.
    - **`repositories`**: Concrete implementations of the `UserRepository` contract (e.g., `IsarUserRepository`).

**Key Rule:** The dependency flow is always towards the center: `Presentation` -> `Domain` <- `Data`. The `Domain` layer must not depend on any other layer.

## 3. State Management: Riverpod

- We use **Riverpod** with `riverpod_generator` for dependency injection and state management.
- **Providers are the glue** that connects the layers. For example, a provider creates the `IsarUserRepository` and makes the `UserRepository` interface available to the `domain` layer's use cases.
- When creating new providers, prefer using annotations (`@riverpod`).
- The UI layer (`presentation`) should only interact with providers, not directly with repositories.

## 4. Database: Isar

- **Isar** is our high-performance local database.
- Data models for Isar are located in `lib/data/models` and are annotated with `@collection`.
- Any changes to these model files require running the code generator.

## 5. Code Generation

We use `build_runner` for several key libraries (`freezed`, `isar`, `riverpod_generator`). After modifying any file related to these, you **must** run the following command in the terminal:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 6. Flavors

The project is configured with two flavors for different environments:
- **`dev`**: For development. Uses `lib/main_dev.dart` as its entry point.
- **`prod`**: For production. Uses `lib/main_prod.dart` as its entry point.

You can run a specific flavor using the launch configurations in VS Code/Android Studio or via the terminal:
`flutter run --flavor dev --target lib/main_dev.dart`

## 7. How to Add a New Feature (Example: "Add Note to User")

1.  **Domain Layer**:
    - Define a `NoteEntity` in `lib/domain/entities`.
    - Add a `addNote(NoteEntity note)` method to the `UserRepository` abstract class.
    - Create a `AddNoteUseCase` in `lib/domain/usecases`.
2.  **Data Layer**:
    - Create a `NoteModel` in `lib/data/models` (annotated for Isar).
    - Implement the `addNote` method in `IsarUserRepository`.
3.  **Code Generation**:
    - Run `dart run build_runner build ...` to update the generated files for Isar.
4.  **Presentation Layer**:
    - Create a new provider (e.g., `addNoteProvider`) that calls the `AddNoteUseCase`.
    - Build the UI (e.g., a form and a button) that uses this provider to add the note.
    - The UI should rebuild automatically based on the state exposed by the provider.
