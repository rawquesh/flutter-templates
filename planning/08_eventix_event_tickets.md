# Eventix - Event Tickets & Booking App

## Project Command
```bash
flutter create --org com.bluetouch.eventix eventix
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for an event tickets and booking mobile application called "Eventix". This is a UI-only template (no state management, no actual API calls) that demonstrates a vibrant event discovery and ticketing app interface with exciting visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.eventix --platforms android,ios eventix`
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
- **Primary Color**: Vibrant Purple (#8B5CF6) or Magenta (#D946EF)
- **Secondary/Accent**: Electric Pink (#EC4899) or Hot Pink (#FF006E)
- **Success**: Bright Green (#22C55E)
- **Warning**: Amber (#F59E0B)
- **Error**: Red (#EF4444)
- **Background Light**: Off-white (#FDF4FF) or light lavender
- **Background Dark**: Deep purple-black (#0A0612) or dark violet
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1A1225)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#0A0612)
- **Text Primary Light**: Dark purple (#1F1033)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Purple gray (#7C6897)
- **Text Secondary Dark**: Light purple gray (#B8A5D0)
- **CTA Button**: Gradient purple to pink
- **Featured Event**: Golden (#FFD700) or coral accents

### Login Page (MANDATORY - First Screen)
Create an exciting, party-inspired glassmorphism login page:

- **Background**: Dynamic gradient background (purple to pink or dark to vibrant) with floating event icons (tickets, confetti, balloons, music notes, spotlights)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - Eventix logo/icon at top (ticket or confetti icon)
  - "Welcome to Eventix" title with "Discover amazing events" tagline
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Get Tickets" button with gradient and glow animation
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with scale for the glass card
  - Floating confetti elements in background
  - Button glow pulse animation
  - Spotlight effect animation

**On "Get Tickets" / "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Discover (compass/explore icon)
- Events (calendar icon)
- Tickets (ticket icon with badge)
- Offers (tag/percent icon)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Discover
- My Events
- My Tickets
- Favorites
- Event Calendar
- Seat Selection
- Offers & Discounts
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Discover/Home Screen
- **App Bar**:
  - Location selector with pin icon
  - Theme toggle (top right)
  - Notification bell icon
- **Search Bar**: "Search events, artists, venues..." with search icon
- **Featured Event Hero**: Large full-width event card:
  - Event image placeholder (gradient with music/party icon)
  - "FEATURED" badge
  - Event name (large)
  - Date and venue
  - "Get Tickets" button
  - Countdown timer if applicable
- **Categories Row**: Horizontal scrollable icons:
  - Music
  - Sports
  - Theater
  - Comedy
  - Art
  - Food & Drink
  - Family
  - Conferences
- **Near You Section**:
  - Section header with "See All"
  - Horizontal scroll of nearby events
- **This Week's Highlights**:
  - Grid of event cards (2 columns):
    - Event image placeholder
    - Event name
    - Date
    - Venue
    - Price range
    - Favorite heart icon
- **Recommended For You**: Personalized suggestions

#### 2. Events Screen
- **Header**: "Events" title
- **Search Bar**: Search with icon
- **Filter Chips**: Category, Date, Price, Location
- **Sort Dropdown**: Today, This Week, This Month, Popular, New
- **Event Cards** (list view):
  - Event image thumbnail
  - Event name
  - Date and time
  - Venue
  - Category badge
  - Price from "XX"
  - Rating (if available)
  - Favorite heart icon
  - "Tickets" button
- **Map View Toggle**: Switch to map view
- **Event Detail** (tap to navigate):
  - Large event image gallery
  - Event name and category
  - Date, time, timezone
  - Venue with map preview
  - Description
  - Lineup/Performers (if applicable)
  - Age restriction
  - Organizer info
  - Share button

#### 3. Event Detail Screen
- **Header Image**: Hero image with gradient overlay, back button, share/favorite icons
- **Event Info Card** (glass overlay):
  - Event name (large)
  - Category badge
  - Date and time with calendar icon
  - Venue with location icon
  - Price range
- **Countdown Timer** (if upcoming):
  - Days, Hours, Minutes, Seconds boxes
- **About Section**: Event description (expandable)
- **Performers/Lineup Section** (if applicable):
  - Artist cards with images
- **Venue Section**:
  - Venue name
  - Address
  - Mini map placeholder
  - Directions button
- **Tickets Section**:
  - Ticket type cards:
    - Ticket name (General, VIP, etc.)
    - Price
    - Description/perks
    - Availability status
    - Quantity selector
    - "Select" button
- **Reviews Section**:
  - Rating display
  - Individual reviews
- **Organizer Section**:
  - Organizer logo and name
  - Other events by organizer
- **Similar Events**: Other events you might like
- **Bottom Bar** (fixed glass):
  - "Select Tickets" or "Get Tickets" button

#### 4. Ticket Selection/Seat Selection Screen
- **Header**: "Select Tickets" or "Choose Seats"
- **Ticket Types List**:
  - Each type card:
    - Type name (GA, VIP, Premium)
    - Price
    - perks list
    - Quantity selector
    - "Add" button
- **Seat Map** (if assigned seating):
  - Visual seat map placeholder (grid of seat icons)
  - Legend for available/sold/selected
  - Zoom controls
  - Section selector
- **Selected Summary**:
  - Itemized selection
  - Total price
- **Continue Button**: Full-width CTA

#### 5. My Tickets Screen
- **Header**: "My Tickets" title with filter
- **Tabs**: Upcoming, Past, All
- **Ticket Cards**:
  - Each card (looks like a ticket):
    - Event image/icon
    - Event name
    - Date and time
    - Venue
    - Ticket type and quantity
    - Order number
    - QR code placeholder
    - "View Ticket" button
    - "Add to Calendar" button
- **Ticket Detail View**:
  - Large QR code
  - Barcode
  - Event details
  - Ticket holder name
  - Entry instructions
- **Empty State**: Ticket illustration with "No tickets yet" message

#### 6. Offers/Deals Screen
- **Header**: "Offers" title
- **Banner Carousel**: Promotional banners
- **Available Offers**:
  - Each offer card:
    - Offer image/gradient
    - Discount badge (e.g., "20% OFF")
    - Event name
    - Valid until date
    - "Apply" button
- **Flash Deals Section**:
  - Limited time offers
  - Countdown timer
- **Code输入**: Promo code input field

#### 7. Checkout/Payment Screen
- **Header**: "Checkout" title with order summary toggle
- **Order Summary** (expandable):
  - Event name
  - Ticket type and quantity
  - Subtotal
  - Fees and charges
  - Discount (if applied)
  - **Total**
- **Promo Code**: Input with "Apply" button
- **Contact Information**:
  - Name
  - Email
  - Phone
- **Payment Method Section**:
  - Card input fields
  - Saved cards
  - Other options (Apple Pay, Google Pay)
- **Terms Checkbox**: Agree to terms
- **Pay Button**: Full-width primary button with total

#### 8. Order Confirmation Screen
- **Success Animation**: Checkmark with celebration
- **Confirmation Message**: "You're going!"
- **Order Details**:
  - Order number
  - Event name
  - Tickets
  - Total paid
- **Actions**:
  - "View Tickets" button
  - "Add to Calendar" button
  - "Share" button
- **Recommendation**: "You might also like" events

#### 9. Profile Screen
- **Profile Header**:
  - Avatar with edit icon
  - Name and email
  - Member since
  - Membership tier badge
- **Stats Row**: Tickets bought, Events attended, Saved
- **Membership Card**:
  - Current tier
  - Points/rewards balance
  - Progress to next tier
- **Menu List**:
  - My Tickets
  - Favorites
  - Payment Methods
  - Notifications
  - Settings
  - Help & Support
  - About
  - Logout

#### 10. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards
- **Account Settings**
- **Notification Preferences**
- **Default Location**
- **Language**
- **Privacy & Security**
- **App Version**

#### 11. Event Calendar Screen
- **Header**: "Events Calendar" title
- **Calendar View**:
  - Month calendar grid
  - Days with events highlighted
  - Swipe for next/previous month
- **Month Navigation**:
  - Current month and year
  - Previous/Next arrows
  - "Today" button
- **Event Indicators**:
  - Dot indicators on dates with events
  - Color coding by category:
    - Music: Purple
    - Sports: Green
    - Theater: Blue
    - Comedy: Orange
- **Selected Day Events List**:
  - Events for selected date:
    - Event image thumbnail
    - Event name
    - Time
    - Venue
    - "Get Tickets" button
- **Upcoming Events Timeline**:
  - Chronological list of next 7 days
  - Events grouped by date
- **Category Filter**:
  - Filter by event type
  - "All" selected by default
- **Add to Calendar**:
  - Export event to device calendar
  - Select specific events
- **Notifications**:
  - "Remind me" option for events
  - Reminder timing selection

#### 12. Seat Selection Screen
- **Header**: "Choose Your Seats" with event name
- **Venue Map**:
  - Interactive seat map:
    - Stage/platform indicator
    - Section labels (A, B, C, etc.)
    - Row numbers
    - Seat numbers
  - Color legend:
    - Available (green)
    - Selected (highlighted)
    - Sold/Unavailable (gray)
    - VIP (gold)
  - Zoom controls (+/- buttons)
  - Pan gesture for navigation
- **Section Selector**:
  - Dropdown to jump to section
  - "Best Available" option
- **Seat Info Panel**:
  - Selected seat(s) details:
    - Section, Row, Seat number
    - Price per seat
    - Number of seats
- **Quick Selection Options**:
  - "Best Available" button
  - Number of seats selector (1-6)
  - Auto-select nearby available seats
- **Accessibility Options**:
  - "Wheelchair Accessible" filter
  - "Easy Access" sections
- **Legend and Info**:
  - Price range key
  - Distance from stage indicator
  - Aisle markers
- **Seat Details Card**:
  - Expanded info for tapped seat:
    - Exact location
    - View preview (simulated)
    - Price
    - Add/Remove button
- **Selection Summary**:
  - Total seats selected
  - Individual prices
  - Total amount
  - "Continue" button

#### 13. Artist/Performer Pages Screen
- **Header**: Artist name with follow button
- **Artist Hero**:
  - Large artist image placeholder
  - Artist name (large)
  - Genre/Badge
  - Follower count
  - Social stats
- **Bio Section**:
  - About text
  - Origin/Background
  - Career highlights
- **Social Links**:
  - Instagram, Twitter, Spotify, YouTube icons
  - Profile links
- **Upcoming Events Section**:
  - Events featuring this artist:
    - Event cards:
      - Event name
      - Date and venue
      - Ticket status
      - "Get Tickets" button
- **Past Events Gallery**:
  - Event photos/recaps
  - Highlights reel
- **Discography/Videos Section**:
  - Latest release card
  - Popular tracks list
  - Music video thumbnails
- **Merchandise**:
  - Official merch link
  - Featured products
- **Similar Artists**:
  - "Fans also like" section
  - Horizontal scroll of related artists
- **Follower Updates**:
  - Notification preference
  - "Notify me of new events"

#### 14. Event Guide Screen
- **Header**: Event name with "Guide" subtitle
- **Event Overview Card**:
  - Event image
  - Date, time, venue
  - Quick summary
- **Essential Info Section**:
  - **Date & Time**:
    - Event date and time
    - Duration
    - Timezone
    - "Add to Calendar" button
  - **Location**:
    - Venue name
    - Full address
    - Map preview
    - "Get Directions" button
    - Parking info
    - Nearest transit
  - **Age Restrictions**:
    - Age limit display
    - ID requirements
- **Before You Go Section**:
  - **What to Bring**:
    - Essential items checklist
    - Ticket confirmation
    - ID
    - Camera rules
  - **Prohibited Items**:
    - List of not-allowed items
    - Security check info
- **Venue Guide**:
  - **Seating Information**:
    - Seat map preview
    - Entry gates
    - Accessibility info
  - **Facilities**:
    - Restrooms locations
    - Food & Beverage
    - Merchandise booths
    - First aid
  - **Accessibility**:
    - Wheelchair access
    - Assistive listening
    - Sign language
- **Event Day Tips**:
  - Arrival time suggestions
  - Traffic/parking warnings
  - Weather considerations
  - Bag policy
- **Know Before You Go**:
  - Social media hashtags
  - Fan meetup info
  - Post-show info
- **FAQ Section**:
  - Common questions
  - Contact info
- **Share Guide**:
  - Share with friends
  - Export as PDF option

#### 15. Waitlist Screen
- **Header**: "Event Waitlist" title
- **Joined Waitlists Section**:
  - Events on waitlist cards:
    - Event name and image
    - Date
    - Current position in queue
    - "Leave Waitlist" button
    - Estimated notification time
- **How Waitlist Works Card**:
  - Explanation of waitlist process:
    - Join when sold out
    - Get notified of cancellations
    - Limited time to purchase
  - Tips for success
- **Event Details** (tap to expand):
  - Full event info
  - Similar available events
  - "Explore Alternatives" link
- **Notifications Settings**:
  - "Notify me first" priority option
  - Alert timing preferences
- **Availability Alerts**:
  - "Notify me immediately" toggle
  - Quiet hours setting
- **Waitlist History**:
  - Past waitlist items
  - Successfully purchased (marked)
  - Expired offers
- **Tips for Getting Tickets**:
  - Strategies to improve chances
  - Best times to check
  - Alternative events suggestion

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (primary gradient, secondary)
- GlassTextField
- GlassToggle
- GlassChip (categories, filters)
- GlassBadge (featured, discount, category)
- GlassBottomNav
- GlassBottomSheet
- GlassDialog
- GlassCountdown (timer boxes)
- EventCard (list item)
- FeaturedEventCard (hero)
- TicketCard (my tickets display)
- QRCodePlaceholder
- OfferCard
- CategoryChip
- SeatMapPlaceholder
- AnimatedBackground (floating confetti, tickets)
- ShimmerLoading

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Confetti**: Animated confetti on successful booking
- **Countdown**: Number flip animation
- **Ticket Selection**: Ticket fly-in animation
- **QR Code**: Fade-in reveal
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Floating confetti/ticket elements
- **List Items**: Staggered fade-in on load
- **Banners**: Auto-scroll with smooth transition

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Gradients**: Purple to pink gradients for CTAs
- **Borders**: Subtle white/glow borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Event Images**: Gradient placeholders with music/party icons
- **Typography**: Bold, modern sans-serif (Poppins or similar)
- **Ticket Design**: Dashed line separators for tear-off effect

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
│   ├── discover/
│   │   └── discover_screen.dart
│   ├── events/
│   │   ├── events_screen.dart
│   │   ├── event_detail_screen.dart
│   │   └── event_guide_screen.dart
│   ├── tickets/
│   │   ├── ticket_selection_screen.dart
│   │   ├── my_tickets_screen.dart
│   │   └── waitlist_screen.dart
│   ├── calendar/
│   │   └── event_calendar_screen.dart
│   ├── seat_selection/
│   │   └── seat_selection_screen.dart
│   ├── artist/
│   │   └── artist_page_screen.dart
│   ├── offers/
│   │   └── offers_screen.dart
│   ├── checkout/
│   │   ├── checkout_screen.dart
│   │   └── confirmation_screen.dart
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
│   ├── glass_countdown.dart
│   ├── event_card.dart
│   ├── featured_event_card.dart
│   ├── ticket_card.dart
│   ├── qr_code_placeholder.dart
│   ├── offer_card.dart
│   ├── category_chip.dart
│   ├── seat_map_placeholder.dart
│   ├── calendar_grid.dart
│   ├── artist_card.dart
│   ├── waitlist_card.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with exciting glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Discover screen with featured event
- [ ] Events screen with filters
- [ ] Event detail with countdown
- [ ] Ticket selection/seat map
- [ ] My tickets with QR codes
- [ ] Offers/deals screen
- [ ] Checkout flow
- [ ] Order confirmation
- [ ] Event Calendar with month view
- [ ] Interactive Seat Selection
- [ ] Artist/Performer Pages
- [ ] Event Guide with tips
- [ ] Waitlist functionality
- [ ] Profile with membership
- [ ] Settings with theme switcher
- [ ] Consistent purple/pink gradient theme
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Event-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to discover
4. All navigation works (bottom nav, back buttons)
5. All screens have proper event content
6. Ticket designs look authentic
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
