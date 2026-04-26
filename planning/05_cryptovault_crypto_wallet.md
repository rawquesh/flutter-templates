# CryptoVault - Crypto Wallet & Finance App

## Project Command
```bash
flutter create --org com.bluetouch.cryptovault cryptovault
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a cryptocurrency wallet and finance mobile application called "CryptoVault". This is a UI-only template (no state management, no actual API calls) that demonstrates a premium crypto finance app interface with a sleek dark theme and glowing accents.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.cryptovault cryptovault`
- Navigate to the project folder and work entirely within it
- Install any additional packages needed to achieve a premium glassy modern look
- You have Claude Max subscription so DO NOT worry about token costs - be thorough and comprehensive

### Theme System (MANDATORY - Must Implement)
Create a theme switcher with 3 distinct themes accessible via a toggle button in the top-right corner. The selected theme must persist visually and be indicated clearly. Note: This app naturally lends itself to dark themes, so ensure all 3 themes look premium:

1. **Light Theme**: Light mode with the same blue/green crypto accents (for accessibility)
2. **Dark Sidebar Theme**: Dark sidebar + dark content pages (classic crypto dark)
3. **Dark Theme**: Deep black theme with maximum contrast

For the theme toggle UI:
- Use a segmented control or toggle switch in the app bar
- Show current theme with appropriate icons
- Animate the theme transition smoothly (300ms)

### Color Scheme
- **Primary Color**: Electric Blue (#0A84FF) or Cyan (#00D4FF)
- **Secondary/Accent**: Purple (#BB86FC) for secondary actions
- **Success/Gain**: Bright Green (#00E676) for positive values
- **Error/Loss**: Bright Red (#FF5252) for negative values
- **Warning**: Amber (#FFD740) for alerts
- **Background Light**: Light gray (#F5F5F7) or white
- **Background Dark**: Deep black (#000000) or near-black (#0D0D0D)
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#1C1C1E) with subtle glow
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Deep dark (#0A0A0A)
- **Text Primary Light**: Dark (#1F1F1F)
- **Text Primary Dark**: White (#FFFFFF)
- **Text Secondary Light**: Gray (#8E8E93)
- **Text Secondary Dark**: Gray (#8E8E93)
- **Glow Effects**: Cyan and purple glows on cards and buttons
- **Chart Colors**: Green line for gains, red for losses
- **Bitcoin Gold**: #F7931A
- **Ethereum Purple**: #627EEA
- **Cardano Blue**: #0033AD

### Login Page (MANDATORY - First Screen)
Create a sleek, futuristic glassmorphism-style login page:

- **Background**: Dark gradient background (deep blue to purple or black to dark blue) with animated floating crypto icons (Bitcoin B, Ethereum diamond, blockchain patterns, grid lines)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - CryptoVault logo/icon at top (vault or blockchain icon with glow)
  - "CryptoVault" title with "Your Secure Crypto Wallet" subtitle
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Access Wallet" button with gradient and glow effect
  - "or" divider
  - Biometric login option (fingerprint/face icon)
  - "Create New Wallet" link with different styling
- **Animations**:
  - Fade-in with scale for the glass card
  - Glowing pulse animation on the main button
  - Floating crypto icons and grid patterns in background
  - Subtle particle or grid animation

**On "Access Wallet" tap**: Navigate to the main app dashboard with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Dashboard (home icon)
- Markets (chart icon)
- Portfolio (wallet icon)
- Swap (exchange icon)
- Settings (user icon)

**Side Navigation (Drawer)**:
- Dashboard
- Portfolio
- Markets
- Swap/Trade
- Earn
- Buy Crypto
- Transaction History
- Security
- Settings
- Help

### Screens to Build (UI Only)

#### 1. Dashboard/Home Screen
- **App Bar**:
  - Greeting with user wallet name/address
  - Notification bell icon
  - Theme toggle
  - Settings icon
- **Portfolio Balance Card** (prominent glass card with glow):
  - Total balance in USD (large, bold)
  - Total balance in BTC equivalent
  - 24h change percentage with up/down arrow
  - Mini sparkline chart showing 7d trend
- **Quick Actions Row**: 4 glass icon buttons for:
  - Send
  - Receive
  - Buy
  - Swap
- **Watchlist Section**:
  - Section header with "Edit" option
  - Horizontal scroll of top coins:
    - Coin icon placeholder
    - Symbol (BTC, ETH, etc.)
    - Price
    - 24h change (green/red)
    - Mini chart
- **Recent Transactions**: List of last 5 transactions with status icons
- **Market Overview Card**:
  - BTC Dominance percentage
  - Total Market Cap
  - 24h Volume
  - Fear & Greed Index indicator

#### 2. Markets Screen
- **Header**: "Markets" title with search and filter icons
- **Market Tabs**: All, Favorites, DeFi, NFT, Metaverse
- **Search Bar**: Search coins by name or symbol
- **Market Cap Filter**: $1B+, $100M+, $10M+, All
- **Coin List**:
  - Each row/card:
    - Rank number
    - Coin icon placeholder (colored circle with symbol)
    - Name and full symbol
    - Current price
    - 24h change (percentage with color)
    - 7d sparkline chart
    - Market cap
    - Star icon for watchlist toggle
- **Market Detail Modal**: Tap coin to show quick detail bottom sheet

#### 3. Coin Detail Screen
- **Header**:
  - Back button
  - Coin name and symbol
  - Star/watchlist icon
  - Share icon
- **Price Section**:
  - Large current price
  - 24h change (amount and percentage)
  - 7d/1M/1Y toggle for time range
- **Interactive Chart** (placeholder visualization):
  - Line chart showing price history
  - Time range tabs (24h, 1W, 1M, 3M, 1Y, All)
  - Touch to see price at point
- **Market Stats Grid**:
  - Market Cap
  - 24h Volume
  - Circulating Supply
  - Max Supply
  - All-Time High
  - All-Time Low
- **About Section**: Brief description of the coin
- **Action Buttons**:
  - Buy
  - Sell
  - Swap
- **Related Coins**: Similar cryptocurrencies

#### 4. Portfolio Screen
- **Header**: "Portfolio" title
- **Balance Overview**:
  - Total value in USD
  - Total value in BTC
  - Profit/Loss indicator (amount and percentage)
- **Asset Allocation Chart**: Pie/donut chart showing portfolio distribution (placeholder)
- **Holdings List**:
  - Each asset card:
    - Coin icon and name
    - Amount held
    - Value in USD
    - 24h change
    - Percentage of portfolio
    - Sparkline
- **Empty State**: "Add your first asset" prompt

#### 5. Swap Screen
- **Header**: "Swap" title
- **Swap Interface** (glass card):
  - "You Pay" section:
    - Token selector button (icon + name + down arrow)
    - Amount input field (large)
    - "Max" button
    - Balance display
    - USD equivalent below
  - **Swap Arrow Button** (center, with rotation animation on tap)
  - "You Receive" section:
    - Token selector button
    - Amount input field (auto-filled based on swap rate)
    - USD equivalent
  - **Exchange Rate Display**: "1 BTC = 15.5 ETH" with "Refresh" icon
  - **Price Impact Warning** (if applicable)
  - **Minimum Received** info
- **Slippage Settings**: Link to slippage tolerance options
- **Swap Button**: Full-width primary button "Swap BTC for ETH"

#### 6. Transaction History Screen
- **Header**: "Transactions" title with filter icon
- **Filter Chips**: All, Sent, Received, Swapped, Approved
- **Date Filter**: This week, This month, All time
- **Transaction List**:
  - Each transaction card:
    - Transaction type icon (send arrow, receive arrow, swap arrows)
    - Token name and amount (sent/received)
    - Status badge (Completed, Pending, Failed)
    - Date and time
    - Transaction hash (truncated with copy icon)
    - Gas fee paid
    - Tap to expand for full details
- **Export Button**: "Export History" option

#### 7. Send Screen
- **Header**: "Send" title
- **Recipient Input**:
  - Address input field with paste button
  - "Scan QR" button
  - Recent addresses list
- **Amount Section**:
  - Token selector
  - Amount input
  - USD equivalent
  - Available balance
- **Network Selector**: Mainnet, Layer 2 options
- **Gas Fee Selector**: Slow, Average, Fast with estimated times
- **Review Summary**: Total including fees
- **Send Button**: Full-width with warning text

#### 8. Receive Screen
- **Header**: "Receive" title
- **Token Selector**: Choose which token to receive
- **Wallet Address Display**:
  - Large QR code placeholder (gradient box with QR pattern)
  - Wallet address (truncated middle, full on tap)
  - Copy button (with "Copied!" feedback)
  - Share button
- **Network Warning**: "Only send [Token] on [Network]" warning
- **Deposit History**: Recent deposits list

#### 9. Settings Screen
- **Theme Switcher** (prominent): 3 theme option cards with visual preview
- **Security Section**:
  - Biometric login toggle
  - Change PIN/Password
  - Two-factor authentication
  - Auto-lock timeout
- **Network Preferences**:
  - Default network selector
  - Custom RPC
- **Notifications**: Toggle various notification types
- **Currency**: USD, EUR, GBP display preference
- **Language**: App language
- **About**:
  - App version
  - Terms of Service
  - Privacy Policy
  - Licenses

### UI Components Library
Create reusable glassmorphism components:
- GlassCard (with glow effect option)
- GlassButton (primary gradient, secondary)
- GlassTextField (with crypto icons)
- GlassToggle
- GlassChip
- GlassBadge (status, gain/loss)
- GlassBottomNav (with glow indicator)
- GlassBottomSheet
- GlassDialog
- GlassSwitch (custom toggle)
- CoinListTile (coin in list)
- CoinIcon (placeholder with colored background)
- PriceChangeIndicator (up/down with color)
- SparklineChart (mini line chart)
- BalanceDisplay (large crypto balance)
- TransactionTile
- QRCodePlaceholder
- AnimatedBackground (grid, particles)
- ShimmerLoading
- GlowContainer (card with glow effect)

### Animations Requirements
- **Page Transitions**: Smooth slide transitions with fade
- **Balance Update**: Number roll animation when values change
- **Swap Animation**: Arrow rotation and token swap animation
- **Chart Drawing**: Line chart draws in on load
- **Transaction**: Status update animation
- **Glow Effects**: Subtle pulse on important elements
- **Bottom Nav**: Smooth indicator slide with glow
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle grid or particle animation
- **List Items**: Staggered fade-in on load

### Visual Style
- **Glassmorphism**: Frosted glass effect on cards, navigation, overlays
- **Blur Effect**: backdropFilter with blur sigma 10-25
- **Glow Effects**: Cyan and purple glows on active elements
- **Dark Theme**: Default dark for crypto aesthetic
- **Gradients**: Blue to purple gradients for CTAs
- **Borders**: Subtle glowing borders on glass elements
- **Border Radius**: Rounded corners (12-20 radius)
- **Coin Icons**: Colored circles with symbol letters
- **Typography**: Modern, techy sans-serif (Poppins or similar)
- **Grid Background**: Subtle grid pattern on dark backgrounds

### Technical Requirements
- Material Design 3 as base
- Mobile-first responsive design
- All images as gradient/placeholder or icons
- Use Material Icons
- Shimmer loading effects
- 60fps smooth animations
- Package recommendations:
  - google_fonts
  - flutter_animate
  - shimmer
  - fl_chart (for charts)
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
│   ├── dashboard/
│   │   └── dashboard_screen.dart
│   ├── markets/
│   │   ├── markets_screen.dart
│   │   └── coin_detail_screen.dart
│   ├── portfolio/
│   │   └── portfolio_screen.dart
│   ├── swap/
│   │   └── swap_screen.dart
│   ├── transactions/
│   │   └── transactions_screen.dart
│   ├── send/
│   │   └── send_screen.dart
│   ├── receive/
│   │   └── receive_screen.dart
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
│   ├── coin_list_tile.dart
│   ├── coin_icon.dart
│   ├── price_change_indicator.dart
│   ├── sparkline_chart.dart
│   ├── balance_display.dart
│   ├── transaction_tile.dart
│   ├── qr_code_placeholder.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with futuristic glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Dashboard with portfolio balance and quick actions
- [ ] Markets screen with coin list
- [ ] Coin detail with chart placeholder
- [ ] Portfolio with holdings
- [ ] Swap interface with rate display
- [ ] Transaction history with filters
- [ ] Send and Receive screens
- [ ] Settings with theme switcher prominent
- [ ] Consistent dark theme with glow effects
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Crypto-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes
3. Login navigates to dashboard
4. All navigation works (bottom nav, back buttons)
5. All screens have proper crypto content
6. Charts and visualizations look good
7. No crashes, no layout overflow, no missing assets
