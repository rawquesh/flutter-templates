# FitLife Pro - Fitness & Workout App

## Project Command
```bash
flutter create --org com.bluetouch.fitlife_pro fitlife_pro
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a fitness and workout mobile application called "FitLife Pro". This is a UI-only template (no state management, no actual API calls) that demonstrates a powerful fitness app interface with energetic animations and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.fitlife_pro --platforms android,ios fitlife_pro`
- **Priority: Android first** - ensure all features work perfectly on Android
- Navigate to the project folder and work entirely within it
- Install any additional packages needed to achieve a premium glassy modern look
- You have Claude Max subscription so DO NOT worry about token costs - be thorough and comprehensive
- **IMPORTANT: Do NOT use any state management packages** (no Provider, Riverpod, Bloc, GetX, etc.) - pure UI only
- Use `adaptive_theme` package for theme switching (install via `flutter pub add adaptive_theme`)

### Theme System (MANDATORY - Must Implement)
Create a theme switcher with 3 distinct themes accessible via a toggle button in the top-right corner of the app bar. **Default Theme: Option 2 (Dark Sidebar + Light Content)** The selected theme must persist visually and be indicated clearly:

1. **Light Theme**: Light sidebar (white/light gray) + light pages (white backgrounds, light cards)
2. **Dark Sidebar Theme**: Dark sidebar + white/light content pages (hybrid approach) **← DEFAULT**
3. **Dark Theme**: Complete dark theme (dark sidebar, dark pages, dark cards)

For the theme toggle UI:
- Use a segmented control or toggle switch in the app bar top-right
- Show current theme with appropriate icons (sun, moon, half-moon for hybrid)
- Animate the theme transition smoothly (300ms fade/slide)

### Color Scheme
- **Primary Color**: Energetic Orange (#FF6B35) or Vibrant Red-Orange (#FF4500)
- **Secondary/Accent**: Electric Blue (#00D4FF) for contrast elements
- **Success/Achieved**: Lime Green (#32CD32) for completed goals
- **Warning**: Yellow (#FFD700) for warnings
- **Background Light**: Dark gray (#1A1A2E) to light gray gradient for energetic feel
- **Background Dark**: Very dark blue-black (#0D0D1A)
- **Card Light**: Semi-transparent white with blur
- **Card Dark**: Semi-transparent dark with blur
- **Sidebar Light**: White with slight transparency
- **Sidebar Dark**: Dark (#141420)
- **Text Primary Light**: White (#FFFFFF) often used in fitness apps
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Light gray (#B0B0B0)
- **Text Secondary Dark**: Gray (#888888)
- **Accent Gradient**: Orange to red gradient for CTAs
- **Progress Colors**: Multi-color for different metrics (heart rate red, steps blue, calories orange)

### Login Page (MANDATORY - First Screen)
Create an energetic, glassmorphism-style login page that reflects the fitness brand:

- **Background**: Dynamic gradient background (dark purple to orange or dark blue to red) with animated floating fitness icons (dumbbells, running figures, hearts)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - FitLife Pro logo/icon at top (flame icon or fitness figure)
  - "Welcome to FitLife Pro" title with "Transform Your Body" tagline
  - Email/username text field with user icon
  - Password text field with visibility toggle and lock icon
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Start Workout" button with gradient and press animation (not just "Sign In")
  - "or continue with" divider
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in animation with scale for the glass card
  - Pulsing glow effect on the main CTA button
  - Floating animation on background fitness elements

**On "Start Workout" / "Sign In" tap**: Navigate to the main app dashboard with a smooth page transition

### Navigation Structure
Create a modern bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (dashboard icon)
- Workouts (dumbbell icon)
- Exercises (figure icon)
- Progress (chart icon)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Home
- My Workouts
- Exercise Library
- Diet & Nutrition
- Meal Planner
- Body Measurements
- Water Tracker
- Challenges
- Progress Stats
- Achievements
- Settings
- Help

### Screens to Build (UI Only)

#### 1. Dashboard/Home Screen
- **Header**:
  - User greeting with name and avatar
  - Notification bell icon
  - Theme toggle
- **Today's Progress Section** (prominent glass cards):
  - Circular progress rings for:
    - Calories burned (with animated fill)
    - Workout duration
    - Steps count
    - Water intake
  - Each with icon, value, goal, and percentage
- **Quick Start Section**:
  - "Start Workout" large glass card with gradient border
  - Recommended workouts horizontal scroll
- **Today's Workout Card**:
  - Workout name, duration, difficulty
  - Exercise count
  - "Begin" button
- **Weekly Streak Section**:
  - 7-day calendar showing workout days
  - Current streak count with flame icon
- **Recent Activity Feed**: List of recent workouts/completed exercises

#### 2. Workouts Screen
- **Header**: "Workouts" title with search and filter
- **Workout Categories Tabs**: All, Strength, Cardio, HIIT, Yoga, Custom
- **Featured Workout** (large card at top):
  - Hero image placeholder (fitness gradient)
  - Workout name, difficulty, duration
  - "Start Now" prominent button
- **Workout List**:
  - Each card includes:
    - Workout thumbnail/icon
    - Name and type
    - Duration and difficulty stars
    - Calories burned estimate
    - Exercise count
    - Favorite heart icon
- **Custom Workout FAB**: Create custom workout button

#### 3. Workout Detail Screen
- **Header Image**: Hero image with workout name overlay, back button
- **Info Bar**: Duration, difficulty, calories, equipment needed
- **Description Section**: Workout overview text
- **Warm-up Section**: List of warm-up exercises
- **Exercise List** (expandable cards):
  - Each exercise card:
    - Exercise icon/placeholder image
    - Name
    - Sets x Reps or Duration
    - Rest time between sets
    - Expandable for demonstration description
- **Equipment Needed List**: Icon + name for each piece
- **Bottom Action Bar**:
  - "Add to Favorites" button
  - "Start Workout" full-width button with gradient

#### 4. Exercise Library Screen
- **Search Bar**: Search exercises by name
- **Filter Chips**: Muscle group (Chest, Back, Legs, Arms, Core, Full Body), Equipment, Difficulty
- **Exercise Grid/List**:
  - Each card:
    - Exercise icon or placeholder image
    - Name
    - Target muscle group badge
    - Difficulty indicator
    - Tap to expand/view details

#### 5. Exercise Detail Screen
- **Header**: Exercise name with video play icon placeholder
- **Target Muscles Diagram**: Body outline with highlighted muscles (or icon representation)
- **Instructions Section**: Step-by-step exercise instructions
- **Tips Section**: Pro tips for proper form
- **Variations**: Alternative exercise options
- **Related Exercises**: Similar exercises

#### 6. Progress Screen
- **Header**: "Your Progress" title with date range selector
- **Summary Stats Cards**:
  - Total workouts this week/month
  - Total calories burned
  - Average workout duration
  - Current streak
- **Weight/Body Metrics Chart** (placeholder chart visualization):
  - Line chart showing progress over time
  - Tap points for details
- **Body Measurements Section**:
  - Chest, Waist, Hips, Arms, Thighs
  - Progress arrows (up/down from last measurement)
- **Achievements Section**:
  - Badge grid showing unlocked achievements
  - Locked achievements shown as dimmed
  - Recent achievement unlocked with celebration animation
- **Workout History Calendar**:
  - Monthly view with workout days highlighted
  - Tap day for details

#### 7. Diet & Nutrition Screen
- **Header**: "Nutrition" title with water tracker
- **Daily Macros Section**:
  - Circular progress for:
    - Calories (consumed/goal)
    - Protein
    - Carbs
    - Fats
  - Glass card with macros breakdown
- **Water Intake Tracker**:
  - Glass card with water drop icon
  - Progress bar or glass icons showing glasses consumed
  - Quick add buttons (+1 glass, +2 glasses)
- **Meal Log Section**:
  - Breakfast, Lunch, Dinner, Snacks tabs or sections
  - Add meal button
  - Each meal shows food items and calories
- **Food Database Search**: Search for food items
- **Recommended Meals**: Meal suggestions

#### 8. Profile Screen
- **Profile Header**:
  - Avatar with edit button
  - Name and member since
  - Level/XP progress bar (Gamification)
  - Current rank badge
- **Stats Overview**:
  - Workouts completed
  - Total time trained
  - Calories burned
  - Days active streak
- **Achievements Showcase**: Featured badges carousel
- **Body Stats Card**:
  - Height, Weight, Body Fat %
  - Goal weight with progress
- **Settings & Preferences**:
  - Units (metric/imperial)
  - Notification preferences
  - Workout reminders
  - Theme settings
- **Menu List**:
  - My Profile
  - Workout History
  - Achievements
  - Settings
  - Help & Support
  - About
  - Logout

#### 9. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards
- **Account Settings**: Edit profile, change password
- **Workout Preferences**:
  - Default rest time
  - Units preference
  - Workout reminders
- **Notification Settings**: Push notifications toggle
- **App Settings**: Language, theme (secondary access)
- **App Version**

#### 10. Meal Planner Screen
- **Header**: "Meal Planner" title with calendar icon
- **Week View Calendar**:
  - Horizontal scrollable week view
  - Day chips with dates
  - Current day highlighted
- **Daily Macros Summary Card**:
  - Circular progress for calories
  - Protein, Carbs, Fat breakdown bars
  - Remaining calories for the day
- **Meal Slots Section**:
  - Each meal slot (Breakfast, Lunch, Dinner, Snacks):
    - Meal type header with icon
    - "Add Meal" button
    - Added meals list:
      - Food item name
      - Calories
      - Serving size
      - Edit/Delete buttons
- **Meal Suggestion Cards**:
  - Horizontal scroll of suggested meals
  - Each card:
    - Meal image placeholder
    - Name
    - Calories
    - "Add to Plan" button
- **Recipe Details** (tap to expand):
  - Ingredients list
  - Nutritional info
  - Preparation time
  - Macros breakdown
- **Shopping List Generation**:
  - "Generate Shopping List" button
  - List of ingredients for planned meals
  - Checkbox to mark purchased

#### 11. Active Workout Session Screen
- **Header**: Workout name with timer
- **Live Timer Display**:
  - Large digital timer (MM:SS)
  - Rest timer (countdown between sets)
  - Total elapsed time
- **Current Exercise Card**:
  - Exercise name (large)
  - Exercise illustration placeholder
  - Current set / Total sets
  - Target reps or duration
- **Exercise Queue**:
  - "Up Next" section showing next 2 exercises
  - Swipe to skip option
- **Set Progress Dots**:
  - Visual dots for sets
  - Completed sets filled
  - Current set highlighted
  - Failed/skipped sets marked
- **Controls Bar**:
  - Play/Pause button
  - Skip exercise button
  - End workout button
- **Rest Timer Overlay**:
  - Full screen overlay during rest
  - Countdown timer (30s, 60s, 90s options)
  - Skip rest button
  - Next exercise preview
- **Quick Log Section**:
  - Weight input for each set
  - Reps counter (+/-)
  - Check mark to log set
- **Elapsed Calories Card**:
  - Real-time calorie burn estimate
  - Heart rate indicator (if available)
- **Workout Summary** (after completion):
  - Total duration
  - Exercises completed
  - Sets completed
  - Calories burned
  - Personal records achieved
  - "Share Workout" button

#### 12. Body Measurements Screen
- **Header**: "Body Stats" title
- **Current Stats Overview Card**:
  - Key measurements display:
    - Weight (with trend arrow)
    - Body Fat %
    - BMI (with status indicator)
- **Measurement Graph Section**:
  - Line chart showing weight over time
  - Time range selector (1W, 1M, 3M, 6M, 1Y, All)
  - Tap points for details
- **Body Part Measurements**:
  - Expandable sections for:
    - **Chest**: Current, goal, progress bar
    - **Waist**: Current, goal, progress bar
    - **Hips**: Current, goal, progress bar
    - **Arms**: Current, goal, progress bar
    - **Thighs**: Current, goal, progress bar
    - **Calves**: Current, goal, progress bar
  - Each section:
    - Measurement input field
    - Date recorded
    - Change from last measurement
- **Add Measurement Button**:
  - Floating action button
  - Bottom sheet with measurement form
  - Body diagram to select area
- **Progress Photos Section**:
  - Photo gallery placeholder
  - Compare before/after
  - Add new photo button
- **Goals Section**:
  - Target weight input
  - Target date
  - Weekly goal calculation
  - Progress percentage
- **Measurement History List**:
  - Date-wise list of all recordings
  - Export data option

#### 13. Water Tracker Screen
- **Header**: "Hydration" title
- **Daily Progress Ring**:
  - Large circular progress:
    - Glasses consumed / Goal
    - Percentage complete
    - Animated fill on load
- **Quick Add Section**:
  - Glass size buttons:
    - Small (250ml)
    - Medium (350ml)
    - Large (500ml)
    - Custom amount
  - One-tap add functionality
  - Animated ripple effect on add
- **Water Log Timeline**:
  - Hourly breakdown of water intake
  - Visual timeline with glasses icons
  - Time stamps for each entry
- **Drink Types Section**:
  - Categories:
    - Water
    - Sparkling Water
    - Juice
    - Tea
    - Coffee
    - Sports Drink
  - Each with icon and hydration factor
- **Hydration Stats Card**:
  - Today's intake
  - Average this week
  - Best streak (consecutive days meeting goal)
- **Reminders Section**:
  - "Set Reminder" button
  - Time-based reminder chips
  - Custom interval setting
- **Weekly Overview Chart**:
  - Bar chart of daily intake
  - Goal line indicator
  - Color coding (met/not met)
- **Benefits Info Card**:
  - Educational content
  - Why hydration matters
  - Signs of dehydration

#### 14. Challenges Screen
- **Header**: "Challenges" title
- **Active Challenge Banner**:
  - Current challenge card (if any):
    - Challenge name and image
    - Days remaining
    - Progress percentage
    - Your rank/ranking
- **Challenge Categories Tabs**:
  - Active
  - Upcoming
  - Completed
  - Community
- **Available Challenges Grid**:
  - Challenge cards:
    - Challenge thumbnail/icon
    - Name
    - Duration
    - Participant count
    - Difficulty level
    - "Join" or "Joined" button
- **Challenge Types**:
  - **Daily Challenges**:
    - "Complete 3 workouts this week"
    - "Log your meals for 5 days"
    - "Drink 8 glasses of water daily"
  - **Milestone Challenges**:
    - "Complete 100 workouts"
    - "Burn 10,000 calories"
    - "Hit your goal weight"
  - **Community Challenges**:
    - Leaderboard rankings
    - Team challenges
    - Social accountability
- **Challenge Detail Screen**:
  - Full challenge info:
    - Description
    - Requirements
    - Duration and dates
    - Rewards/points
    - Rules and eligibility
  - Leaderboard section:
    - Top 10 participants
    - Your position highlighted
    - Points/scores
  - Progress tracker:
    - Your current progress
    - What's needed to complete
    - Estimated completion date
- **Rewards Section**:
  - Points earned from challenges
  - Badges unlocked
  - Milestone achievements
- **Completed Challenges Archive**:
  - Past challenge certificates
  - Statistics
  - Share achievements

### UI Components Library
Create reusable glassmorphism components:
- GlassCard (with blur, border, shadow)
- GlassButton (primary gradient, secondary, outline)
- GlassTextField
- GlassToggle
- GlassProgressRing (circular progress with animation)
- GlassProgressBar (linear progress)
- GlassBottomNav
- GlassChip (for filters, muscle groups)
- GlassDialog
- GlassBadge (streak, level, achievement)
- GlassAvatar (with level indicator ring)
- GlassBottomSheet (for modals)
- AnimatedBackground (fitness-themed floating elements)
- WorkoutCard (workout summary)
- ExerciseCard (exercise item)
- MacroRing (circular macro display)
- StreakCalendar (7-day workout streak)
- StatCard (single stat display)
- AchievementBadge
- ShimmerLoading

### Animations Requirements
- **Page Transitions**: Smooth slide/fade transitions
- **Progress Rings**: Animated fill on load (count-up animation)
- **Workout Start**: Exciting animation for workout beginning
- **Achievement Unlock**: Celebration animation with confetti effect
- **Streak Fire**: Animated flame icon for active streaks
- **Bottom Nav**: Smooth indicator slide with bounce
- **Cards**: Scale effect on tap
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating fitness elements
- **List Items**: Staggered fade-in
- **Charts**: Draw-in animation for progress lines

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-25
- **Gradients**: Orange-red gradients for CTAs, energetic backgrounds
- **Borders**: Subtle white/glow borders on glass elements
- **Border Radius**: Rounded corners (16-24 radius)
- **Progress Visualization**: Circular rings, linear bars, charts
- **Typography**: Bold, modern sans-serif (Poppins or similar)
- **Iconography**: Filled icons for active states, outlined for inactive

### Technical Requirements
- Material Design 3 as base
- Mobile-first responsive design
- All images as gradient placeholders or icons
- Use Material Icons
- Shimmer loading effects
- 60fps smooth animations
- Package recommendations:
  - google_fonts
  - flutter_animate
  - shimmer
  - fl_chart (for progress charts)
  - adaptive_theme (for theme switching)
  - any other UI enhancement packages
- **Android Build Requirement**: After completing all code, verify the app builds successfully with `flutter build apk --debug`

### File Structure
```
lib/
├── main.dart
├── theme/
│   ├── app_theme.dart
│   ├── colors.dart
│   └── theme_provider.dart
├── screens/
│   ├── login/
│   │   └── login_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── workouts/
│   │   ├── workouts_screen.dart
│   │   └── workout_detail_screen.dart
│   ├── exercises/
│   │   ├── exercises_screen.dart
│   │   └── exercise_detail_screen.dart
│   ├── progress/
│   │   └── progress_screen.dart
│   ├── diet/
│   │   └── diet_screen.dart
│   ├── meal_planner/
│   │   └── meal_planner_screen.dart
│   ├── active_workout/
│   │   └── active_workout_screen.dart
│   ├── body_measurements/
│   │   └── body_measurements_screen.dart
│   ├── water_tracker/
│   │   └── water_tracker_screen.dart
│   ├── challenges/
│   │   ├── challenges_screen.dart
│   │   └── challenge_detail_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── glass_card.dart
│   ├── glass_button.dart
│   ├── glass_text_field.dart
│   ├── glass_toggle.dart
│   ├── glass_progress_ring.dart
│   ├── glass_progress_bar.dart
│   ├── glass_bottom_nav.dart
│   ├── glass_chip.dart
│   ├── glass_dialog.dart
│   ├── glass_badge.dart
│   ├── glass_avatar.dart
│   ├── glass_bottom_sheet.dart
│   ├── workout_card.dart
│   ├── exercise_card.dart
│   ├── macro_ring.dart
│   ├── streak_calendar.dart
│   ├── stat_card.dart
│   ├── achievement_badge.dart
│   ├── meal_slot_card.dart
│   ├── workout_timer.dart
│   ├── rest_timer_overlay.dart
│   ├── measurement_chart.dart
│   ├── water_progress_ring.dart
│   ├── challenge_card.dart
│   ├── leaderboard_tile.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with energetic glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Dashboard with progress rings and stats
- [ ] Workouts screen with categories
- [ ] Workout detail with exercise list
- [ ] Exercise library with filters
- [ ] Progress screen with charts and achievements
- [ ] Diet/nutrition tracking UI
- [ ] Meal Planner with macros tracking
- [ ] Active Workout Session with timer and controls
- [ ] Body Measurements with graphs
- [ ] Water Tracker with quick add
- [ ] Challenges with leaderboard
- [ ] Profile with gamification elements
- [ ] Consistent glassmorphism style throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Fitness-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to dashboard
4. All navigation works (bottom nav, back buttons)
5. All screens have proper fitness content
6. Progress visualizations look good
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
