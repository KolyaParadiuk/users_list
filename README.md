# Users List

A Flutter mobile application that displays a list of users with their basic information and allows viewing detailed user profiles.

## Core Functionality

- **User List**: Displays a paginated list of users with their profile image, name, country, and age
- **Lazy Loading**: Implements infinite scrolling to load more users as the user scrolls down
- **Pull to Refresh**: Allows refreshing the list of users
- **User Details**: Shows detailed information about a selected user
- **Error Handling**: Displays error messages with retry options
- **Localization**: Supports multiple languages (currently set up for English)

## Technologies and Architecture

### Core Technologie
- **Bloc/Cubit**: State management
- **Retrofit**: Type-safe REST API client
- **Dio**: HTTP client for API requests
- **auto_route**: Navigation and routing
- **get_it**: Dependency injection
- **easy_localization**: Internationalization

### Architecture
The project follows a clean architecture approach with the following layers:

- **Presentation**: UI components, screens, and state management
- **Domain**: Business logic and entities
- **Data**: Data sources, repositories, and DTOs

### Project Structure
- `lib/features/users/`: Main feature module
  - `presentation/`: UI components and state management
  - `domain/`: Business logic and entities
  - `data/`: API integration and repositories
- `lib/common/`: Shared components, utilities, and configurations
- `lib/routing/`: App navigation configuration
- `lib/gen/`: Generated code and localization keys

## Getting Started

### Prerequisites
- Flutter SDK (>=3.5.0)
- Dart SDK (>=3.5.0)

### Installation
1. Clone the repository
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Run the app:
   ```
   flutter run
   ```

### Build for Production
```
flutter build apk --release  # Android
flutter build ios --release  # iOS
```
