# MediCare+ - Medical & Healthcare App

## Project Command
```bash
flutter create --org com.bluetouch.medicare_plus medicare_plus
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a medical and healthcare mobile application called "MediCare+". This is a UI-only template (no state management, no actual API calls) that demonstrates a professional healthcare app interface.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.medicare_plus medicare_plus`
- Navigate to the project folder and work entirely within it
- Install any additional packages needed to achieve a premium glassy modern look
- You have Claude Max subscription so DO NOT worry about token costs - be thorough and comprehensive

### Theme System (MANDATORY - Must Implement)
Create a theme switcher with 3 distinct themes accessible via a toggle button in the top-right corner of the app bar. The selected theme must persist visually and be indicated clearly:

1. **Light Theme**: Light sidebar (white/light gray) + light pages (white backgrounds, light cards)
2. **Dark Sidebar Theme**: Dark sidebar + white/light content pages (hybrid approach)
3. **Dark Theme**: Complete dark theme (dark sidebar, dark pages, dark cards)

For the theme toggle UI:
- Use a segmented control or toggle switch in the app bar top-right
- Show current theme with appropriate icons (sun, moon, half-moon for hybrid)
- Animate the theme transition smoothly (300ms fade/slide)

### Color Scheme
- **Primary Color**: Blue (#2196F3 or similar medical blue)
- **Secondary/Accent**: Teal (#00BCD4) or Cyan
- **Success/Health Positive**: Green (#4CAF50)
- **Warning/Alert**: Orange (#FF9800)
- **Error/Emergency**: Red (#F44336)
- **Background Light**: Off-white (#F8FAFB)
- **Background Dark**: Dark gray (#121212 or #1E1E1E)
- **Card Light**: White (#FFFFFF) with subtle shadow
- **Card Dark**: Dark elevated (#2D2D2D)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#1A1A1A)
- **Text Primary Light**: Dark gray (#212121)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Medium gray (#757575)
- **Text Secondary Dark**: Light gray (#B0B0B0)

### Login Page (MANDATORY - First Screen)
Create a beautiful, glassmorphism-style login page that is the entry point of the app:

- **Background**: Gradient background (blue to purple or blue to teal) with subtle animated shapes/blobs
- **Glassmorphism Card**: Centered frosted glass card containing:
  - App logo/icon at top (medical cross or heartbeat icon)
  - "Welcome to MediCare+" title with subtitle
  - Email/username text field with icon and validation styling
  - Password text field with visibility toggle and icon
  - "Remember me" checkbox with custom styling
  - "Forgot Password?" link aligned right
  - Large "Sign In" button with gradient and press animation
  - Social login options (Google, Apple) with icons
  - "Don't have an account? Sign Up" link at bottom
- **Animations**:
  - Fade-in animation for the glass card on load (500ms delay)
  - Subtle floating animation on background shapes
  - Button scale animation on tap
  - Text field focus animations (border color transition)

**On "Sign In" tap**: Navigate to the main app dashboard with a smooth page transition (hero animation on logo or fade-slide)

### Navigation Structure
Create a responsive sidebar/drawer navigation with the following sections:

**Sidebar (Navigation Rail on mobile, Drawer on larger screens)**:
- User profile section at top with avatar, name, and role
- Menu items with icons and labels:
  1. Dashboard (home icon)
  2. Doctors (stethoscope icon)
  3. Appointments (calendar icon)
  4. Health Records (file icon)
  5. Medicines (pill icon)
  6. Health Tips (lightbulb icon)
  7. Profile (user icon)
  8. Settings (gear icon) - includes theme switcher

### Screens to Build (UI Only)

#### 1. Dashboard Screen
- **Header**: Greeting with user name, current date, profile avatar
- **Quick Actions Row**: 4 glassmorphism cards for:
  - Book Appointment
  - Find Doctor
  - Health Check
  - Emergency Call
- **Health Metrics Section**: 
  - Heart rate, Blood pressure, Sleep hours, Steps
  - Each in a glass card with icon, value, and trend indicator
- **Upcoming Appointments**: Horizontal scrollable list of appointment cards
- **Health Tips Carousel**: Swipeable cards with health tips
- **Bottom Navigation Bar**: Home, Doctors, Appointments, Profile (4 items)

#### 2. Doctors Screen
- **Search Bar**: Glassmorphism style with search icon
- **Filter Chips**: Specialties (Cardiologist, Dentist, General, etc.)
- **Doctor Cards Grid/List**:
  - Avatar image placeholder
  - Name, specialty, rating stars
  - Experience years badge
  - "Book Now" button
  - Favorite heart icon toggle
- **Floating Action Button**: For quick booking

#### 3. Appointments Screen
- **Tab Bar**: Upcoming, Completed, Cancelled
- **Appointment Cards**:
  - Doctor info (avatar, name, specialty)
  - Date and time with calendar icon
  - Location/Clinic name
  - Status badge (Confirmed, Pending, Completed)
  - Action buttons (Reschedule, Cancel, Join Call)

#### 4. Health Records Screen
- **Category Tabs**: Reports, Prescriptions, Vaccinations, History
- **Record Cards**:
  - Document type icon
  - Title and date
  - Doctor name who created
  - Preview thumbnail or PDF icon
  - Download/Share buttons

#### 5. Medicines Screen
- **Today's Medicines Section**:
  - Time-based grouping (Morning, Afternoon, Evening, Night)
  - Medicine cards with name, dosage, instructions
  - Checkbox to mark as taken (UI only)
- **All Medicines Tab**: Searchable list of all prescriptions
- **Add Medicine FAB**

#### 6. Health Tips Screen
- **Tip Categories**: Diet, Exercise, Sleep, Mental Health
- **Tip Cards**:
  - Hero image placeholder
  - Title and brief description
  - Reading time indicator
  - "Read More" link
  - Bookmark icon

#### 7. Profile Screen
- **Profile Header**:
  - Large avatar with edit button
  - Name, email, phone
  - Member since date
  - Health score badge
- **Stats Row**: Appointments, Reports, Medicines saved
- **Settings List**:
  - Edit Profile
  - Notification Settings
  - Privacy & Security
  - Help & Support
  - About
  - Logout

#### 8. Settings Screen (accessible from Profile or Sidebar)
- **Theme Switcher** (large, prominent): The 3 theme options as cards/buttons
- Account Settings
- Notification Preferences
- Language Selection
- Privacy Settings
- App Version info

### UI Components Library
Create reusable glassmorphism components:
- GlassCard (with blur, border, shadow)
- GlassButton (primary, secondary, outline variants)
- GlassTextField (with icons, validation states)
- GlassToggle (for theme switcher)
- GlassChip (for filters/tags)
- GlassAvatar (with border glow)
- GlassBadge (for notifications, status)
- GlassBottomNav
- GlassSidebar
- GlassDialog

### Animations Requirements
- **Page Transitions**: Smooth slide/fade between screens
- **List Items**: Staggered fade-in on load
- **Cards**: Subtle hover/press scale effect
- **Buttons**: Ripple effect + scale down on press
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating gradient blobs
- **Icons**: Bounce animation on selection
- **Navigation**: Smooth indicator slide in bottom nav

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, buttons, navigation elements
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Borders**: Subtle white/transparent borders on glass elements
- **Shadows**: Soft, diffused shadows (not harsh)
- **Border Radius**: Rounded corners (16-24 radius for cards)
- **Spacing**: Generous padding (16-24 dp)
- **Typography**: Clean, modern sans-serif (use Poppins or similar from Google Fonts)

### Technical Requirements
- Use Material Design 3 as base
- Implement proper responsive layout (mobile-first)
- All images should be gradient placeholders or icons (no external image dependencies)
- Use Icons.outlined and Icons.filled from Material Icons
- Add shimmer loading effects placeholders for any lists
- Include smooth 60fps animations throughout
- Package.json or pubspec.yaml should include:
  - google_fonts
  - flutter_animate or similar for animations
  - any other UI enhancement packages you deem necessary

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
│   ├── dashboard/
│   │   └── dashboard_screen.dart
│   ├── doctors/
│   │   └── doctors_screen.dart
│   ├── appointments/
│   │   └── appointments_screen.dart
│   ├── health_records/
│   │   └── health_records_screen.dart
│   ├── medicines/
│   │   └── medicines_screen.dart
│   ├── health_tips/
│   │   └── health_tips_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── glass_card.dart
│   ├── glass_button.dart
│   ├── glass_text_field.dart
│   ├── glass_toggle.dart
│   ├── glass_avatar.dart
│   ├── glass_bottom_nav.dart
│   ├── glass_sidebar.dart
│   ├── glass_chip.dart
│   ├── glass_dialog.dart
│   ├── glass_badge.dart
│   ├── animated_background.dart
│   ├── shimmer_loading.dart
│   └── doctor_card.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] All 8+ screens implemented with full UI
- [ ] Consistent glassmorphism style throughout
- [ ] Smooth animations on all interactions
- [ ] Responsive on different screen sizes
- [ ] No state management (pure UI)
- [ ] No placeholder text like "Lorem ipsum" - use contextual healthcare text
- [ ] Icons properly aligned and sized
- [ ] Loading states/shimmer effects on lists
- [ ] Empty states designed (for lists with no data)

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes
3. Login navigates to dashboard
4. All navigation works (sidebar, bottom nav, back buttons)
5. All screens have proper content and look production-ready
6. No crashes, no layout overflow, no missing assets
