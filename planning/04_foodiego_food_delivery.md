# FoodieGo - Food Delivery & Restaurant App

## Project Command
```bash
flutter create --org com.bluetouch.foodiego foodiego
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a food delivery and restaurant mobile application called "FoodieGo". This is a UI-only template (no state management, no actual API calls) that demonstrates a delicious food delivery app interface with appetizing animations and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.foodiego --platforms android,ios foodiego`
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
- **Primary Color**: Appetizing Orange (#FF7B00) or Tangerine (#FF9500)
- **Secondary/Accent**: Deep Red (#E63946) for food-related accents
- **Success**: Fresh Green (#4CAF50) for delivered/available status
- **Warning**: Warm Yellow (#FFC107) for reviews/stars
- **Background Light**: Cream white (#FFF8F0) or light warm gray
- **Background Dark**: Dark charcoal (#1A1A1A) with warm undertones
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#252525)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#151515)
- **Text Primary Light**: Dark brown (#3D2314) for warmth
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Medium brown (#8B7355)
- **Text Secondary Dark**: Light warm gray (#B8A89A)
- **CTA Button**: Orange gradient (#FF7B00 to #FF4500)
- **Price Color**: Primary orange or green for deals

### Login Page (MANDATORY - First Screen)
Create a warm, appetizing glassmorphism-style login page:

- **Background**: Warm gradient background (orange to deep red or sunset colors) with floating food icons (fork, knife, pizza slices, coffee cups)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - FoodieGo logo/icon at top (fork and knife or food bowl icon)
  - "Welcome to FoodieGo" title with "Delicious food delivered" tagline
  - Email/username text field with mail icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Get Started" or "Sign In" button with orange gradient
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with slide up for glass card
  - Floating food icons in background
  - Button gradient animation on hover
  - Warm glow effect

**On "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (home icon)
- Search (search icon)
- Orders (receipt icon)
- Cart (shopping bag with badge)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Home
- My Orders
- Reorder
- Favorites
- Table Booking
- Addresses
- Payment Methods
- Notifications
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Home Screen
- **Location Header**:
  - Delivery address with pin icon (tap to change)
  - "Deliver Now" indicator
  - Theme toggle (top right)
- **Search Bar**: Large prominent search with placeholder "Search restaurants or dishes"
- **Promo Banner Carousel**: Full-width promotional banners (offers, free delivery, etc.)
- **Quick Categories Row**: Horizontal scrollable category icons:
  - Pizza, Burgers, Asian, Indian, Mexican, Healthy, Desserts, Drinks
- **Featured Restaurants Section**:
  - Section header with "See All" link
  - Horizontal scroll of restaurant cards
- **Popular Near You**:
  - Restaurant cards with:
    - Restaurant image placeholder (gradient with food icon)
    - Name and cuisine type
    - Rating stars with review count
    - Delivery time estimate
    - Delivery fee or "Free delivery" badge
    - Distance
- **All Restaurants Grid**: 2-column grid of all restaurants
- **Bottom Nav Bar**

#### 2. Restaurant Detail Screen
- **Header Image**: Hero image with gradient overlay, back button, share/favorite icons
- **Restaurant Info Overlay**:
  - Name (large)
  - Cuisine types
  - Rating, reviews count, delivery time, delivery fee
  - Distance
- **Search Bar** (within restaurant): Search menu items
- **Menu Categories Tabs**: Horizontal scrollable tabs (Starters, Mains, Sides, Drinks, Desserts)
- **Menu Items List**:
  - Each card:
    - Item image placeholder
    - Name
    - Description (2 lines max)
    - Price
    - Veg/Non-veg indicator (green/red dot)
    - Bestseller/Popular badge if applicable
    - Add button (+ icon) or quantity selector
- **Cart Preview**: Floating bottom bar showing item count and "View Cart" button

#### 3. Food Detail Screen (Item Detail)
- **Header Image**: Large item image placeholder
- **Item Info Card**:
  - Name
  - Description
  - Price (large)
  - Veg/Non-veg badge
  - Rating with reviews count
  - Calories information
- **Customization Section** (glass card):
  - Add-ons (checkboxes for extra cheese, toppings, etc.)
  - Spice level selector (mild, medium, hot)
  - Size options if applicable
- **Quantity Selector**: +/- with count
- **Add to Cart Button**: Full-width orange gradient button with price
- **Similar Items Section**: Horizontal scroll of similar dishes

#### 4. Cart Screen
- **App Bar**: "Your Cart" title with restaurant name and item count
- **Cart Items List**:
  - Each item in a glass card:
    - Item name and customizations
    - Price
    - Quantity selector (+/-)
    - Remove/delete icon
- **Special Instructions**: Text field for delivery notes
- **Offer/Promo Section**: Input field with "Apply" button, available offers chips
- **Bill Summary** (glass card):
  - Item total
  - Delivery fee
  - Packaging fee
  - Taxes
  - Discount applied (if any)
  - **Total** (bold, large)
- **Coupon Applied**: Green success indicator with coupon code
- **Checkout Button**: Full-width primary button
- **Empty State**: Food illustration with "Your cart is empty" message

#### 5. Checkout Screen
- **Delivery Address Section**:
  - Selected address card with edit option
  - "Add New Address" option
  - Delivery time slot selector (Today, Tomorrow, Schedule)
  - Time slot chips (Breakfast, Lunch, Dinner, Specific times)
- **Delivery Instructions**: Notes for delivery person
- **Payment Method Section**:
  - Selected payment card/method
  - Options: Credit Card, Debit Card, UPI, Cash on Delivery, Wallets
- **Order Summary**: Expandable summary of items
- **Tip Section**:
  - "Add a tip" label
  - Tip amount chips (₹20, ₹50, ₹100, Custom)
- **Bill Summary**: Final total with all details
- **Place Order Button**: Full-width prominent button

#### 6. Orders Screen
- **Tab Bar**: Active, Past Orders
- **Active Orders**:
  - Each order card with:
    - Restaurant name and logo
    - Order number and date
    - Status badge (Confirmed, Preparing, Out for Delivery, Delivered)
    - Progress tracker/timeline
    - Items summary (collapsed)
    - Total amount
    - "Track Order" button for active delivery
    - Estimated delivery time
- **Past Orders**:
  - Similar cards with "Reorder" button
  - "Rate Order" option for unrated orders

#### 7. Order Tracking Screen
- **Map Placeholder**: Map area showing delivery route (use gradient/map icon placeholder)
- **Delivery Status Card** (prominent glass card):
  - Current status with icon (large)
  - Status description text
  - Estimated arrival time
- **Delivery Person Card**:
  - Avatar, name, rating
  - Call and message icons
- **Order Details**: Expandable list of ordered items
- **Progress Timeline**: Vertical stepper showing order stages

#### 8. Search Screen
- **Search Bar**: Auto-focus on entry
- **Recent Searches**: List with "X" to clear
- **Popular Searches**: Trending food searches
- **Search Results**:
  - Restaurants tab
  - Dishes tab
- **Result Cards**: Restaurant or dish cards similar to home screen

#### 9. Profile Screen
- **Profile Header**:
  - Avatar with edit icon
  - Name and email
  - Phone number
  - "Edit Profile" button
- **Stats Row**: Orders placed, Reviews, Favorites
- **Rewards/Points Card**:
  - Loyalty points balance
  - Available coupons
  - "View Rewards" button
- **Menu List**:
  - My Addresses
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
- **Language**
- **Default Address**
- **Privacy & Security**
- **App Version**

#### 11. Restaurant Reviews Screen
- **Header**: Restaurant name with "Reviews" subtitle
- **Rating Summary Card**:
  - Large average rating (X.X)
  - Star rating visual
  - Total reviews count
  - Rating breakdown bars:
    - 5 stars: XX%
    - 4 stars: XX%
    - 3 stars: XX%
    - 2 stars: XX%
    - 1 star: XX%
- **Filter Chips**:
  - All
  - With Photos
  - Positive
  - Critical
  - "XX reviews with comments"
- **Sort Dropdown**: Most Recent, Highest Rated, Lowest Rated, Most Helpful
- **Review Cards List**:
  - Each review card:
    - User avatar
    - User name
    - Date posted
    - Star rating
    - "Verified Order" badge
    - Review text (expandable)
    - Photos carousel (if any)
    - Helpful/Useful button with count
    - "Report" option
- **Write Review CTA**:
  - "Share your experience" card
  - Rating selector (stars)
  - Photo upload option
  - Review text field
  - Submit button
- **Restaurant Response Section**:
  - If restaurant owner responded:
    - "Owner Response" label
    - Response text
    - Response date

#### 12. Multi-Restaurant Cart Screen
- **Header**: "Your Cart" title with item count
- **Split Cart Warning**:
  - Warning card explaining items from multiple restaurants
  - "These items are from X restaurants"
- **Restaurant Sections**:
  - Each restaurant grouped:
    - Restaurant name header
    - Delivery time
    - Items from this restaurant:
      - Item name and customizations
      - Quantity selector
      - Price
      - Remove button
    - "View Restaurant" link
- **Item Conflict Notice**:
  - Info about delivery restrictions
  - "Items from different restaurants will be delivered separately"
- **Combined Price Summary**:
  - Per-restaurant breakdown:
    - Restaurant 1: $XX
    - Restaurant 2: $XX
  - Delivery fees (separate per restaurant)
  - Grand Total
- **Delivery Options**:
  - "Deliver separately" (default)
  - "Deliver together (may take longer)"
- **Checkout Button**:
  - Full-width button
  - "Checkout (X restaurants)" text
- **Empty State**: "Your cart is empty" with illustration

#### 13. Table Booking Screen
- **Header**: "Book a Table" title
- **Restaurant Search/Selection**:
  - Search field
  - Recent restaurants
  - Nearby restaurants list
- **Selected Restaurant Card**:
  - Restaurant name and image
  - Cuisine type
  - Location
  - Rating
  - Operating hours
- **Booking Form** (glass card):
  - **Date Picker**: Calendar view
  - **Time Slot Selection**: Available times grid
  - **Party Size**: +/- selector (1-20 guests)
  - **Occasion**: Dropdown (Birthday, Anniversary, Business, Date, Other)
  - **Special Requests**: Text area
  - **Contact Name**: Input field
  - **Contact Phone**: Input field
  - **Email**: Input field
- **Seating Preferences**:
  - Indoor / Outdoor
  - Window seat
  - Quiet area
  - High chair needed (toggle)
- **Pre-Order Menu Section**:
  - "Pre-order food for your booking"
  - Browse restaurant menu
  - Add items to booking
  - Pre-order total
- **Price Summary**:
  - Booking fee (if any)
  - Estimated food order
  - Total
- **Confirmation Section**:
  - Cancellation policy
  - Terms checkbox
  - "Confirm Booking" button
- **Booking Confirmation**:
  - Success animation
  - Booking details card
  - QR code for check-in
  - Add to calendar button
  - Modify/Cancel options

#### 14. Reorder Screen
- **Header**: "Reorder" title
- **Quick Reorder Section**:
  - "Order Again" prominent section
  - Last 5 orders as cards:
    - Restaurant name and logo
    - Order date
    - Total amount
    - Item count
    - "Reorder" button (quick one-tap)
- **Frequent Orders Section**:
  - Your most ordered items
  - Quick add buttons
  - "Add to Cart" for individual items
- **Reorder History List**:
  - Chronological order list
  - Each order card:
    - Restaurant info
    - Date and time
    - Items summary
    - Total paid
    - "Reorder All" button
    - "Reorder Some" option (select items)
- **Item Selection** (for partial reorder):
  - Checkbox list of items
  - Modify quantities
  - Add/remove items
  - "Add Selected to Cart" button
- **Customization Reminder**:
  - Note about re-adding customizations
  - "Previous choices saved as template"
- **Similar Restaurants**:
  - "Order from similar places" section
  - Restaurant suggestions based on history

#### 15. Advanced Filters Screen
- **Header**: "Filters" title with reset and apply buttons
- **Search Within Results**:
  - Search field to filter current results
- **Cuisine Filter**:
  - Multi-select cuisine chips:
    - American, Italian, Chinese, Japanese, Mexican, Indian, Thai, Mediterranean, Fast Food, Healthy, Desserts, etc.
- **Dietary Preferences**:
  - Toggle filters:
    - Vegetarian
    - Vegan
    - Gluten-Free
    - Halal
    - Kosher
    - Dairy-Free
    - Nut-Free
- **Price Range**:
  - Slider or preset buttons:
    - $
    - $$
    - $$$
    - $$$$
- **Distance/Radius**:
  - Slider: 1km - 20km
  - "Use my location" button
- **Delivery Time**:
  - Filter by estimated delivery:
    - ASAP
    - 30 min or less
    - 45 min or less
- **Rating Filter**:
  - Minimum rating slider (3.0 - 5.0 stars)
- **Promotions/Offers**:
  - "Free Delivery"
  - "Buy 1 Get 1 Free"
  - "Cashback"
  - "Restaurant Open Now"
- **Sort By**:
  - Recommended
  - Rating
  - Delivery Time
  - Price: Low to High
  - Price: High to Low
  - Distance
- **Active Filters Display**:
  - Chip list of active filters
  - "Clear All" button
  - Individual filter removal
- **Results Count**:
  - "XX restaurants match your filters"
  - "Apply Filters" prominent button

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (orange gradient primary, secondary variants)
- GlassTextField
- GlassToggle
- GlassChip (filter, offer tags)
- GlassBadge (veg/non-veg, badge, status)
- GlassBottomNav
- GlassBottomSheet
- GlassDialog
- RestaurantCard (restaurant listing)
- FoodItemCard (menu item)
- CartItemCard
- OrderCard
- ProgressTracker
- RatingStars
- QuantitySelector (+/- buttons)
- AnimatedBackground (floating food icons)
- ShimmerLoading
- CategoryChip
- OfferBanner

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Cart Badge**: Bounce animation when item added
- **Add to Cart**: Button animation + item fly to cart
- **Order Status**: Progress bar animated fill
- **Food Images**: Fade-in on load
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Floating Elements**: Subtle float animation on background
- **Search Results**: Staggered fade-in list
- **Rating Stars**: Sequential fill animation

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Warm Colors**: Orange, red, cream tones
- **Gradients**: Orange to red gradients for CTAs
- **Borders**: Subtle white/transparent borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Food Images**: Use gradient placeholders with food icons
- **Typography**: Clean, modern sans-serif (Poppins or similar)
- **Veg/Non-veg Indicators**: Green square with "V", Red square with dot

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
│   ├── restaurant/
│   │   ├── restaurant_detail_screen.dart
│   │   ├── food_detail_screen.dart
│   │   └── restaurant_reviews_screen.dart
│   ├── cart/
│   │   ├── cart_screen.dart
│   │   ├── multi_cart_screen.dart
│   │   └── checkout_screen.dart
│   ├── orders/
│   │   ├── orders_screen.dart
│   │   ├── order_tracking_screen.dart
│   │   └── reorder_screen.dart
│   ├── search/
│   │   ├── search_screen.dart
│   │   └── advanced_filters_screen.dart
│   ├── booking/
│   │   └── table_booking_screen.dart
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
│   ├── restaurant_card.dart
│   ├── food_item_card.dart
│   ├── cart_item_card.dart
│   ├── order_card.dart
│   ├── progress_tracker.dart
│   ├── rating_stars.dart
│   ├── quantity_selector.dart
│   ├── review_card.dart
│   ├── table_slot_picker.dart
│   ├── filter_chip_group.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with warm glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Home screen with restaurants and categories
- [ ] Restaurant detail with menu items
- [ ] Food item detail with customization
- [ ] Cart with items and summary
- [ ] Checkout with address and payment
- [ ] Orders screen with tabs
- [ ] Order tracking UI
- [ ] Search functionality
- [ ] Restaurant Reviews with ratings breakdown
- [ ] Multi-restaurant cart handling
- [ ] Table Booking flow
- [ ] Reorder from history
- [ ] Advanced filters
- [ ] Profile with rewards
- [ ] Consistent warm color scheme throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Food-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to home
4. All navigation works (bottom nav, back buttons)
5. All screens have proper food delivery content
6. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
7. No crashes, no layout overflow, no missing assets
