# HomeServ - On-Demand Services App

## Project Command
```bash
flutter create --org com.bluetouch.homeserv homeserv
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for an on-demand home services mobile application called "HomeServ". This is a UI-only template (no state management, no actual API calls) that demonstrates a professional service marketplace app interface with trustworthy visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.homeserv --platforms android,ios homeserv`
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
- **Primary Color**: Trustworthy Blue (#2563EB) or Teal (#0891B2)
- **Secondary/Accent**: Warm Orange (#F97316) for CTAs
- **Success/Verified**: Green (#22C55E)
- **Warning**: Amber (#F59E0B)
- **Error**: Red (#EF4444)
- **Background Light**: Clean white (#FAFAFA)
- **Background Dark**: Professional dark (#0F172A) or dark slate
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1E293B)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#0F172A)
- **Text Primary Light**: Dark slate (#1E293B)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Gray (#64748B)
- **Text Secondary Dark**: Gray (#94A3B8)
- **CTA Button**: Orange gradient (#F97316 to #EA580C)
- **Verified Badge**: Green with checkmark

### Login Page (MANDATORY - First Screen)
Create a professional, trustworthy glassmorphism login page:

- **Background**: Clean gradient background (blue to teal or professional gradient) with floating service icons (wrench, brush, cleaning, tools)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - HomeServ logo/icon at top (house with tool icon)
  - "Welcome to HomeServ" title with "Professional home services" tagline
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Sign In" button with gradient and press animation
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with scale for the glass card
  - Floating service elements in background
  - Button gradient animation
  - Subtle professional shimmer

**On "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (home icon)
- Services (grid icon)
- Bookings (calendar icon)
- Messages (chat icon)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Home
- My Bookings
- Service History
- Saved Providers
- Emergency Services
- Service Warranty
- Multi-Service Booking
- Reviews
- Promotions & Offers
- Payment Methods
- Addresses
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Home/Dashboard Screen
- **App Bar**:
  - Location selector with address
  - Theme toggle (top right)
  - Notification bell icon
- **Search Bar**: "What service do you need?" with search icon
- **Featured Services Row**: Horizontal scroll of main services:
  - Cleaning
  - Plumber
  - Electrician
  - Painter
  - Carpenter
  - AC Repair
  - Pest Control
  - More...
- **Ongoing Job Card** (if any):
  - Provider info
  - Service details
  - Status indicator
  - Track button
- **Promotional Banner**: Offers/discounts carousel
- **Popular Services Grid**: 2x4 grid of service categories with icons:
  - House Cleaning
  - Deep Cleaning
  - Plumbing
  - Electrical
  - AC Service
  - Painting
  - Carpentry
  - Pest Control
  - Appliance Repair
  - Gardening
  - Moving & Shifting
  - More...
- **Top Rated Providers**: Horizontal scroll of provider cards
- **Recent Services**: History of recent bookings

#### 2. Services/Category Screen
- **Header**: Category name with back button
- **Subcategories**: Chips for sub-services
- **Filter Options**:
  - Price range
  - Rating
  - Availability
  - Distance
- **Service Cards**:
  - Each card:
    - Service icon/image placeholder
    - Service name
    - Starting price
    - Rating and reviews
    - Brief description
    - "Book Now" button
- **Compare Button**: Compare selected services

#### 3. Service Detail Screen
- **Header Image**: Service image placeholder with gradient overlay
- **Service Info**:
  - Service name
  - Category badge
  - Rating and reviews count
  - Starting price
- **Description Section**: Detailed service description
- **What's Included**: Checklist of what's covered
- **What's Not Included**: Exclusions list
- **Pricing Tiers** (if applicable):
  - Basic, Standard, Premium options
  - Feature comparison
- **Add-ons**: Optional extra services
- **FAQ Section**: Common questions
- **Provider Matching**:
  - Auto-match indicator
  - Or "Choose Provider" button

#### 4. Provider Selection Screen
- **Header**: "Select Provider" title
- **Map View Toggle**: Map with provider markers
- **Filter Bar**: Rating, Price, Distance, Verified
- **Sort Options**: Recommended, Rating, Price low-high
- **Provider Cards**:
  - Provider avatar and name
  - Profile photo placeholder
  - Star rating with review count
  - Services offered
  - Years of experience
  - Price range
  - Verified badge if applicable
  - "Book Now" or "View Profile" button
- **Provider Detail** (tap to view):
  - Large profile image
  - Name, title
  - Bio
  - Services and prices
  - Portfolio/Gallery
  - Availability calendar
  - Reviews from clients
  - "Book This Provider" CTA

#### 5. Booking/Schedule Screen
- **Header**: "Book Service" title
- **Selected Service Summary**: Service name, price
- **Selected Provider**: Provider card with change option
- **Address Section**:
  - Saved addresses list
  - Add new address button
  - Map preview
- **Schedule Section**:
  - Date picker
  - Time slot selection (morning, afternoon, evening or specific times)
  - Calendar view for availability
- **Problem Description**: Text area for issue details
- **Upload Photos**: Photo upload option
- **Coupon/Promo Code**: Input with apply button
- **Price Breakdown**:
  - Base price
  - Add-ons
  - Service fee
  - Discount
  - **Total**
- **Payment Method Selection**:
  - Cash after service
  - Card payment
  - Digital wallet
- **Book Button**: Full-width CTA

#### 6. My Bookings Screen
- **Header**: "My Bookings" title
- **Tabs**: Upcoming, Ongoing, Completed, Cancelled
- **Booking Cards**:
  - Each card:
    - Service icon and name
    - Provider info (avatar, name)
    - Date and time
    - Address (truncated)
    - Status badge (Confirmed, In Progress, Completed, Cancelled)
    - Price
    - Action buttons based on status:
      - Upcoming: Reschedule, Cancel
      - Ongoing: Track, Contact
      - Completed: Rate, Reorder
- **Timeline View**: Visual progress tracker
- **Empty State**: Illustration with "No bookings yet" message

#### 7. Booking Detail Screen
- **Header**: Booking ID
- **Status Card** (prominent):
  - Current status with icon
  - Status description
- **Service Details**:
  - Service name and category
  - Provider info with call/message buttons
  - Date and time
  - Address with map preview
- **Job Timeline**:
  - Stepper showing:
    - Booking Confirmed
    - Provider Assigned
    - Provider En Route
    - Service In Progress
    - Service Completed
- **Work Details**:
  - Problem description
  - Photos (if uploaded)
  - Services performed
  - Add-ons used
- **Price Summary**:
  - Itemized breakdown
  - Total paid
- **Actions**:
  - Reschedule
  - Cancel booking
  - Contact provider
  - Get help
- **Review Section** (for completed):
  - Star rating selector
  - Text review
  - Submit review

#### 8. Track Job Screen
- **Header**: "Track Your Service"
- **Map Area**: Map placeholder with route
- **Provider Card**:
  - Provider photo and name
  - Vehicle type (if applicable)
  - Call and message buttons
  - Rating
- **Status Update**:
  - Current status large
  - ETA if applicable
  - Description
- **Timeline**: Visual progress indicator
- **Job Summary**: Service details
- **Actions**: Contact, Cancel, Help

#### 9. Messages/Chat Screen
- **Header**: Messages title with filter
- **Chat List**:
  - Each conversation:
    - Provider avatar
    - Provider name
    - Service type
    - Last message preview
    - Time
    - Unread indicator
- **Chat Detail** (tap to open):
  - Header with provider info
  - Message bubbles (sent/received)
  - Service context card
  - Input field with send button
  - Quick replies

#### 10. Profile Screen
- **Profile Header**:
  - Avatar with edit icon
  - Name and email
  - Phone number
  - Member since
- **Stats Row**: Bookings, Reviews, Saved
- **Membership Card**:
  - Current level
  - Benefits
  - Points/rewards
- **Menu List**:
  - My Bookings
  - Service History
  - Saved Providers
  - Payment Methods
  - Addresses
  - Settings
  - Help & Support
  - About
  - Logout

#### 11. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards
- **Account Settings**: Edit profile, change password
- **Notification Preferences**: Toggle types
- **Default Address**: Set home/work
- **Language**: App language
- **Privacy Settings**
- **Terms & Conditions**
- **App Version**

#### 12. Emergency Services Screen
- **Header**: "Emergency Services" title with urgent warning icon
- **Urgent Services Section**:
  - **Plumbing Emergency**:
    - 24/7 availability indicator
    - "Burst pipe, flood, no water" options
    - Immediate booking
  - **Electrical Emergency**:
    - Power outage, sparks, exposed wires
    - Safety warnings
    - Immediate booking
  - **Lock & Key Emergency**:
    - Locked out, broken lock, lost keys
    - 24/7 availability
  - **AC Emergency**:
    - Complete AC failure
    - Gas leak warnings
    - Same-day service
- **Emergency Contact Cards**:
  - Large call buttons
  - "Call Now" prominent
  - Service name and availability
- **Quick Diagnosis Section**:
  - Describe your emergency
  - Photo upload option
  - Instant quote estimate
- **Estimated Arrival**:
  - Real-time availability
  - ETA display
  - Priority queue option
- **Safety Reminders**:
  - Important safety tips
  - What to do while waiting
  - Emergency shut-off guides
- **Nearby Emergency Resources**:
  - Hospital contacts
  - Fire department
  - Police
  - Poison control

#### 13. Service Warranty Screen
- **Header**: "Service Warranty" title
- **Active Warranties Section**:
  - **Warranty Cards**:
    - Service type
    - Provider who performed
    - Warranty period (start - end date)
    - Days remaining
    - Status badge (Active/Expiring Soon/Expired)
- **Warranty Details**:
  - Coverage scope
  - Terms and conditions
  - What's covered
  - What's NOT covered
  - Claim process
- **Claim Warranty**:
  - "File a Claim" button
  - Issue description input
  - Photo upload
  - Preferred date for revisit
  - Priority options
- **Warranty History**:
  - Past claims
  - Status (Approved/Pending/Rejected)
  - Resolution details
- **Warranty Types**:
  - **Standard Warranty**:
    - 30-day coverage
    - Parts included
  - **Extended Warranty**:
    - 90-day or 1-year
    - Labor included
  - **Premium Warranty**:
    - Multi-year
    - Priority service
    - Annual inspection
- **Tips Section**:
  - How to maintain warranty
  - Common warranty void situations
  - Maintenance reminders

#### 14. Multi-Service Booking Screen
- **Header**: "Book Multiple Services" title
- **Address Selection**:
  - Same address for all services
  - Or different addresses option
- **Service Selection List**:
  - **Add Service Button**:
    - Search/select service
    - Category chips
    - Popular services quick select
  - **Selected Services** (each card):
    - Service name and icon
    - Brief description
    - Estimated price range
    - Preferred date/time
    - Provider preference (any/特定)
    - Edit/Remove buttons
  - **Drag to Reorder**: Priority adjustment
- **Combined Scheduling**:
  - **Single Visit Option**:
    - "Do all services in one visit"
    - Stacked time slots
    - Estimated total duration
  - **Separate Visits**:
    - Individual scheduling per service
    - Different dates/times
- **Discount Preview**:
  - "Bundle discount" badge
  - Savings calculation
  - Percentage or fixed amount
- **Provider Matching**:
  - Auto-match for multiple services
  - One provider for all (if possible)
  - Or multiple specialists
- **Price Summary Card**:
  - Per-service breakdown
  - Service fees
  - Bundle discount applied
  - **Total estimated cost**
- **Combined Promo Code**:
  - Apply multi-service discount
  - Special bundle offers
- **Booking Confirmation**:
  - All services summary
  - Combined schedule
  - Total amount
  - "Book All" button

#### 15. Provider Reviews Screen
- **Header**: "Reviews" title
- **Write Review CTA**:
  - "Rate Your Experience" card
  - Service selector
  - Star rating (1-5)
  - Text review input
  - Photo upload option
  - Anonymous toggle
  - Submit button
- **Overall Rating Card**:
  - Average rating (large number)
  - Star visualization
  - Total reviews count
- **Rating Breakdown**:
  - 5 star: XX%
  - 4 star: XX%
  - 3 star: XX%
  - 2 star: XX%
  - 1 star: XX%
- **Filter Reviews**:
  - All
  - With Photos
  - 5 Stars
  - 4 Stars
  - Lower ratings
- **Sort Options**: Most Recent, Most Helpful, Highest, Lowest
- **Review Cards List**:
  - Each review:
    - User avatar and name
    - Date of service
    - Star rating
    - Service type badge
    - Review text (expandable)
    - Photo attachments
    - Provider response (if any)
    - Helpful/Report buttons
- **Provider Response**:
  - If provider replied:
    - "Provider's Response" label
    - Response text
    - Date
- **My Reviews Tab**:
  - Reviews I've written
  - Edit/Delete options
- **Review Guidelines Card**:
  - Community guidelines
  - What makes a helpful review
  - Moderation notice

#### 16. Promotions & Offers Screen
- **Header**: "Offers" title
- **Active Promotions Banner**:
  - Large promotional banner carousel
  - Discount highlights
  - "Shop Now" CTA
- **For You Section**:
  - Personalized offers based on history
  - "Recommended for you"
- **Available Offers Grid**:
  - Offer cards:
    - Offer image/gradient
    - Discount amount/percentage
    - Service category
    - Valid until date
    - "Apply" or "Use Code" button
    - Terms preview
- **Offer Categories**:
  - First Booking
  - Repeat Customer
  - Bundle Deals
  - Seasonal
  - Refer a Friend
- **How It Works Section**:
  - Step by step for each offer type
  - Eligibility requirements
- **Referral Program Card**:
  - "Refer & Earn" header
  - Your referral code display
  - Share buttons
  - Earnings history
  - Referral status tracking
- **Promo Code Input**:
  - Text input field
  - "Apply" button
  - Recent codes saved
- **Offer History**:
  - Used offers
  - Savings total
- **Terms & Conditions**:
  - Expandable offer details
  - Expiration info
  - Usage limits

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (primary gradient, secondary)
- GlassTextField
- GlassToggle
- GlassChip (filters, services)
- GlassBadge (status, verified)
- GlassBottomNav
- GlassBottomSheet
- GlassDialog
- GlassAvatar (with rating ring)
- GlassBottomSheet
- ServiceCard (service listing)
- ProviderCard (provider listing)
- BookingCard (booking item)
- BookingTimeline (progress stepper)
- StatusBadge
- TimeSlotSelector
- AddressCard
- PriceBreakdown
- ChatBubble
- MapPlaceholder
- AnimatedBackground
- ShimmerLoading

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Booking Status**: Progress animation on status change
- **Map Marker**: Pulse animation for provider location
- **Provider Cards**: Scale on tap
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating service elements
- **List Items**: Staggered fade-in on load
- **Chat**: Message appear animation

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Professional Feel**: Clean, trustworthy design
- **Gradients**: Orange for CTAs, blue accents
- **Borders**: Subtle borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Service Icons**: Professional service category icons
- **Typography**: Clean, modern sans-serif (Poppins or similar)

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
│   ├── services/
│   │   ├── services_screen.dart
│   │   └── service_detail_screen.dart
│   ├── provider/
│   │   └── provider_selection_screen.dart
│   ├── booking/
│   │   ├── booking_screen.dart
│   │   ├── bookings_screen.dart
│   │   ├── booking_detail_screen.dart
│   │   ├── track_job_screen.dart
│   │   └── multi_service_booking_screen.dart
│   ├── messages/
│   │   ├── messages_screen.dart
│   │   └── chat_screen.dart
│   ├── emergency/
│   │   └── emergency_services_screen.dart
│   ├── warranty/
│   │   └── service_warranty_screen.dart
│   ├── reviews/
│   │   └── provider_reviews_screen.dart
│   ├── promotions/
│   │   └── promotions_screen.dart
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
│   ├── glass_avatar.dart
│   ├── service_card.dart
│   ├── provider_card.dart
│   ├── booking_card.dart
│   ├── booking_timeline.dart
│   ├── status_badge.dart
│   ├── time_slot_selector.dart
│   ├── address_card.dart
│   ├── price_breakdown.dart
│   ├── chat_bubble.dart
│   ├── map_placeholder.dart
│   ├── emergency_card.dart
│   ├── warranty_card.dart
│   ├── review_card.dart
│   ├── offer_card.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with professional glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Home dashboard with service categories
- [ ] Services screen with listings
- [ ] Service detail with pricing
- [ ] Provider selection with filters
- [ ] Booking flow with schedule
- [ ] My bookings with tabs
- [ ] Booking detail with timeline
- [ ] Track job screen
- [ ] Messages/chat UI
- [ ] Emergency Services with 24/7 support
- [ ] Service Warranty management
- [ ] Multi-Service Booking
- [ ] Provider Reviews
- [ ] Promotions & Offers
- [ ] Profile with stats
- [ ] Settings with theme switcher
- [ ] Consistent professional design throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Service-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to home
4. All navigation works (bottom nav, back buttons)
5. All screens have proper service marketplace content
6. Booking flow looks complete
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
