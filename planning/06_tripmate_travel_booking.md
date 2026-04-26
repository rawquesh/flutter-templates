# TripMate - Travel & Booking App

## Project Command
```bash
flutter create --org com.bluetouch.tripmate tripmate
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a travel and booking mobile application called "TripMate". This is a UI-only template (no state management, no actual API calls) that demonstrates a beautiful travel app interface with inspiring visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.tripmate tripmate`
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
- **Primary Color**: Sky Blue (#0EA5E9) or Ocean Blue (#3B82F6)
- **Secondary/Accent**: Coral (#FF7B54) or Sunset Orange (#FF8C42)
- **Success**: Fresh Green (#22C55E)
- **Warning**: Amber (#F59E0B)
- **Background Light**: Light sky white (#F0F9FF) or soft cream
- **Background Dark**: Deep navy (#0F172A) or dark blue-black
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1E293B)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#0F172A)
- **Text Primary Light**: Dark slate (#1E293B)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Gray (#64748B)
- **Text Secondary Dark**: Light gray (#94A3B8)
- **CTA Button**: Gradient blue or blue-coral gradient
- **Price Color**: Coral or primary blue

### Login Page (MANDATORY - First Screen)
Create an inspiring, wanderlust-inducing glassmorphism login page:

- **Background**: Beautiful gradient background (sky blue to purple or sunset colors) with floating travel icons (airplanes, palm trees, mountains, camera)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - TripMate logo/icon at top (airplane or compass icon)
  - "Welcome to TripMate" title with "Explore the world" tagline
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Start Exploring" or "Sign In" button with gradient
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with slide up for glass card
  - Floating travel elements in background
  - Button gradient animation
  - Subtle parallax on background elements

**On "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Explore (compass icon)
- Hotels (bed icon)
- Flights (airplane icon)
- Trips (map icon)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Explore
- My Trips
- Saved Places
- Flight Status
- Deals & Offers
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Explore/Home Screen
- **App Bar**:
  - Location display with pin icon
  - Theme toggle (top right)
  - Notification bell icon
- **Search Bar** (prominent): "Where do you want to go?" with search icon
- **Search Suggestions**: Quick destination chips (Beach, Mountain, City, Adventure)
- **Featured Destinations Carousel**: Full-width beautiful destination cards:
  - Large image placeholder (gradient with destination icon)
  - Destination name
  - Country
  - "From $XX" price
  - Rating stars
- **Categories Section**:
  - Horizontal scroll of category cards:
    - Hotels
    - Flights
    - Packages
    - Car Rental
    - Experiences
- **Popular Destinations Grid**: 2-column grid of trending places
- **Last Minute Deals Section**: Urgent booking cards with discounts
- **Travel Tips Section**: Helpful travel articles carousel

#### 2. Hotels Screen
- **Header**: "Hotels" title
- **Search Form** (glass card):
  - Destination input
  - Check-in date picker
  - Check-out date picker
  - Guests & Rooms selector
  - "Search" button
- **Filter Chips**: Price, Star Rating, Amenities, Property Type
- **Sort Dropdown**: Recommended, Price low-high, Rating, Distance
- **Hotel List**:
  - Each hotel card:
    - Hotel image placeholder
    - Hotel name
    - Location/address
    - Star rating
    - Review score and count
    - Amenity icons (wifi, pool, etc.)
    - Price per night
    - "Book Now" button
- **Map View Toggle**: Switch to map view
- **Hotel Detail** (tap to navigate):
  - Hero image gallery
  - Hotel name and rating
  - Address with map preview
  - Description
  - Amenities grid
  - Room types with prices
  - Reviews section
  - "Book Now" CTA

#### 3. Flights Screen
- **Header**: "Flights" title with one-way/roundtrip toggle
- **Search Form** (glass card):
  - From city input with swap button
  - To city input
  - Departure date
  - Return date (hidden if one-way)
  - Passengers & Class selector
  - "Search Flights" button
- **Recent Searches**: Past search locations
- **Popular Routes**: Common flight destinations
- **Deals Section**: Flight deals carousel

#### 4. Flight Results Screen
- **Header**: "Flights to [Destination]" with back button
- **Filter Bar**: Stops (Non-stop, 1 stop, 2+), Airlines, Price range, Times
- **Sort Options**: Best, Cheapest, Fastest
- **Flight Cards**:
  - Airline logo placeholder and name
  - Departure time, duration, arrival time
  - Stops indicator
  - Flight number
  - Price per person
  - "Select" button
- **Fare Details**: Expandable price breakdown

#### 5. Flight Detail Screen
- **Header Image**: Airplane or sky placeholder
- **Flight Info Card**:
  - Airline and flight number
  - From city, departure time
  - Flight duration
  - To city, arrival time
  - Date
- **Baggage Allowance**: Included bags info
- **Fare Options**: Basic, Standard, Flex with feature comparison
- **Price Summary**: Base fare, taxes, total
- **Continue Button**: Full-width CTA

#### 6. My Trips Screen
- **Header**: "My Trips" title
- **Trip Tabs**: Upcoming, Past
- **Trip Cards**:
  - Destination image placeholder
  - Trip name/dates
  - Status badge (Confirmed, Pending, Completed)
  - Booking reference
  - Booked hotels/Flights summary
  - Total amount paid
  - "View Details" button
  - "Manage Booking" button
- **Empty State**: Suitcase illustration with "No trips yet" message

#### 7. Trip Detail Screen
- **Header**: Large destination image with trip name overlay
- **Trip Overview Card**:
  - Dates
  - Destination
  - Booking reference
- **Itinerary Section**:
  - Day-by-day timeline:
    - Day header
    - Flight/Hotel/Activity cards
    - Time indicators
- **Booked Items**:
  - Flight details
  - Hotel details
  - Transfers
  - Activities
- **Important Documents**: Passport, Visa reminders
- **Emergency Contact**: Contact info card
- **Share Trip**: Share button

#### 8. Hotel Detail Screen
- **Image Gallery**: Full-width hero with dot indicators, swipeable
- **Hotel Info** (glass overlay):
  - Hotel name (large)
  - Star rating
  - Location with map icon
  - Overall rating and review count
- **Quick Actions**: Call, Message, Share, Save
- **About Section**: Description text
- **Amenities Grid**: Icon grid (WiFi, Pool, Gym, Restaurant, etc.)
- **Room Types**:
  - Each room card:
    - Room image placeholder
    - Room name
    - Max guests
    - Amenities included
    - Price per night
    - "Select" button
- **Reviews Section**:
  - Overall rating breakdown
  - Individual review cards
- **Location Map**: Map placeholder with hotel marker
- **Policies**: Check-in/out times, cancellation policy
- **Booking Bar** (fixed bottom):
  - Price per night
  - "Book Now" button

#### 9. Booking/Checkout Screen
- **Header**: "Complete Booking" title
- **Traveler Details**:
  - First name, Last name
  - Email
  - Phone number
  - Special requests
- **Guest Details** (for each guest)
- **Payment Method Section**:
  - Card input fields
  - Saved cards (if any)
  - Other payment options (UPI, Net Banking)
- **Price Summary**:
  - Room rate × nights
  - Taxes and fees
  - Total
- **Coupon Code**: Input with "Apply" button
- **Cancellation Policy**: Policy text
- **Terms Checkbox**: Agree to terms
- **Pay Now Button**: Full-width primary button

#### 10. Profile Screen
- **Profile Header**:
  - Avatar with edit icon
  - Name and email
  - Member since
  - Loyalty tier badge
- **Travel Stats**: Countries visited, Trips taken, Miles flown
- **Rewards Card**: Points balance, tier progress
- **Menu List**:
  - My Bookings
  - Saved Places
  - Payment Methods
  - Travel Documents
  - Notifications
  - Settings
  - Help & Support
  - About
  - Logout

#### 11. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards
- **Account Settings**
- **Notification Preferences**
- **Currency Selection**
- **Language**
- **Privacy & Security**
- **App Version**

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (primary gradient, secondary)
- GlassTextField
- GlassToggle
- GlassChip (filters, categories)
- GlassBadge (status, rating)
- GlassBottomNav
- GlassBottomSheet
- GlassDialog
- DestinationCard (featured place)
- HotelCard (listing item)
- FlightCard (flight result)
- TripCard (my trips)
- RoomCard (room selection)
- DateRangePicker (custom styled)
- GuestSelector (dropdown)
- RatingStars
- AmenityIcon
- AnimatedBackground (travel elements)
- ShimmerLoading
- ImageCarousel (dot indicators)

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Image Carousel**: Smooth swipe with parallax header
- **Cards**: Scale effect on tap
- **Booking Steps**: Step indicator animation
- **Price**: Count-up animation
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating travel elements
- **List Items**: Staggered fade-in on load
- **Search**: Expandable search bar animation

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Hero Images**: Large, inspiring travel photography placeholders
- **Gradients**: Blue to coral gradients for CTAs
- **Borders**: Subtle white/transparent borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Typography**: Clean, elegant sans-serif (Poppins or similar)
- **Spacing**: Generous whitespace for travel feel

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
  - any other UI enhancement packages

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
│   ├── explore/
│   │   └── explore_screen.dart
│   ├── hotels/
│   │   ├── hotels_screen.dart
│   │   └── hotel_detail_screen.dart
│   ├── flights/
│   │   ├── flights_screen.dart
│   │   ├── flight_results_screen.dart
│   │   └── flight_detail_screen.dart
│   ├── trips/
│   │   ├── trips_screen.dart
│   │   └── trip_detail_screen.dart
│   ├── booking/
│   │   └── checkout_screen.dart
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
│   ├── destination_card.dart
│   ├── hotel_card.dart
│   ├── flight_card.dart
│   ├── trip_card.dart
│   ├── room_card.dart
│   ├── date_range_picker.dart
│   ├── guest_selector.dart
│   ├── rating_stars.dart
│   ├── amenity_icon.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with inspiring glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Explore screen with destinations
- [ ] Hotels screen with search and listings
- [ ] Hotel detail with rooms
- [ ] Flights screen with search
- [ ] Flight results and detail
- [ ] My trips with upcoming/past tabs
- [ ] Trip detail with itinerary
- [ ] Checkout/booking flow
- [ ] Profile with travel stats
- [ ] Settings with theme switcher
- [ ] Consistent travel aesthetic throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Travel-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes
3. Login navigates to explore
4. All navigation works (bottom nav, back buttons)
5. All screens have proper travel content
6. Beautiful hero images placeholders
7. No crashes, no layout overflow, no missing assets
