# RESIDE – Flutter Interview Assignment

A responsive Flutter implementation of the RESIDE manager team dashboard, team performance and task management flow. The app uses local mock data because no API/backend contract is supplied.

## Implemented screens

- Manager dashboard with task, property and opportunity summary cards.
- Team member selector and duration selector (Today, Week, Month, Quarter, Annual, Till Date and Date Range).
- Team Performance cards with open, overdue and closed counts and a custom-painted donut chart.
- Team's Task screen with Open, Overdue and Closed tabs.
- Team member filtering, sort by due date or task name, and ascending/descending order.
- Navigation and back navigation between screens.

## Project structure

```text
lib/
  components/       Reusable cards, avatars, dropdowns and chart card
  data/             Local mock data
  models/           Team member and task models
  screens/          Dashboard, performance and task list screens
  theme/            Shared theme and colors
  routes.dart       Named routes
  main.dart         App entry point
```

## Run locally

1. Install Flutter SDK and Android Studio (Android SDK).
2. Connect an Android phone with USB debugging enabled, or start an Android emulator.
3. From the project root run:

   ```bash
   flutter pub get
   flutter devices
   flutter run
   ```

No third-party Flutter package is required; the implementation uses Flutter Material widgets and local sample data.

## Notes

The UI is designed to adapt to different mobile widths using flexible rows, expanded cards and scrollable content. The Date Range option is included in the duration control; a real date-range picker can be connected when the assignment's business logic/API is known.
