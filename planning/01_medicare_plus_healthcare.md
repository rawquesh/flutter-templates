# MediCare+ - Medical & Healthcare App

## Project Command
```bash
flutter create --org com.bluetouch.medicare_plus medicare_plus
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a medical and healthcare mobile application called "MediCare+". This is a UI-only template (no state management, no actual API calls) that demonstrates a professional healthcare app interface.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.medicare_plus --platforms android,ios medicare_plus`
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
  7. Video Consultation (video icon)
  8. Symptom Checker (clipboard icon)
  9. Emergency (emergency icon)
  10. Health Articles (book icon)
  11. Profile (user icon)
  12. Settings (gear icon) - includes theme switcher

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

#### 7. Video Consultation Screen
- **Header**: "Video Consultation" title with filter icon
- **Available Specialists Section**:
  - Horizontal scroll of specialist cards:
    - Doctor avatar and name
    - Specialty
    - Rating and review count
    - Available time slots
    - "Book Now" button
- **Upcoming Consultations Card**:
  - Next scheduled consultation details
  - Countdown to appointment
  - "Join Call" button (enabled when time)
  - "Reschedule" and "Cancel" options
- **Consultation History**:
  - Tab: Past consultations list
  - Each card:
    - Doctor info
    - Date and duration
    - Summary/notes
    - "View Summary" button
- **How It Works Section**:
  - 3-step illustration cards:
    1. Book a specialist
    2. Join via app
    3. Get prescription
- **Guidelines Card**:
  - Tips for a good video consultation
  - Technical requirements
  - Privacy assurance

#### 8. Symptom Checker Screen
- **Header**: "Symptom Checker" title with info icon
- **Search/Input Section**:
  - Large search bar: "Describe your symptoms..."
  - Popular symptoms chips: Headache, Fever, Cough, Fatigue, etc.
- **Body Map Section** (optional):
  - Tap on body regions to select symptoms
  - Highlight selected areas
- **Symptom Cards List**:
  - Each card with:
    - Symptom name
    - Severity selector (Mild, Moderate, Severe)
    - Duration input
    - Add/remove button
- **Analysis Section**:
  - "Analyze Symptoms" button
  - Loading animation during analysis
- **Results Card** (after analysis):
  - Possible conditions list with probability
  - "Learn more" expandable sections
  - Urgency indicator (Self-care, See Doctor, Urgent Care)
  - Disclaimer: "Not a medical diagnosis"
- **Recommended Actions**:
  - Suggested specialists to consult
  - Self-care tips
  - When to seek help
- **Emergency Banner**:
  - Red banner if severe symptoms detected
  - "Call Emergency" button prominently displayed

#### 9. Emergency Screen
- **Header**: "Emergency" title with large red emergency button
- **Emergency Contacts Section**:
  - Large "Call Emergency Services" button (911/112)
  - Hospital Ambulance button
  - Poison Control button
- **Quick Access Cards**:
  - Nearest Hospital (with distance)
  - Emergency Room Wait Times
  - 24/7 Pharmacies
  - Emergency Contacts (customizable list)
- **My Emergency Info Card**:
  - Blood type
  - Allergies (prominent display)
  - Medical conditions
  - Current medications
  - Insurance info quick view
  - Edit button
- **ICE Contacts**:
  - In Case of Emergency contacts
  - One-tap call buttons
  - Share location option
- **Nearby Services Map**:
  - Map placeholder showing:
    - Hospitals
    - Pharmacies
    - Urgent care
  - Current location indicator
- **Medical ID Badge**:
  - Large display of critical info
  - Share via QR code option
  - Access even when phone locked (feature description)

#### 10. Health Articles Screen
- **Header**: "Health Library" title with search
- **Featured Article Hero**:
  - Large article card at top
  - Title, category, reading time
  - "Featured" badge
- **Categories Section**:
  - Horizontal scrollable category chips:
    - All
    - Disease Prevention
    - Nutrition
    - Fitness
    - Mental Health
    - Women's Health
    - Men's Health
    - Children's Health
    - Senior Care
    - First Aid
- **Trending Articles Grid**:
  - 2-column grid of article cards:
    - Article thumbnail/icon
    - Title (2 lines max)
    - Category badge
    - Reading time
    - Bookmark icon
- **Article Detail Screen** (tap to navigate):
  - Hero image
  - Article title and subtitle
  - Author info with avatar
  - Publication date
  - Reading time
  - Share buttons
  - Article content sections:
    - Introduction
    - Key points (bulleted)
    - Detailed sections
    - Summary
    - Related articles
  - Comments section
  - Rate this article
- **Bookmarked Articles** (accessible from profile):
  - Saved articles list
  - "Read Now" button
  - Remove bookmark option
- **Daily Health Tip**:
  - Featured tip of the day
  - Push notification opt-in

#### 11. Profile Screen
- **Profile Header**:
  - Large avatar with edit button
  - Name, email, phone
  - Member since date
  - Health score badge
- **Stats Row**: Appointments, Reports, Medicines saved, Consultations
- **Health Summary Card**:
  - Blood type
  - Allergies summary
  - Conditions
  - Quick view of vitals history
- **Settings List**:
  - Edit Profile
  - Emergency Info
  - Notification Settings
  - Privacy & Security
  - Help & Support
  - About
  - Logout

#### 12. Settings Screen (accessible from Profile or Sidebar)
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
  - shimmer
  - adaptive_theme (for theme switching)
  - any other UI enhancement packages you deem necessary
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
│   ├── video_consultation/
│   │   ├── video_consultation_screen.dart
│   │   └── consultation_detail_screen.dart
│   ├── symptom_checker/
│   │   └── symptom_checker_screen.dart
│   ├── emergency/
│   │   └── emergency_screen.dart
│   ├── health_articles/
│   │   ├── health_articles_screen.dart
│   │   └── article_detail_screen.dart
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
│   ├── doctor_card.dart
│   ├── consultation_card.dart
│   ├── symptom_card.dart
│   ├── article_card.dart
│   └── emergency_contact_card.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] All 12+ screens implemented with full UI
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
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to dashboard
4. All navigation works (sidebar, bottom nav, back buttons)
5. All screens have proper content and look production-ready
6. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
7. No crashes, no layout overflow, no missing assets
