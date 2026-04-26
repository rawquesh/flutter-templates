# MediCare+ Implementation Plan

## Phase 1: Foundation (Setup & Core Infrastructure)

### Step 1: Project Initialization
- [ ] Create Flutter project: `flutter create --org com.bluetouch.medicare_plus --platforms android,ios medicare_plus`
- [ ] Add dependencies to pubspec.yaml:
  ```yaml
  dependencies:
    google_fonts: ^6.2.1
    flutter_animate: ^4.5.0
    shimmer: ^3.0.0
    adaptive_theme: ^3.6.0
  ```
- [ ] Run `flutter pub get`
- [ ] Verify shell project builds: `flutter build apk --debug`

### Step 2: Theme System
- [ ] Create `lib/theme/colors.dart` — Define all color constants from spec (lines 33-48)
- [ ] Create `lib/theme/app_theme.dart` — Build 3 ThemeData objects:
  - Light Theme (sidebar white, pages white)
  - Dark Sidebar Theme (sidebar dark #1A1A1A, pages white) **← DEFAULT**
  - Dark Theme (sidebar dark, pages dark #121212)
- [ ] Create `lib/theme/theme_provider.dart` — Wrap app with AdaptiveTheme, persist default
- [ ] Create `lib/utils/constants.dart` — Shared constants (border radius, padding, blur sigma)

### Step 3: Glass Widget Library (Critical Path)
Build in dependency order:

1. **GlassCard** (`lib/widgets/glass_card.dart`)
   - backdropFilter with blur 10-20
   - Semi-transparent white/dark fill
   - Subtle border (white 0.2 opacity)
   - Soft shadow

2. **GlassButton** (`lib/widgets/glass_button.dart`)
   - Variants: primary (gradient), secondary, outline
   - Press animation (scale 0.95)
   - Ripple effect

3. **GlassTextField** (`lib/widgets/glass_text_field.dart`)
   - Icon prefix support
   - Focus animation (border color)
   - Validation styling

4. **GlassBottomNav** (`lib/widgets/glass_bottom_nav.dart`)
   - 4 items: Home, Doctors, Appointments, Profile
   - Animated indicator slide
   - Glassmorphism style

5. **GlassSidebar** (`lib/widgets/glass_sidebar.dart`)
   - 12 menu items with icons
   - User profile section at top
   - Theme switcher integration
   - Responsive: drawer on mobile, rail on tablet

6. **Supporting Widgets** (can be built in parallel):
   - `GlassChip` — For filter chips
   - `GlassAvatar` — Avatar with border glow
   - `GlassBadge` — Status/notification badges
   - `GlassDialog` — Modal dialogs
   - `GlassToggle` — Theme toggle control

### Step 4: Shared Components
- [ ] `AnimatedBackground` — Floating gradient blobs for login
- [ ] `ShimmerLoading` — Shimmer placeholder widget
- [ ] `DoctorCard` — Reusable doctor card widget
- [ ] `AppointmentCard` — Reusable appointment card
- [ ] `SymptomCard` — Reusable symptom card
- [ ] `ArticleCard` — Reusable article card
- [ ] `EmergencyContactCard` — Emergency contact card

---

## Phase 2: Core Screens

### Step 5: Login Screen
**File**: `lib/screens/login/login_screen.dart`

- [ ] Gradient background (blue #2196F3 to teal #00BCD4)
- [ ] AnimatedBackground with floating blobs
- [ ] GlassCard centered with:
  - Medical icon/logo at top
  - "Welcome to MediCare+" title
  - Email TextField (GlassTextField)
  - Password TextField with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - "Sign In" GlassButton (primary gradient)
  - Social login row (Google, Apple icons)
  - "Don't have an account? Sign Up" link
- [ ] Animations:
  - Card fade-in on load (500ms delay)
  - Button scale on tap
  - Text field focus transitions
- [ ] On Sign In: Navigate to Dashboard with hero animation on logo

### Step 6: Dashboard Screen
**File**: `lib/screens/dashboard/dashboard_screen.dart`

- [ ] AppBar with greeting, date, avatar
- [ ] Quick Actions Row — 4 GlassCards (Book, Find Doctor, Health Check, Emergency)
- [ ] Health Metrics Section — Horizontal scroll:
  - Heart rate, Blood pressure, Sleep, Steps
  - Each with icon, value, trend indicator
- [ ] Upcoming Appointments — Horizontal scrollable list
- [ ] Health Tips Carousel — Swipeable cards
- [ ] Bottom Navigation Bar (GlassBottomNav)
- [ ] Sidebar navigation drawer

### Step 7: Doctors Screen
**File**: `lib/screens/doctors/doctors_screen.dart`

- [ ] GlassTextField search bar
- [ ] Filter chips row (Cardiologist, Dentist, General, etc.)
- [ ] Doctor list/grid using DoctorCard widget
  - Avatar placeholder, name, specialty, rating
  - Experience badge, Book Now button, favorite icon
- [ ] Floating Action Button for quick booking

### Step 8: Appointments Screen
**File**: `lib/screens/appointments/appointments_screen.dart`

- [ ] Tab bar: Upcoming, Completed, Cancelled
- [ ] Appointment cards using AppointmentCard widget:
  - Doctor info, date/time, location, status badge
  - Action buttons (Reschedule, Cancel, Join Call)
- [ ] Empty state for each tab

### Step 9: Profile Screen
**File**: `lib/screens/profile/profile_screen.dart`

- [ ] Large avatar with edit button
- [ ] Name, email, phone, member since
- [ ] Health score badge
- [ ] Stats row (appointments, reports, medicines, consultations)
- [ ] Health summary card (blood type, allergies, conditions)
- [ ] Settings list (Edit Profile, Emergency Info, Notifications, etc.)

---

## Phase 3: Secondary Screens

### Step 10: Health Records Screen
**File**: `lib/screens/health_records/health_records_screen.dart`

- [ ] Category tabs: Reports, Prescriptions, Vaccinations, History
- [ ] Record cards with icons, titles, dates, doctor names
- [ ] Download/Share buttons
- [ ] Empty states for each category

### Step 11: Medicines Screen
**File**: `lib/screens/medicines/medicines_screen.dart`

- [ ] Tab: Today's Medicines
  - Time groupings: Morning, Afternoon, Evening, Night
  - Medicine cards with name, dosage, instructions
  - Checkbox UI (mark as taken — visual only)
- [ ] Tab: All Medicines
  - Searchable list
  - Add Medicine FAB

### Step 12: Health Tips Screen
**File**: `lib/screens/health_tips/health_tips_screen.dart`

- [ ] Category chips: Diet, Exercise, Sleep, Mental Health
- [ ] Tip cards with hero placeholder, title, description, reading time
- [ ] Bookmark icon
- [ ] "Read More" navigation

### Step 13: Video Consultation Screen
**File**: `lib/screens/video_consultation/video_consultation_screen.dart`

- [ ] Available Specialists — horizontal scroll:
  - Doctor avatar, name, specialty, rating, time slots, Book Now
- [ ] Upcoming Consultation card:
  - Doctor info, countdown (static display, not live timer)
  - Join Call button (shown as enabled for demo)
  - Reschedule/Cancel options
- [ ] Consultation History tab:
  - Past consultations with doctor info, date, duration
  - View Summary button
- [ ] How It Works — 3-step cards
- [ ] Guidelines card

**Note**: All states are UI-only. Countdown shows static time. Join button is visually enabled.

### Step 14: Symptom Checker Screen
**File**: `lib/screens/symptom_checker/symptom_checker_screen.dart`

- [ ] Search bar: "Describe your symptoms..."
- [ ] Popular symptoms chips (static, non-interactive)
- [ ] Body map section: **SKIP** — too complex for UI template
  - Instead: Simple symptom list with severity chips
- [ ] Symptom cards list:
  - Symptom name, severity (Mild/Moderate/Severe chips), duration
  - Add/remove buttons (visual only)
- [ ] "Analyze Symptoms" button (shows static results on tap)
- [ ] Results section (shown after Analyze tap):
  - Static possible conditions with probability bars
  - Urgency indicator (Self-care badge)
  - Disclaimer: "Not a medical diagnosis"
- [ ] Recommended Actions (static specialist suggestions)
- [ ] Emergency Banner — always visible at top, red styling

**Note**: All "analysis" results are pre-populated static data. No actual analysis logic.

### Step 15: Emergency Screen
**File**: `lib/screens/emergency/emergency_screen.dart`

- [ ] Large red emergency button header
- [ ] Emergency Contacts section:
  - Emergency Services button (911/112)
  - Hospital Ambulance button
  - Poison Control button
- [ ] Quick Access Cards:
  - Nearest Hospital (with distance placeholder)
  - ER Wait Times
  - 24/7 Pharmacies
  - Emergency Contacts
- [ ] My Emergency Info Card:
  - Blood type, allergies, conditions, medications, insurance
  - Edit button
- [ ] ICE Contacts section:
  - In Case of Emergency contacts
  - One-tap call buttons
- [ ] Medical ID Badge — large display of critical info

### Step 16: Health Articles Screen
**File**: `lib/screens/health_articles/health_articles_screen.dart`

- [ ] Search bar header
- [ ] Featured Article Hero card at top
- [ ] Category chips (horizontal scroll)
- [ ] Trending Articles grid (2-column)
- [ ] Article Detail Screen (`article_detail_screen.dart`):
  - Hero placeholder
  - Title, author, date, reading time
  - Share buttons
  - Content sections (bulleted points)
  - Related articles
  - Comments section (static)

### Step 17: Settings Screen
**File**: `lib/screens/settings/settings_screen.dart`

- [ ] Theme Switcher — 3 theme cards (prominent):
  - Light Theme card with preview
  - Dark Sidebar Theme card with preview (marked DEFAULT)
  - Dark Theme card with preview
- [ ] Account Settings section
- [ ] Notification Preferences
- [ ] Language Selection
- [ ] Privacy Settings
- [ ] App Version info

---

## Phase 4: Integration & Polish

### Step 18: Navigation Integration
- [ ] Wire up GlassSidebar to all screens
- [ ] Wire up GlassBottomNav (Dashboard, Doctors, Appointments, Profile)
- [ ] Implement page transitions (slide/fade)
- [ ] Test back navigation

### Step 19: Theme Integration
- [ ] Implement theme toggle in AppBar top-right
- [ ] Add segmented control with icons (sun, half-moon, moon)
- [ ] Animate theme transitions (300ms)
- [ ] Persist theme selection

### Step 20: Animation Polish
- [ ] Staggered fade-in for list items
- [ ] Card hover/press scale effects
- [ ] Button ripple + scale animations
- [ ] Navigation indicator slide animation
- [ ] Verify all animations at 60fps

### Step 21: Empty States & Loading
- [ ] Add shimmer loading to all list screens
- [ ] Design empty states for lists with no data
- [ ] Verify no "Lorem ipsum" text

### Step 22: Final Build Verification
- [ ] Run `flutter build apk --debug`
- [ ] Verify BUILD SUCCESSFUL
- [ ] Check for any warnings or errors
- [ ] Test on different screen sizes (if emulator available)

---

## Clarifications Applied from Review

| Spec Line | Issue | Resolution |
|-----------|-------|-----------|
| 199-209 | Symptom Checker analysis implies dynamic behavior | All results are pre-populated static data |
| 190-191 | Body map marked optional | Skipped; replaced with simple symptom list |
| 164-165 | "Join Call" enabled when time | Always shown enabled for UI demo |
| 164 | Countdown timer | Static display, not live |
| 25 | Theme #2 called "hybrid" | Named "Dark Sidebar Theme" consistently |

---

## File Creation Order

```
lib/
├── main.dart                                    [Step 1]
├── theme/
│   ├── colors.dart                              [Step 2]
│   ├── app_theme.dart                           [Step 2]
│   └── theme_provider.dart                      [Step 2]
├── utils/
│   └── constants.dart                           [Step 2]
├── widgets/
│   ├── glass_card.dart                          [Step 3.1]
│   ├── glass_button.dart                        [Step 3.2]
│   ├── glass_text_field.dart                    [Step 3.3]
│   ├── glass_bottom_nav.dart                     [Step 3.4]
│   ├── glass_sidebar.dart                        [Step 3.5]
│   ├── glass_chip.dart                          [Step 3.6]
│   ├── glass_avatar.dart                        [Step 3.6]
│   ├── glass_badge.dart                         [Step 3.6]
│   ├── glass_dialog.dart                        [Step 3.6]
│   ├── glass_toggle.dart                        [Step 3.6]
│   ├── animated_background.dart                 [Step 4]
│   ├── shimmer_loading.dart                     [Step 4]
│   ├── doctor_card.dart                          [Step 4]
│   ├── appointment_card.dart                     [Step 4]
│   ├── symptom_card.dart                         [Step 4]
│   ├── article_card.dart                         [Step 4]
│   └── emergency_contact_card.dart               [Step 4]
└── screens/
    ├── login/
    │   └── login_screen.dart                     [Step 5]
    ├── dashboard/
    │   └── dashboard_screen.dart                  [Step 6]
    ├── doctors/
    │   └── doctors_screen.dart                   [Step 7]
    ├── appointments/
    │   └── appointments_screen.dart               [Step 8]
    ├── profile/
    │   └── profile_screen.dart                   [Step 9]
    ├── health_records/
    │   └── health_records_screen.dart             [Step 10]
    ├── medicines/
    │   └── medicines_screen.dart                  [Step 11]
    ├── health_tips/
    │   └── health_tips_screen.dart                [Step 12]
    ├── video_consultation/
    │   └── video_consultation_screen.dart         [Step 13]
    ├── symptom_checker/
    │   └── symptom_checker_screen.dart            [Step 14]
    ├── emergency/
    │   └── emergency_screen.dart                  [Step 15]
    ├── health_articles/
    │   ├── health_articles_screen.dart            [Step 16]
    │   └── article_detail_screen.dart             [Step 16]
    └── settings/
        └── settings_screen.dart                   [Step 17]
```

---

## Dependencies Summary

| Package | Version | Purpose |
|---------|---------|---------|
| google_fonts | ^6.2.1 | Poppins font family |
| flutter_animate | ^4.5.0 | Declarative animations |
| shimmer | ^3.0.0 | Loading placeholders |
| adaptive_theme | ^3.6.0 | Theme switching with persistence |

---

## Quality Checklist (to verify before completion)

- [ ] Login page with glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] All 12+ screens implemented with full UI
- [ ] Consistent glassmorphism style throughout
- [ ] Smooth animations on all interactions
- [ ] Responsive on different screen sizes
- [ ] No state management (pure UI)
- [ ] No placeholder text like "Lorem ipsum"
- [ ] Icons properly aligned and sized
- [ ] Loading states/shimmer effects on lists
- [ ] Empty states designed
- [ ] **Android build succeeds**: `flutter build apk --debug`
