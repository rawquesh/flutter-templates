# TripMate - Travel & Booking App

## Project Command
```bash
flutter create --org com.bluetouch.tripmate tripmate
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a travel and booking mobile application called "TripMate". This is a UI-only template (no state management, no actual API calls) that demonstrates a beautiful travel app interface with inspiring visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.tripmate --platforms android,ios tripmate`
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
- Travel Insurance
- Currency Converter
- Packing List
- Travel Guides
- Loyalty Program
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

#### 12. Travel Insurance Screen
- **Header**: "Travel Insurance" title
- **Trip Selector**:
  - Link insurance to existing trip
  - Or "Create New Insurance"
- **Available Insurance Plans**:
  - Each plan card:
    - Plan name (Basic, Standard, Premium)
    - Price
    - Coverage highlights
    - "Learn More" expand button
- **Plan Comparison Table**:
  - Side-by-side comparison:
    - Trip Cancellation
    - Medical Coverage
    - Baggage Loss
    - Flight Delay
    - Adventure Sports
    - COVID-19 Coverage
- **Coverage Details Section**:
  - **Medical Coverage**:
    - Emergency medical expenses
    - Hospitalization
    - Emergency evacuation
  - **Trip Protection**:
    - Trip cancellation
    - Trip interruption
    - Missed connection
  - **Baggage Coverage**:
    - Lost baggage
    - Delayed baggage
    - Personal belongings
  - **Travel Assistance**:
    - 24/7 hotline
    - Language assistance
    - Emergency translations
- **Customize Plan**:
  - Add-on options:
    - Adventure sports rider
    - Pre-existing conditions
    - Cancel for any reason
  - Premium adjustments
- **Purchase Form**:
  - Traveler details
  - Trip dates and destination
  - Coverage amount selection
  - Primary beneficiary
- **My Insurance Policies**:
  - List of purchased policies
  - Each with:
    - Policy number
    - Coverage details
    - Download PDF button
    - Claim button
    - Emergency contact

#### 13. Currency Converter Screen
- **Header**: "Currency Converter" title
- **Converter Interface**:
  - **From Currency Section**:
    - Currency dropdown selector
    - Amount input field
    - Flag and currency code display
    - Current exchange rate to USD
  - **Swap Button** (center):
    - Arrow button to swap currencies
    - Animation on tap
  - **To Currency Section**:
    - Currency dropdown selector
    - Converted amount display (large)
    - Flag and currency code display
    - Current exchange rate to USD
- **Exchange Rate Display**:
  - "1 [FROM] = X.XX [TO]"
  - Last updated timestamp
  - "Refresh" button
- **Popular Currencies Quick Select**:
  - USD, EUR, GBP, JPY, AUD, CAD, CHF, CNY
  - Tap to quickly switch
- **Historical Rates Section**:
  - "View Historical Rates" link
  - Time range: 1W, 1M, 3M, 6M, 1Y
  - Line chart showing rate trend
- **Currency List**:
  - Searchable list of all currencies
  - Each with flag, code, name
  - Current rate against base currency
- **Favorites Section**:
  - Star currencies for quick access
  - Frequent conversion pairs
- **Offline Mode Notice**:
  - Shows last updated rates when offline
  - "Connect to update rates"

#### 14. Packing List Screen
- **Header**: "Packing List" title
- **Trip Selector**:
  - Select trip for packing list
  - Or create standalone list
- **Template Lists Section**:
  - "Start from Template":
    - Beach Vacation
    - Business Trip
    - Camping
    - Winter Travel
    - Backpacking
    - Family Trip
- **Packing Categories**:
  - Expandable sections:
    - **Clothing**:
      - Tops, Bottoms, Underwear, Sleepwear
      - Shoes, Accessories
    - **Toiletries**:
      - Essentials, Skincare, Medications
    - **Electronics**:
      - Phone, Charger, Laptop, Camera
      - Adapters, Power bank
    - **Documents**:
      - Passport, Visa, ID
      - Tickets, Reservations
      - Insurance
    - **Money**:
      - Cash, Cards
    - **Miscellaneous**:
      - Books, Snacks, First Aid
- **Item Cards**:
  - Checkbox for packed status
  - Item name
  - Quantity selector
  - Notes field
  - Delete button
- **Add Item Section**:
  - Input field
  - Category selector
  - Quick add buttons
- **Progress Tracker**:
  - "XX of YY items packed"
  - Progress bar
  - Category completion status
- **Share/Export Options**:
  - Share list with travel companions
  - Export as PDF
  - Print list
- **Packing Tips Card**:
  - Smart packing suggestions
  - Weight limit warnings
  - TSA guidelines

#### 15. Travel Guides Screen
- **Header**: "Travel Guides" title with search
- **Featured Guide Hero**:
  - Large destination guide card
  - "Destination of the Month"
- **Popular Destinations Grid**:
  - 2-column grid of destination cards:
    - Destination image placeholder
    - Country name
    - "Essential Guide" badge
    - Brief description
- **Guide Categories**:
  - **By Region**:
    - Asia
    - Europe
    - North America
    - South America
    - Africa
    - Oceania
  - **By Interest**:
    - Adventure
    - Culture & History
    - Beach & Relaxation
    - Food & Culinary
    - Eco-Tourism
    - Luxury Travel
- **Guide Detail Screen**:
  - **Header Image**: Destination photo
  - **Quick Stats**:
    - Best time to visit
    - Average temperature
    - Currency
    - Language
  - **Overview Section**:
    - Introduction text
    - Key highlights
  - **Things to Do**:
    - Must-see attractions
    - Hidden gems
    - Activities by interest
  - **Best Places to Stay**:
    - Areas/neighborhoods
    - Hotel recommendations
    - Price ranges
  - **Food & Dining**:
    - Local cuisine highlights
    - Restaurant recommendations
    - Food to try
  - **Getting Around**:
    - Transportation options
    - Public transit info
    - Airport info
  - **Travel Tips**:
    - Visa requirements
    - Safety tips
    - Local customs
    - Budget tips
  - **Packing Recommendations**:
    - Weather-appropriate suggestions
    - Cultural dress tips
  - **Nearby Destinations**:
    - Day trips
    - Multi-country suggestions
- **Save Guide Button**:
  - Save for offline access
  - "Saved Guides" section

#### 16. Loyalty Program Screen
- **Header**: "TripMate Rewards" title
- **Membership Status Card**:
  - Current tier (Bronze, Silver, Gold, Platinum)
  - Tier badge with icon
  - Points balance (large)
  - Progress to next tier
- **Tier Benefits Comparison**:
  - Bronze (0-999 points)
  - Silver (1000-4999 points)
  - Gold (5000-14999 points)
  - Platinum (15000+ points)
  - Each with:
    - Cashback percentage
    - Priority support
    - Exclusive deals
    - Birthday bonus
- **Points Summary**:
  - Points earned this year
  - Points redeemed
  - Points expiring soon
- **Earn Points Section**:
  - **Booking Rewards**:
    - Hotel bookings: 1 point per $1
    - Flight bookings: 1 point per $2
    - Packages: Bonus points
  - **Activity Rewards**:
    - Write a review: 50 points
    - Refer a friend: 200 points
    - Complete profile: 25 points
  - **Partner Earning**:
    - Partner app integrations
    - Linked credit card spending
- **Redeem Points Section**:
  - **Travel Rewards**:
    - Flight discounts
    - Hotel upgrades
    - Free night stays
  - **Gift Cards**:
    - Popular retailers
    - Restaurants
    - Entertainment
  - **Donations**:
    - Charity options
  - Point value calculator
- **Points History**:
  - List of transactions
  - Points earned/redeemed
  - Date and description
- **Exclusive Offers**:
  - Member-only deals
  - Early access to sales
  - Bonus point promotions
- **Referral Program**:
  - Share code
  - "Refer and Earn" description
  - Referral tracking

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
│   ├── insurance/
│   │   ├── insurance_screen.dart
│   │   └── policy_detail_screen.dart
│   ├── currency/
│   │   └── currency_converter_screen.dart
│   ├── packing_list/
│   │   └── packing_list_screen.dart
│   ├── travel_guides/
│   │   ├── travel_guides_screen.dart
│   │   └── guide_detail_screen.dart
│   ├── loyalty/
│   │   └── loyalty_screen.dart
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
│   ├── insurance_card.dart
│   ├── currency_input.dart
│   ├── packing_item_tile.dart
│   ├── guide_card.dart
│   ├── loyalty_tier_card.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with inspiring glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Explore screen with destinations
- [ ] Hotels screen with search and listings
- [ ] Hotel detail with rooms
- [ ] Flights screen with search
- [ ] Flight results and detail
- [ ] My trips with upcoming/past tabs
- [ ] Trip detail with itinerary
- [ ] Checkout/booking flow
- [ ] Travel Insurance with plan comparison
- [ ] Currency Converter with live rates
- [ ] Packing List with templates
- [ ] Travel Guides with detailed info
- [ ] Loyalty Program with tiers
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
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to explore
4. All navigation works (bottom nav, back buttons)
5. All screens have proper travel content
6. Beautiful hero images placeholders
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
