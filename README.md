# NewsNova

A Flutter-based news application that provides the latest articles and headlines. This app allows users to browse news by category, view detailed articles, and enjoy a clean, user-friendly interface.

## Features

- **Onboarding Screen**: A welcoming introduction to the app for new users.
- **Home Screen**: Displays the latest news articles and allows users to browse by category.
- **Category-Specific News**: View news from various categories such as Business, Entertainment, Science, Sports, and Technology.
- **Article View**: Read full articles in a web view for a seamless experience.
- **Clean UI**: A simple and intuitive design for easy navigation.

## Project Structure

The project is organized into the following directories:

- **`lib/`**: Contains the main application code.
  - **`main.dart`**: The entry point of the application.
  - **`myapp.dart`**: The root widget of the application.
  - **`models/`**: Contains the data models for the app.
    - **`article_model.dart`**: Defines the structure for a news article.
    - **`category_model.dart`**: Defines the structure for a news category.
  - **`services/`**: Handles data fetching and business logic.
    - **`data.dart`**: Provides the list of news categories.
    - **`news.dart`**: Fetches news articles from the API.
    - **`show_category_news.dart`**: Fetches news articles for a specific category.
  - **`ui/`**: Contains the user interface of the application.
    - **`screens/`**: Contains the different screens of the app.
      - **`onboarding_screen.dart`**: The first screen a new user sees.
      - **`home_screen.dart`**: The main screen with news categories and articles.
      - **`category_news_screen.dart`**: Displays news for a selected category.
      - **`article_screen.dart`**: Shows the full article in a web view.

## Dependencies

The project relies on the following key dependencies:

- **`http`**: For making network requests to fetch news data.
- **`webview_flutter`**: To display web content for reading full articles.

## Getting Started

To get started with the project, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AbuZafor99/News-App.git
   ```
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the app**:
   ```bash
   flutter run
   ```

## Contributing

Contributions are welcome! If you have any suggestions or find any issues, please feel free to open an issue or submit a pull request.
