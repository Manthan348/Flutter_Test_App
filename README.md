# Flutter_Test_App
Use the provided UI reference to implement the Flutter interview test in this repository:

`https://github.com/Manthan348/Flutter_Test_App`

The objective is to recreate the provided design accurately while maintaining clean, scalable, and production-quality Flutter code.

### Functional Requirements

Implement the complete flow shown in the reference design.

* Manager's Team View dashboard
* Team Performance screen
* Team's Task screen
* Open tasks section
* Overdue tasks section
* Closed tasks section
* Team member selection
* Duration selection
* Task filtering
* Task sorting
* Navigation between all relevant screens
* Working back navigation
* Proper empty/loading states where applicable

The duration options should include:

* Today
* Week
* Month
* Quarter
* Annual
* Till Date
* Date Range

The Team Performance screen should show the relevant information for each team member, including:

* Team member name
* Profile image/avatar
* Total tasks
* Open tasks
* Overdue tasks
* Closed tasks
* Visual task-performance representation

The Team's Task screen should display task information according to the selected status, including:

* Task title
* Assigned team member
* Profile image/avatar
* Due date/time where applicable
* Overdue information where applicable
* Closed status where applicable

Filters, tabs, dropdowns, team-member selection, duration selection, and sorting should behave correctly and update the displayed information accordingly.

Mock/local data can be used where backend/API details are not provided.

### UI Requirements

The provided image must be treated as the main visual reference.

Match the design as closely as possible in terms of:

* Layout
* Spacing
* Alignment
* Typography
* Borders
* Cards
* Tabs
* Buttons
* Icons
* Colors
* Dropdowns
* Charts
* Visual hierarchy

The UI must be fully dynamic and responsive based on the device size.

Do not create the UI specifically for only the resolution shown in the reference image.

The application should maintain a consistent appearance across different mobile screen sizes and aspect ratios.

There should be no:

* UI overflow
* Clipped content
* Broken alignment
* Unnecessary empty space
* Overlapping components
* Distorted cards
* Text overflow

Cards, charts, buttons, tabs, lists, dropdowns, and other UI elements should adapt correctly according to the available screen space.

The application should work properly on both smaller and larger mobile devices.

### Code Quality Requirements

Follow a proper and scalable Flutter project structure.

Do not place the complete implementation inside one file.

Keep responsibilities properly separated for:

* Screens
* Reusable UI components
* Models
* Data
* Business/state logic
* Navigation
* Theme-related configuration
* Shared utilities/constants where required

Avoid duplicate implementations.

Common UI components should be reusable wherever possible.

Open, Overdue, and Closed task states should not be implemented as three completely duplicated screens.

Keep the code:

* Clean
* Readable
* Maintainable
* Modular
* Null-safe
* Consistently formatted
* Easy to extend

Avoid:

* Large unnecessary files
* Duplicate code
* Repeated hardcoded values
* Unnecessary dependencies
* Unnecessary architecture complexity
* Unrelated functionality
* Unrelated UI changes

### Data Handling

Maintain task and team-member information using properly structured data models.

Task data should support:

* Status
* Assignee
* Task title
* Due date/time
* Filtering
* Sorting

Team performance values should remain consistent with the task data.

Changing filters, task status, duration, or selected team member should correctly update the displayed results.

### Repository Requirements

Use the existing repository:

`https://github.com/Manthan348/Flutter_Test_App`

Maintain a clean and professional repository structure.

Do not add unnecessary files or packages.

Update the README with:

* Project description
* Setup instructions
* Steps to run the application
* Short overview of implemented functionality

### Final Verification

Before considering the assignment complete:

* Make sure the application builds successfully.
* Make sure there are no analysis errors related to the implementation.
* Format the complete codebase properly.
* Verify all navigation.
* Verify all tabs.
* Verify team-member selection.
* Verify duration selection.
* Verify filtering.
* Verify sorting.
* Verify Open tasks.
* Verify Overdue tasks.
* Verify Closed tasks.
* Verify responsive behaviour on multiple mobile screen sizes.
* Verify there are no UI overflow or clipping issues.
* Verify the implementation remains visually close to the provided reference.

The final submission should demonstrate strong Flutter development practices, accurate UI implementation, responsiveness, code reusability, and maintainable project organization.
