# Edulearn - Online Learning Platform

## Project Command
```bash
flutter create --org com.bluetouch.edulearn edulearn
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for an online learning and education mobile application called "Edulearn". This is a UI-only template (no state management, no actual API calls) that demonstrates a modern e-learning app interface with engaging visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.edulearn --platforms android,ios edulearn`
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
- **Primary Color**: Purple (#7C3AED) or Indigo (#4F46E5)
- **Secondary/Accent**: Teal (#14B8A6) or Emerald (#10B981)
- **Success/Complete**: Green (#22C55E)
- **Warning**: Amber (#F59E0B)
- **Error**: Red (#EF4444)
- **Background Light**: Very light purple tint (#FAF5FF) or white
- **Background Dark**: Deep purple-black (#0F0A1A) or dark blue
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1E1B2E)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#0F0A1A)
- **Text Primary Light**: Dark (#1F1F1F)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Gray (#6B7280)
- **Text Secondary Dark**: Light purple gray (#A5A5C0)
- **CTA Button**: Purple gradient (#7C3AED to #6D28D9)
- **Progress Color**: Purple or teal gradient
- **Certificate Gold**: #FFD700 for achievements

### Login Page (MANDATORY - First Screen)
Create an inspiring, knowledge-focused glassmorphism login page:

- **Background**: Gradient background (purple to indigo or blue to purple) with floating education icons (books, pencils, graduation caps, lightbulbs)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - Edulearn logo/icon at top (graduation cap or book icon)
  - "Welcome to Edulearn" title with "Learn without limits" tagline
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Start Learning" button with gradient and press animation
  - "or continue with" divider
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with scale for the glass card
  - Floating education elements in background
  - Button glow animation
  - Lightbulb "idea" animation effect

**On "Start Learning" / "Sign In" tap**: Navigate to the main app dashboard with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (home icon)
- My Courses (book icon)
- Explore (search/discover icon)
- Community (users/forum icon)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Dashboard
- My Courses
- Saved Courses
- Certificates
- Bookmarks
- Notes
- Live Classes
- Study Planner
- Achievements
- Community
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Home/Dashboard Screen
- **App Bar**:
  - Greeting with user name
  - Notification bell icon
  - Theme toggle
  - Search icon
- **Progress Overview Card** (glass card with gradient):
  - "Continue Learning" header
  - Current course thumbnail/icon
  - Course name
  - Progress bar (percentage complete)
  - "Resume" button
- **Daily Streak Card**:
  - Flame icon with streak count
  - "days learning streak"
  - Calendar dots for week
- **My Courses Section**:
  - Section header with "See All" link
  - Horizontal scroll of enrolled course cards:
    - Course thumbnail
    - Course name
    - Progress percentage
    - Next lesson title
- **Recommended For You**:
  - Horizontal scroll of recommended course cards
- **Categories Grid**: 2x4 grid of subject categories:
  - Programming
  - Design
  - Business
  - Marketing
  - Data Science
  - Languages
  - Photography
  - Music
- **Top Instructors**: Horizontal scroll of instructor profiles
- **Certifications Section**:
  - Earned certificates preview
  - "View All" link

#### 2. My Courses Screen
- **Header**: "My Courses" title
- **Filter Tabs**: All, In Progress, Completed, Saved
- **Course Cards**:
  - Each card:
    - Course thumbnail/icon
    - Course name
    - Instructor name
    - Progress bar with percentage
    - Total lessons and completed lessons
    - Last accessed date
    - "Continue" or "Review" button
- **Stats Summary**:
  - Courses enrolled
  - Courses completed
  - Hours learned
  - Certificates earned

#### 3. Course Detail Screen
- **Header Image**: Course thumbnail with gradient overlay, back button, share/save icons
- **Course Info Card** (glass overlay):
  - Course name (large)
  - Instructor with avatar
  - Rating stars with review count
  - Students enrolled
  - Last updated date
  - Language
  - Subtitles available badge
- **Quick Stats Row**:
  - Duration
  - Lessons count
  - Quizzes count
  - Certificate availability
- **Description Section**: Expandable course description
- **What You'll Learn**: Checkmark list of learning outcomes
- **Curriculum Section**:
  - Expandable sections for each module:
    - Module title
    - Lesson count and duration
    - Expand to show lessons:
      - Lesson title
      - Duration
      - Type icon (video, quiz, article)
      - Completion checkmark
- **Instructor Section**:
  - Instructor avatar and name
  - Title/expertise
  - Bio
  - Students count
  - Courses count
  - Rating
- **Reviews Section**:
  - Average rating display
  - Rating distribution bars
  - Individual review cards
- **Requirements Section**: List of prerequisites
- **Bottom Bar** (fixed):
  - Original price (if discounted)
  - Current price
  - "Enroll Now" or "Continue" button

#### 4. Video Player/Lesson Screen
- **Video Area**: Large video placeholder with play button overlay
- **Lesson Controls** (glass overlay):
  - Progress bar
  - Play/pause button
  - Time display
  - Fullscreen toggle
  - Playback speed
- **Lesson Info**:
  - Lesson title
  - Course name
  - Lesson number and total
- **Bottom Sheet/Sheet**:
  - Lesson description
  - Resources to download
  - Next/Previous lesson navigation
  - Mark as complete checkbox
- **Notes Section**: Take notes while watching

#### 5. Quiz Screen
- **Header**: Quiz name with progress indicator
- **Question Card**:
  - Question number and total
  - Question text
  - Timer (if timed)
  - Options as selectable cards
  - Mark for review flag
- **Navigation Bar**: Question dots with answered/unanswered/marked states
- **Action Buttons**: Previous, Next, Submit Quiz
- **Results Screen**:
  - Score display (large, animated)
  - Pass/fail indicator
  - Correct/incorrect breakdown
  - Review answers option

#### 6. Explore/Search Screen
- **Header**: "Explore" title
- **Search Bar**: Auto-focus search with suggestions
- **Categories Section**: Main subject categories with icons
- **Popular Searches**: Trending topics
- **Featured Courses**: Large featured course cards
- **New Releases**: Latest courses
- **Search Results**:
  - Filter chips (Free, Paid, Bestseller, New)
  - Sort dropdown
  - Course cards in list/grid view

#### 7. Certificates Screen
- **Header**: "My Certificates" title
- **Certificate Cards**:
  - Certificate image placeholder (with gradient/design)
  - Course name
  - Completion date
  - "View Certificate" button
  - "Share" button
  - Download option
- **Empty State**: Trophy illustration with "Earn your first certificate" message

#### 8. Community/Forum Screen
- **Header**: "Community" title
- **Tabs**: Discussions, Questions, Study Groups
- **Post Cards**:
  - User avatar and name
  - Post title
  - Post preview text
  - Category tag
  - Like count, comment count
  - Time posted
- **Create Post FAB**: Floating action button
- **Filters**: Trending, Recent, Following

#### 9. Profile Screen
- **Profile Header**:
  - Avatar with edit icon
  - Name and email
  - Member since
  - Learning streak badge
- **Learning Stats**:
  - Total hours learned
  - Courses completed
  - Certificates earned
  - Current level/rank
- **Level Progress Card**:
  - Current level badge
  - XP progress bar
  - Points to next level
- **Menu List**:
  - Edit Profile
  - My Certificates
  - Bookmarks
  - Notes
  - Settings
  - Help & Support
  - About
  - Logout

#### 10. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards with visual preview
- **Account Settings**: Edit profile, change password
- **Learning Preferences**:
  - Default playback speed
  - Video quality
  - Auto-play next lesson
  - Download over WiFi only
- **Notification Settings**: Toggle notifications
- **Language**: App language
- **Privacy**: Profile visibility
- **App Version**

#### 11. Live Classes Screen
- **Header**: "Live Classes" title
- **Today's Live Sessions**:
  - Upcoming live class cards:
    - Course name
    - Instructor avatar and name
    - Topic/title
    - Start time with countdown
    - "Join Now" or "Set Reminder" button
    - Participant count
- **Live Now Section**:
  - Currently streaming classes:
    - "LIVE" badge
    - Viewer count
    - Quick join button
- **Upcoming Schedule Calendar**:
  - Weekly calendar view
  - Class slots with colors by course
  - Time and duration
- **Class Categories Filter**:
  - By subject
  - By instructor
  - By difficulty
- **Past Recordings**:
  - List of recorded sessions
  - Each with:
    - Recording thumbnail
    - Topic and course
    - Duration
    - View count
    - "Watch Recording" button
- **Class Detail Modal**:
  - Full description
  - Learning objectives
  - Materials needed
  - Prerequisites
  - Q&A section access
- **Instructor Card**:
  - Quick preview of instructor
  - "View Profile" link
  - Other classes by instructor
- **Classroom Controls** (when in live class):
  - Video player
  - Mute/unmute audio
  - Raise hand
  - Chat panel
  - Participants list
  - Share screen option
  - Reactions/emojis

#### 12. Study Planner Screen
- **Header**: "Study Planner" title
- **Weekly Overview**:
  - Calendar grid showing week
  - Study sessions highlighted
  - Color-coded by subject
- **Study Goals Section**:
  - Weekly study hours goal
  - Daily study target
  - Current progress bars
- **Create Study Plan**:
  - **Subject Selection**: Multi-select subjects
  - **Duration Picker**: How long to study each
  - **Preferred Times**: Morning, Afternoon, Evening
  - **Deadline Input**: Upcoming exams/projects
  - **AI Suggestions**: Recommended schedule based on goals
- **Daily Schedule View**:
  - Timeline view of today's plan
  - Each study block:
    - Subject
    - Duration
    - Break time included
    - Specific topics/chapters
  - Completed blocks marked with checkmark
  - Current block highlighted
- **Pomodoro Timer**:
  - 25 min work / 5 min break cycles
  - Long break after 4 cycles
  - Start/pause/reset controls
  - Session counter
- **Study Streak Tracker**:
  - Current streak (consecutive days)
  - Streak calendar
  - Streak milestones
- **Focus Mode**:
  - Distraction-free view
  - Current task display
  - Timer
  - Break reminders
- **Analytics Section**:
  - Hours studied this week/month
  - Most productive hours
  - Subject breakdown
  - Completion rate
- **Study Tips Card**:
  - Effective study techniques
  - Break reminders
  - Stay motivated tips

#### 13. Discussion Forum Screen
- **Header**: "Community" title
- **Tabs**: All, My Posts, Following, Bookmarked
- **Create Post FAB**: Floating action button
- **Category Filter Chips**:
  - General
  - Course-specific
  - Q&A
  - Study Groups
  - Announcements
- **Post Cards**:
  - Each post card:
    - Author avatar and name
    - "Instructor" or "Student" badge
    - Post title
    - Content preview
    - Category tag
    - Timestamp
    - Like, Comment, Bookmark counts
    - Course reference (if applicable)
- **Create Post Form**:
  - Title input
  - Content text area
  - Category selector
  - Course association (optional)
  - Attach image option
  - Poll creation option
- **Post Detail Screen**:
  - Full post content
  - Author info with follow button
  - Like and share buttons
  - **Comments Section**:
    - Comment count
    - Comment list:
      - Author avatar and name
      - Comment text
      - Timestamp
      - Like button
      - Reply button
    - Add comment input
- **Poll Posts**:
  - Poll options display
  - Vote percentage bars
  - Total votes
  - Time remaining
- **Study Groups Section**:
  - Join existing groups
  - Create new group
  - Group chat access
  - Shared resources

#### 14. Instructor Profile Screen
- **Header**: Instructor avatar (large), back button, share icon
- **Instructor Info Card**:
  - Name and title
  - Expert in field(s)
  - "Follow" button
  - Message button
- **Stats Row**:
  - Total students
  - Total courses
  - Average rating
  - Reviews count
- **Bio Section**:
  - About text
  - Experience highlights
  - Education background
  - Certifications
- **Expertise Tags**:
  - Skills/knowledge areas
  - Technologies
- **Courses by Instructor**:
  - Grid of course cards:
    - Course thumbnail
    - Title
    - Rating and students
    - Price/free badge
    - "View Course" button
- **Student Reviews Section**:
  - Average rating display
  - Review cards:
    - Student avatar and name
    - Rating stars
    - Review text
    - Course reference
    - Date
- **Teaching Style Section**:
  - What students say about teaching
  - Strengths highlighted
- **Schedule Office Hours**:
  - Upcoming Q&A sessions
  - Past sessions recordings
  - Book appointment option
- **Social Links**:
  - LinkedIn, Twitter, Website
  - Personal blog/portfolio
- **Similar Instructors**:
  - Recommended other teachers
  - Horizontal scroll

#### 15. Achievements Screen
- **Header**: "Achievements" title
- **Achievement Stats Card**:
  - Total badges earned
  - Current level
  - Points accumulated
  - Rank in community
- **Progress to Next Level**:
  - Level progress bar
  - Points needed for next level
  - Unlockable rewards preview
- **Badge Categories**:
  - Learning milestones
  - Streak achievements
  - Community contributions
  - Course completions
  - Special events
- **Earned Badges Grid**:
  - Badge cards:
    - Badge icon/image
    - Name
    - Date earned
    - Description
    - Tap for details
- **Locked Badges Section**:
  - Locked achievement cards:
    - Silhouette icon
    - Name
    - Progress percentage
    - "How to unlock" hint
- **Featured Achievements**:
  - Large showcase cards for major achievements
  - Animated reveal when unlocked
- **Achievement Detail Screen**:
  - Full badge display
  - Description and backstory
  - Requirements to earn
  - Your progress
  - Other badge holders
- **Leaderboard**:
  - Rankings by points
  - Your position highlighted
  - Top achievers list
- **Share Achievement**:
  - Share badge to social
  - Generate achievement card image
- **Milestone Rewards**:
  - Unlockable rewards at milestones
  - Certificates
  - Premium features
  - Exclusive content

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (primary gradient, secondary)
- GlassTextField
- GlassToggle
- GlassChip (categories, filters)
- GlassBadge (badge, status, level)
- GlassBottomNav
- GlassBottomSheet
- GlassDialog
- GlassProgressBar (linear progress)
- GlassCircularProgress (for timers, percentages)
- CourseCard (thumbnail, title, progress)
- LessonTile (lesson in curriculum)
- QuizOption (answer option)
- CertificateCard
- InstructorCard
- ReviewCard
- PostCard (community)
- StatCard (learning stats)
- LevelBadge
- AnimatedBackground (floating education elements)
- ShimmerLoading

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Progress Bar**: Animated fill on load
- **Quiz Options**: Selection animation
- **Score Reveal**: Count-up and celebration animation
- **Level Up**: Achievement animation
- **Streak**: Fire animation for active streak
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating educational elements
- **List Items**: Staggered fade-in on load
- **Video Controls**: Fade in/out on interaction

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Gradients**: Purple to indigo gradients for CTAs
- **Borders**: Subtle white/transparent borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Course Images**: Gradient placeholders with book/graduation icons
- **Typography**: Clean, modern sans-serif (Poppins or similar)
- **Progress Visualization**: Purple gradient progress bars

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
│   ├── courses/
│   │   ├── my_courses_screen.dart
│   │   └── course_detail_screen.dart
│   ├── lesson/
│   │   └── lesson_screen.dart
│   ├── quiz/
│   │   └── quiz_screen.dart
│   ├── explore/
│   │   └── explore_screen.dart
│   ├── certificates/
│   │   └── certificates_screen.dart
│   ├── community/
│   │   ├── community_screen.dart
│   │   └── forum_post_detail_screen.dart
│   ├── live_classes/
│   │   ├── live_classes_screen.dart
│   │   └── live_class_room_screen.dart
│   ├── study_planner/
│   │   └── study_planner_screen.dart
│   ├── instructor/
│   │   └── instructor_profile_screen.dart
│   ├── achievements/
│   │   ├── achievements_screen.dart
│   │   └── achievement_detail_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── glass_card.dart
│   ├── glass_button.dart
│   ├── glass_text_field.dart
│   ├── glass_toggle.dart
│   ├── glass_chip.dart
│   ├── glass_badge.dart
│   ├── glass_bottom_nav.dart
│   ├── glass_bottom_sheet.dart
│   ├── glass_dialog.dart
│   ├── glass_progress_bar.dart
│   ├── glass_circular_progress.dart
│   ├── course_card.dart
│   ├── lesson_tile.dart
│   ├── quiz_option.dart
│   ├── certificate_card.dart
│   ├── instructor_card.dart
│   ├── review_card.dart
│   ├── post_card.dart
│   ├── stat_card.dart
│   ├── level_badge.dart
│   ├── live_class_card.dart
│   ├── study_schedule_card.dart
│   ├── pomodoro_timer.dart
│   ├── achievement_badge.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with educational glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Home dashboard with progress overview
- [ ] My courses screen with all tabs
- [ ] Course detail with curriculum
- [ ] Video player lesson screen
- [ ] Quiz screen with question navigation
- [ ] Explore/search functionality
- [ ] Certificates screen
- [ ] Community/forum UI
- [ ] Live Classes with schedule
- [ ] Study Planner with Pomodoro timer
- [ ] Discussion Forum with posts
- [ ] Instructor Profile with courses
- [ ] Achievements with badges
- [ ] Profile with learning stats
- [ ] Settings with theme switcher
- [ ] Consistent purple gradient theme throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Learning-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to dashboard
4. All navigation works (bottom nav, back buttons)
5. All screens have proper educational content
6. Progress visualizations look good
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
