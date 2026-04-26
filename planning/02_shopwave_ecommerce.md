# ShopWave - Modern E-commerce App

## Project Command
```bash
flutter create --org com.bluetouch.shopwave shopwave
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a modern e-commerce mobile application called "ShopWave". This is a UI-only template (no state management, no actual API calls) that demonstrates a premium online shopping app interface with beautiful animations and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.shopwave --platforms android,ios shopwave`
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
- **Primary Color**: Deep Blue (#2563EB) or Electric Blue (#3B82F6)
- **Secondary/Accent**: Coral/Orange (#FF6B6B) for sale badges and CTAs
- **Success**: Green (#22C55E) for success states, in-stock indicators
- **Warning**: Amber (#F59E0B) for limited stock warnings
- **Background Light**: Off-white (#FAFAFA)
- **Background Dark**: Near black (#0F0F0F)
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1A1A1A)
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#141414)
- **Text Primary Light**: Dark (#1F2937)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Gray (#6B7280)
- **Text Secondary Dark**: Gray (#9CA3AF)
- **Sale Badge**: Coral (#FF6B6B)
- **Price Color**: Primary blue or red for discounts

### Login Page (MANDATORY - First Screen)
Create a stunning, glassmorphism-style login page that is the entry point of the app:

- **Background**: Elegant gradient background (dark blue to purple or brand colors) with animated floating shapes/bags/shopping icons
- **Glassmorphism Card**: Centered frosted glass card containing:
  - Shopping bag or store icon at top
  - "Welcome to ShopWave" title with "Shop the world" subtitle
  - Email/username text field with mail icon and validation styling
  - Password text field with visibility toggle and lock icon
  - "Remember me" checkbox with custom styling
  - "Forgot Password?" link aligned right
  - Large "Sign In" button with gradient (blue to purple) and press animation
  - Divider with "or continue with" text
  - Social login buttons row (Google, Apple, Facebook) with proper icons
  - "Create an account" link at bottom with "New here?" text
- **Animations**:
  - Fade-in animation for the glass card on load (500ms delay)
  - Floating animation on background shopping elements
  - Button scale animation on tap
  - Text field focus animations

**On "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a modern bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (home icon)
- Categories (grid icon)
- Cart (shopping bag with badge)
- Wishlist (heart icon)
- Profile (user icon)

**Side Navigation (accessible via hamburger or drawer)**:
- All Categories
- Orders
- Order Tracking
- Flash Deals
- Compare Products
- Gift Cards
- Become a Seller
- Offers & Deals
- Settings
- Help & Support
- About

### Screens to Build (UI Only)

#### 1. Home Screen
- **App Bar**:
  - Hamburger menu (left)
  - "ShopWave" logo text or icon
  - Search bar (expandable or tap to open)
  - Cart icon with badge showing item count
  - Theme toggle (top right)
- **Search Overlay**: Full-screen search with recent searches and suggestions
- **Banner Carousel**: Full-width promotional banners with auto-scroll and dots indicator
- **Flash Sale Section**:
  - Section header with countdown timer
  - Horizontal scrollable product cards with sale prices
- **Categories Row**: Icon + label chips for main categories
- **Featured Products Grid**: 2-column grid of product cards
- **New Arrivals Section**: Horizontal scroll or grid of latest products
- **Popular Brands**: Logo carousel of brand images
- **Home Treats**: Special offers section with gradient cards

#### 2. Categories Screen
- **Header**: "Categories" title with search icon
- **Category Grid**: 2x4 or 3x4 grid of category cards:
  - Category icon
  - Category name
  - Item count
  - Background gradient or image
- **Categories List**:
  - Clothing
  - Electronics
  - Home & Garden
  - Sports & Outdoors
  - Beauty & Care
  - Books & Media
  - Toys & Games
  - Food & Drinks
  - Pet Supplies
  - Automotive

#### 3. Product Listing Screen (Category Detail)
- **Header**: Category name with back button and filter/sort icons
- **Filter Bar**: Sticky horizontal chips (Brand, Price, Size, Color, Rating)
- **Sort Dropdown**: Price low-high, high-low, Newest, Popular, Rating
- **Product Grid**: 2-column grid with:
  - Product image placeholder (gradient with icon)
  - Product name (2 lines max)
  - Brand name
  - Price with original price strikethrough if on sale
  - Rating stars with review count
  - Wishlist heart icon (top-right corner)
  - Add to cart button or quick-add icon

#### 4. Product Detail Screen
- **Image Gallery**: Full-width image with dot indicators, zoom capability indicator
- **Product Info Card** (glassmorphism overlay at bottom):
  - Product name
  - Brand with "Verified" badge
  - Price section: Current price large, original price strikethrough, discount percentage badge
  - Rating with stars and "(123 reviews)" text
  - Size selector chips
  - Color selector circles
  - Quantity selector (+/- with count)
- **Description Section**: Expandable text with "Read more"
- **Size Guide**: Tap to show size chart modal
- **Reviews Section**:
  - Average rating display
  - Rating breakdown bar chart (5 stars to 1 star)
  - Review cards with user avatar, name, date, rating, comment
  - "See all reviews" link
- **Similar Products**: Horizontal scroll of related items
- **Bottom Bar** (glassmorphism):
  - Wishlist heart icon button
  - Add to Cart button (full width, prominent)
  - Buy Now button (optional)

#### 5. Cart Screen
- **App Bar**: "Shopping Cart" title with item count
- **Cart Items List**:
  - Each item in a glass card:
    - Product image thumbnail
    - Product name and variant (size, color)
    - Unit price
    - Quantity selector with +/- buttons
    - Total price for this item
    - Remove/delete icon
    - Move to Wishlist option
- **Promo Code Section**: Input field with "Apply" button
- **Price Summary** (glass card):
  - Subtotal
  - Shipping fee (or "Free" badge)
  - Discount amount (if promo applied)
  - **Total** (bold, large)
- **Checkout Button**: Full-width primary button
- **Empty State**: Illustration with "Your cart is empty" message and "Start Shopping" CTA

#### 6. Wishlist Screen
- **App Bar**: "My Wishlist" title with count and clear all option
- **Wishlist Grid**: 2-column grid similar to product cards
- **Each Item**:
  - Product image
  - Name and price
  - Move to Cart button
  - Remove from wishlist icon
- **Empty State**: Heart illustration with "No favorites yet" message

#### 7. Profile Screen
- **Profile Header**:
  - Avatar with camera edit icon
  - User name (e.g., "John Doe")
  - Email address
  - "Edit Profile" button
- **Stats Row**: Orders, Wishlist, Reviews saved
- **Membership Card** (glassmorphism):
  - "Gold Member" badge
  - Member since date
  - Points accumulated
- **Menu List**:
  - My Orders (with badge for pending)
  - My Reviews
  - Shipping Addresses
  - Payment Methods
  - Notifications
  - Settings
  - Help & Support
  - About
  - Logout

#### 8. Orders Screen
- **Tab Bar**: Active, Completed, Cancelled
- **Order Cards**:
  - Order number and date
  - Status badge (Processing, Shipped, Delivered, Cancelled)
  - Product thumbnails (horizontal scroll)
  - Total amount
  - Action buttons (Track, Review, Reorder, Cancel)

#### 9. Settings Screen
- **Theme Switcher** (prominent): 3 theme options as cards
- Account Settings
- Notification Settings
- Language
- Currency
- Privacy & Security
- App Version

#### 10. Flash Deals Screen
- **Header**: "Flash Deals" title with timer showing time remaining
- **Active Deals Banner**:
  - Large countdown timer
  - "Deal ends in HH:MM:SS"
  - Gradient background card
- **Deal Categories Row**:
  - Horizontal scrollable category chips:
    - All Deals
    - Electronics
    - Fashion
    - Home
    - Beauty
    - Sports
- **Flash Sale Products Grid**:
  - 2-column grid of deal cards:
    - Product image placeholder
    - Original price (strikethrough)
    - Sale price (prominent, colored)
    - Discount percentage badge
    - "XX% OFF" badge
    - Progress bar showing "XX% claimed"
    - "Limited stock" warning
    - "Add to Cart" or "Sold Out" button
- **Lightning Deals Section**:
  - Special highlight for time-sensitive deals
  - Deal ends soon indicator
  - More deals starting soon section
- **Upcoming Deals**:
  - "Coming Soon" section
  - Deals starting later today/tomorrow
  - Notify me button

#### 11. Order Tracking Screen
- **Header**: "Track Order" title
- **Search/Filter Bar**: Search by order number
- **Active Shipments Section**:
  - Each tracking card:
    - Order number and date
    - Product thumbnails
    - Current status badge
    - Estimated delivery date
- **Tracking Timeline Card** (expanded view):
  - Large map placeholder showing route
  - Current location marker
  - Delivery address
  - **Progress Stepper**:
    - Order Placed (completed)
    - Order Confirmed (completed)
    - Shipped (completed)
    - Out for Delivery (current, highlighted)
    - Delivered (pending)
  - Each step with timestamp
- **Delivery Partner Card**:
  - Delivery person photo placeholder
  - Name and contact
  - Call and message buttons
- **Package Contents**:
  - List of items in this shipment
  - Quantity ordered
- **Delivery Instructions**:
  - Leave at door / Ring doorbell / Call on arrival
- **Help Options**:
  - "Report Issue" button
  - "Contact Support" link
- **Past Deliveries Section**:
  - Collapsed list of completed deliveries
  - "View Details" expandable

#### 12. Vendor/Seller Dashboard Screen
- **Header**: "Seller Hub" title
- **Dashboard Stats Overview**:
  - Glass card with key metrics:
    - Total Sales (amount)
    - Orders This Month
    - Revenue
    - Average Rating
  - Each stat with trend indicator (up/down arrow)
- **Quick Actions Row**:
  - Add New Product
  - View Orders
  - Messages
  - Analytics
- **Recent Orders Section**:
  - List of recent orders:
    - Order number
    - Products
    - Buyer name
    - Amount
    - Status (Pending, Processing, Shipped)
    - Action buttons
- **Product Performance Card**:
  - Top performing products list
  - Views, Orders, Conversion rate
- **Pending Actions**:
  - Orders awaiting processing
  - Products low on stock
  - Reviews to respond
  - Messages pending reply
- **Earnings Summary Card**:
  - This week's earnings
  - Pending payouts
  - Total lifetime earnings
  - "Withdraw" button
- **Analytics Preview**:
  - Sales chart placeholder
  - Traffic sources
  - Best selling categories

#### 13. Compare Products Screen
- **Header**: "Compare Products" title with close/back button
- **Product Selector Section**:
  - "Add Product to Compare" chips
  - Can add up to 4 products
  - Search for products
  - Recently viewed quick access
- **Comparison Table**:
  - Product images in columns
  - Product names as headers
  - **Compare Rows**:
    - Price (highlight lowest)
    - Rating (with stars)
    - Reviews count
    - Brand
    - Availability (In Stock/Low/Out)
    - Color options
    - Size options
    - Weight/Dimensions
    - Material
    - Warranty
    - Shipping cost
- **Feature Highlight**:
  - "Best Value" badge on winner
  - "Best Rated" badge
  - "Best Seller" badge
- **Add to Cart Quick Action**:
  - "Add to Cart" buttons for each product
  - Highlighted for best value
- **Similar Products Suggestion**:
  - "You might also like" section

#### 14. Gift Cards Screen
- **Header**: "Gift Cards" title
- **Gift Card Balance Card**:
  - Glass card showing:
    - "Your Balance"
    - Current balance amount
    - Gift card icon
    - "Redeem Code" button
- **Redeem Code Section**:
  - Input field for gift card code
  - "Apply" button
  - Instructions text
- **Buy Gift Card Section**:
  - "Send a Gift" header
  - **Design Selection Grid**:
    - Multiple gift card designs
    - Occasion categories:
      - Birthday
      - Anniversary
      - Holiday
      - Thank You
      - Custom
  - **Amount Selector**:
    - Pre-set amounts: $25, $50, $100, $200
    - Custom amount input
  - **Recipient Details**:
    - Recipient email
    - Recipient name
    - Personal message
    - Send date (Now or Schedule)
  - **Preview Card**:
    - Live preview of gift card
    - Design, amount, message
  - **Add to Cart / Purchase Button**
- **Gift Card History**:
  - Tabs: Received, Sent, Redeemed
  - **Received Cards**:
    - Card design
    - Amount
    - Sender name
    - Expiry date
    - "View Code" button (reveals code)
  - **Sent Cards**:
    - Card design
    - Amount
    - Recipient
    - Status (Pending, Delivered, Redeemed)
    - Resend option
- **Gift Card Terms**:
  - Expiry information
  - Terms and conditions link

### UI Components Library
Create reusable glassmorphism components:
- GlassCard (with blur, border, shadow)
- GlassButton (primary gradient, secondary, outline)
- GlassTextField (search variant, regular)
- GlassToggle (for theme switcher)
- GlassBadge (notification count, sale percentage)
- GlassBottomNav (with indicator animation)
- GlassChip (for filters, categories)
- GlassDialog (for modals, confirmations)
- GlassRating (stars display)
- GlassQuantitySelector (+/- buttons)
- ProductCard (image, info, price, actions)
- CategoryCard (icon, name, count)
- CartItemCard (with quantity controls)
- OrderCard (order summary)
- AnimatedBackground (floating shapes)
- ShimmerLoading (skeleton loading)

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Product Cards**: Scale up slightly on hover/focus
- **Add to Cart**: Button animation + badge count bump
- **Wishlist**: Heart fill animation with scale bounce
- **Bottom Nav**: Smooth indicator slide
- **Lists**: Staggered fade-in on load
- **Images**: Fade-in on load
- **Theme Switch**: Smooth color transition (300ms)
- **Floating Elements**: Subtle continuous float animation
- **Pull to Refresh**: Custom animated indicator
- **Shimmer**: Smooth wave animation on loading states

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Gradients**: Subtle gradients on buttons, headers, backgrounds
- **Borders**: Subtle white/transparent borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Shadows**: Soft, diffused shadows
- **Product Images**: Use gradient placeholders with shopping bag icon
- **Typography**: Clean sans-serif (Poppins or similar)

### Technical Requirements
- Material Design 3 as base
- Mobile-first responsive design
- All images as gradient placeholders or icons
- Use Material Icons (outlined and filled variants)
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
│   ├── categories/
│   │   ├── categories_screen.dart
│   │   └── product_list_screen.dart
│   ├── product_detail/
│   │   └── product_detail_screen.dart
│   ├── cart/
│   │   └── cart_screen.dart
│   ├── wishlist/
│   │   └── wishlist_screen.dart
│   ├── flash_deals/
│   │   └── flash_deals_screen.dart
│   ├── order_tracking/
│   │   └── order_tracking_screen.dart
│   ├── vendor/
│   │   └── vendor_dashboard_screen.dart
│   ├── compare/
│   │   └── compare_products_screen.dart
│   ├── gift_cards/
│   │   └── gift_cards_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   ├── orders/
│   │   └── orders_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── glass_card.dart
│   ├── glass_button.dart
│   ├── glass_text_field.dart
│   ├── glass_toggle.dart
│   ├── glass_badge.dart
│   ├── glass_bottom_nav.dart
│   ├── glass_chip.dart
│   ├── glass_dialog.dart
│   ├── glass_rating.dart
│   ├── product_card.dart
│   ├── category_card.dart
│   ├── cart_item_card.dart
│   ├── deal_card.dart
│   ├── tracking_stepper.dart
│   ├── comparison_table.dart
│   ├── gift_card_design.dart
│   ├── animated_background.dart
│   ├── shimmer_loading.dart
│   └── banner_carousel.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Home screen with all sections
- [ ] Categories with grid layout
- [ ] Product detail with all info
- [ ] Cart with item management UI
- [ ] Wishlist functionality UI
- [ ] Flash Deals with countdown timers
- [ ] Order Tracking with timeline
- [ ] Vendor Dashboard with stats
- [ ] Compare Products feature
- [ ] Gift Cards with purchase flow
- [ ] Consistent glassmorphism style throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] No placeholder text like "Lorem ipsum"
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to home
4. All navigation works (bottom nav, back buttons)
5. All screens have proper e-commerce content
6. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
7. No crashes, no layout overflow, no missing assets
