# SocialHub - Social Media Dashboard

## Project Command
```bash
flutter create --org com.bluetouch.socialhub socialhub
```

## Detailed AI Agent Prompt

You are building a complete Flutter UI template for a social media dashboard mobile application called "SocialHub". This is a UI-only template (no state management, no actual API calls) that demonstrates a modern social media app interface with engaging visuals and glassmorphism design.

### Project Setup
- Create the project using: `flutter create --org com.bluetouch.socialhub --platforms android,ios socialhub`
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
- **Primary Color**: Vibrant Purple (#7C3AED) or Gradient Purple (#8B5CF6)
- **Secondary/Accent**: Hot Pink (#EC4899) or Coral (#F472B6)
- **Success**: Green (#22C55E)
- **Warning**: Amber (#F59E0B)
- **Error/Heart/Like**: Red (#EF4444) or Pink (#FB7185)
- **Background Light**: Light gray (#F9FAFB) or white
- **Background Dark**: Deep dark (#09090B) or pure black
- **Card Light**: White (#FFFFFF)
- **Card Dark**: Dark elevated (#18181B) or #1C1C1E
- **Sidebar Light**: White (#FFFFFF)
- **Sidebar Dark**: Dark (#0A0A0A)
- **Text Primary Light**: Dark (#18181B)
- **Text Primary Dark**: White (#FAFAFA)
- **Text Secondary Light**: Gray (#6B7280)
- **Text Secondary Dark**: Gray (#A1A1AA)
- **Story Ring**: Gradient purple to pink
- **Verified Badge**: Blue (#3B82F6)
- **Live Badge**: Red (#EF4444)

### Login Page (MANDATORY - First Screen)
Create an engaging, social-media style glassmorphism login page:

- **Background**: Gradient background (purple to pink or dark with gradient accents) with floating social icons (hearts, comments, shares, users)
- **Glassmorphism Card**: Centered frosted glass card containing:
  - SocialHub logo/icon at top (connected users or hub icon)
  - "Welcome to SocialHub" title with "Connect with everyone" tagline
  - Email/username text field with icon
  - Password text field with visibility toggle
  - "Remember me" checkbox
  - "Forgot Password?" link
  - Large "Sign In" button with gradient and press animation
  - Social login buttons (Google, Apple)
  - "Create Account" link
- **Animations**:
  - Fade-in with scale for the glass card
  - Floating social icons in background
  - Button glow animation
  - Heart pulse effect

**On "Sign In" tap**: Navigate to the main app home with a smooth page transition

### Navigation Structure
Create a bottom navigation bar with 5 main sections:

**Bottom Navigation Bar**:
- Home (home icon)
- Search (search icon)
- Create (plus icon in circle)
- Notifications (bell icon with badge)
- Profile (user icon)

**Side Navigation (Drawer)**:
- Home Feed
- Explore
- Reels
- Live
- Stories Archive
- Close Friends
- Business Profile
- Analytics
- Saved
- Settings
- Help & Support
- About
- Logout

### Screens to Build (UI Only)

#### 1. Home Feed Screen
- **App Bar**:
  - SocialHub logo text
  - Theme toggle (top right)
  - Message icon
- **Stories Row** (horizontal scroll):
  - "Add Story" first circle
  - Story circles with:
    - User avatar
    - Gradient ring for unwatched
    - Username below
    - Live badge for live stories
- **Post Feed**:
  - Each post card:
    - **Post Header**:
      - User avatar
      - Username
      - Verified badge (if any)
      - Location (optional)
      - More options (three dots)
    - **Post Image/Carousel**:
      - Single image or multiple with dot indicators
      - Swipeable carousel
      - Double-tap heart animation indicator
    - **Action Bar**:
      - Like heart icon (toggleable)
      - Comment bubble icon
      - Share icon
      - Bookmark icon
    - **Like Count**: "XX likes"
    - **Caption**: Username + caption text (expandable)
    - **Comments Preview**: "View all XX comments"
    - **Timestamp**: "2 hours ago"
- **Suggestions Section**: "Suggested for you" with user cards

#### 2. Search/Explore Screen
- **Header**: "Explore" title
- **Search Bar**: Search with icon, trending hashtags
- **Category Tabs**: All, Reels, Places, Tags, People
- **Explore Grid** (masonry or uniform grid):
  - Post thumbnails
  - Multiple image indicator
  - Reel video indicator
  - Like count overlay
- **Trending Section**:
  - Trending hashtags with post counts
  - Trending places
- **Suggested Accounts**: Horizontal scroll of user suggestions

#### 3. Reels Screen
- **Full-screen Reels**:
  - Video placeholder (gradient with play icon)
  - Progress bar at top
  - User info overlay:
    - Avatar
    - Username
    - Follow button
  - Caption (bottom)
  - Sound/music info
  - Action sidebar (right side):
    - Like button with count
    - Comment button with count
    - Share button
    - Bookmark button
  - Swipe up/down indicator
- **Bottom Navigation**: Home, Search, Create, Reels, Profile

#### 4. Create/Post Screen
- **Header**: "Create New Post" with X close and Next button
- **Image Selector**:
  - Gallery grid
  - Camera option
  - Multiple selection indicator
- **Selected Image Preview**:
  - Image display
  - Next/Previous for multiple
- **Edit Options**:
  - Filter carousel
  - Adjust (brightness, contrast, etc.)
  - Crop tool icon
- **Caption Input**: Text field with character count
- **Tag People**: Add friends
- **Add Location**: Location search
- **Add Hashtags**: Suggested hashtags
- **Share Settings**: Public/Friends/Private
- **Share Button**: Share or Post

#### 5. Notifications Screen
- **Header**: "Activity" title
- **Filter Tabs**: All, Following, You
- **Notification List**:
  - **Follow Request**:
    - Avatar
    - "Username wants to follow you"
    - Follow back / Confirm buttons
  - **Like Notification**:
    - Avatar(s) with heart icon
    - "username liked your post"
    - Post thumbnail
    - Time
  - **Comment Notification**:
    - Avatar with comment icon
    - "username commented: 'great photo!'"
    - Post thumbnail
  - **Follow Notification**:
    - Avatar
    - "username started following you"
    - Follow button / Following status
  - **Mention Notification**:
    - Avatar with @ icon
    - "username mentioned you in a comment"
  - **Live Notification**:
    - Avatar with LIVE badge
    - "username is live"
    - Watch button
- **Mark All Read**: Link

#### 6. Profile Screen
- **Profile Header**:
  - Avatar with camera icon
  - Edit Profile button
  - Settings icon
- **Stats Row**:
  - Posts count
  - Followers count
  - Following count
  - Tap to view each
- **Bio Section**:
  - Name
  - Bio text
  - Link (if any)
- **Highlight Highlights**: Circle stories below bio
- **Edit Profile Button**: Full-width secondary button
- **Grid/List Toggle**: Posts view toggle
- **Posts Grid**:
  - 3-column grid of post thumbnails
  - Multiple image indicator
  - Like count overlay
- **Reels Tab**: Grid of reel thumbnails
- **Tagged Tab**: Posts where user is tagged

#### 7. Other User Profile Screen
- **Header**: Back button, username, verification badge
- **Profile Header**:
  - Avatar
  - Stats row (followers, following, posts)
- **Action Buttons**:
  - Follow/Following button (primary)
  - Message button (secondary)
  - Suggestion/More button
- **Bio Section**: Name, bio, link
- **Highlight Highlights**: Saved stories
- **Posts Grid**: Same as own profile
- **Followers/Following Lists**: Accessible from stats

#### 8. Post Detail Screen
- **Header**: Back button, username
- **Post Content**:
  - Single image
  - Carousel if multiple
- **Action Bar**: Like, comment, share, bookmark
- **Like Count**: "XX likes"
- **Caption with usernames**: Expandable
- **Comments Section**:
  - "View all XX comments"
  - List of comments:
    - Avatar
    - Username
    - Comment text
    - Time
    - Like button
    - Reply link
- **Add Comment**: Input field with post button

#### 9. Messages/Chat Screen
- **Header**: Messages title with edit icon
- **Search Messages**: Search bar
- **Message List**:
  - Each conversation:
    - Avatar
    - Username (bold if unread)
    - Last message preview
    - Time
    - Unread indicator (dot)
    - Profile picture for group chats
- **Empty State**: "No messages yet"

#### 10. Chat Detail Screen
- **Header**: Username, verification badge, call/video icons
- **Message Bubbles**:
  - Sent messages (right, primary color)
  - Received messages (left, gray)
  - Image messages
  - Time stamps
- **Input Bar**:
  - Camera icon
  - Photo picker icon
  - Text input field
  - Emoji picker icon
  - Like button
  - Send button
- **Message Options**: Long press for delete, copy, etc.

#### 11. Settings/Edit Profile Screen
- **Header**: "Settings" or "Edit Profile"
- **Theme Switcher** (prominent): 3 theme option cards
- **Account Settings**:
  - Edit Profile
  - Change Password
  - Linked Accounts
- **Privacy Settings**:
  - Account Privacy (private/public)
  - Story Settings
  - Hidden Words
  - Close Friends
- **Notifications**: Push notification preferences
- **Browser**: Auto-play videos
- **Language**: App language
- **About**:
  - Help Center
  - Terms of Service
  - Privacy Policy
  - App Version

#### 12. Live Streaming Screen
- **Header**: "Live" tab
- **Live Now Section**:
  - Horizontal scroll of live streams:
    - Live indicator badge
    - Stream thumbnail
    - Username
    - Viewer count
    - Category badge
- **Suggested Live Streams**:
  - People you follow who are live
  - Trending live streams
  - Nearby live streams
- **Live Stream Card**:
  - Tap to join full screen
- **Go Live Section**:
  - "Start Live" button
  - Stream setup options
- **Full Screen Live View**:
  - Video stream placeholder
  - Live indicator (red)
  - Viewer count
  - Stream duration
  - **Overlay Controls**:
    - Close/minimize
    - Mute audio
    - Flip camera
    - Effects/filters
  - **Chat Overlay**:
    - Scrolling comments
    - Super comments highlighted
    - Join/leave notifications
  - **Reaction Bar**:
    - Animated reactions (hearts, etc.)
    - Tap to send
  - **Live Shopping** (optional):
    - Product showcase during live
    - "Tap to shop" badge
- **Live Host Controls**:
  - Mute all
  - Pin comment
  - Remove viewer
  - End stream
  - Share stream
- **Post-Live Summary**:
  - Total viewers
  - Peak viewers
  - Likes received
  - Comments count
  - Duration

#### 13. Stories Archive Screen
- **Header**: "Your Story Archive" title
- **Archive Stats Card**:
  - Total stories
  - Total views
  - Most viewed story
- **Stories Timeline**:
  - Chronological list of past stories:
    - Date grouping
    - Story thumbnail preview
    - View count
    - Duration
    - Tap to view
- **Story Detail View**:
  - Full story playback
  - Viewer list
  - Reactions received
- **Highlights Management**:
  - Create highlight from archive
  - Highlight covers editor
  - Reorder highlights
- **Archive Settings**:
  - Auto-archive toggle
  - Archive duration (30 days, 1 year, Forever)
  - Download stories option
- **Shared Stories**:
  - Stories you were tagged in
  - Stories you shared with close friends
- **Storage Info Card**:
  - Space used by stories
  - Clear old stories option

#### 14. Close Friends Screen
- **Header**: "Close Friends" title
- **Current Close Friends List**:
  - List of close friends:
    - Avatar
    - Username
    - Remove button
- **Add Close Friends Section**:
  - Search users to add
  - Suggestions based on interaction
- **Close Friends Feed Filter**:
  - "See Close Friends Content" toggle
  - Preview what they share with you
- **Story Sharing Settings**:
  - Default share setting for new stories
  - Always/Never/Ask option
- **Post Sharing Settings**:
  - Same close friends list for posts
  - Different groups for different content
- **Best Friends**:
  - Mutual close friends
  - "Close Friends" mutual badge
- **Group Management**:
  - Create custom groups
  - Family, Work, Acquaintances
  - Different sharing rules per group
- **Notification Settings**:
  - Notify when someone adds you
  - Alert for close friends posts

#### 15. Business Profile Screen
- **Header**: Switch to Business button
- **Business Dashboard**:
  - Overview stats cards:
    - Total followers
    - Profile views
    - Website clicks
    - Reach
  - **This Week vs Last Week**:
    - Comparison indicators
- **Content Performance**:
  - Recent posts grid:
    - Post thumbnail
    - Likes, comments, shares
    - Best performing highlighted
  - Top performing content
- **Followers Insights**:
  - Follower count chart
  - Growth over time
  - Audience demographics:
    - Age range
    - Gender split
    - Top locations
    - Active times
- **Engagement Metrics**:
  - Average likes per post
  - Average comments
  - Engagement rate
  - Save/share ratio
- **Discovery Stats**:
  - Explore placement
  - Hashtag performance
  - Reels reach
- **Promotions Section**:
  - "Create Promotion" button
  - Active promotions
  - Past campaigns
- **Contact Info Editor**:
  - Business category
  - Contact options
  - Business hours
  - Address
- **Call to Action Buttons**:
  - Customize buttons
  - Email, Phone, WhatsApp, etc.
- **Professional Dashboard Access**:
  - Insights tab
  - Content tab
  - Audience tab
  - Promotions tab

#### 16. Analytics Screen
- **Header**: "Analytics" title with date range selector
- **Overview Stats Cards**:
  - **Accounts Reached**:
    - This week total
    - Change from previous
    - Chart visualization
  - **Accounts Engaged**:
    - Likes, comments, saves, shares
    - Breakdown by type
  - **Total Views**:
    - Profile views
    - Story views
  - **Followers**:
    - Net growth
    - Follow/unfollow chart
- **Content Performance Tab**:
  - **Posts Tab**:
    - Grid of posts
    - Sort by: Likes, Comments, Saves, Reach
    - Each post card:
      - Thumbnail
      - Date posted
      - Likes/Comments/Saves/Shares
      - Reach
  - **Reels Tab**:
    - Reels performance
    - Views count
    - Engagement metrics
  - **Stories Tab**:
    - Stories metrics
    - Views per story
    - Exit rate
- **Audience Tab**:
  - **Followers Chart**:
    - Growth over time
    - Time range selector
  - **Demographics**:
    - Age & Gender pie charts
    - Top locations
    - Active hours heatmap
  - **Follower Sources**:
    - Hashtags
    - Explore
    - Suggested
    - Other
- **Activity Tab**:
  - **Notifications Received**:
    - Likes, Comments, Mentions, DMs
    - Daily breakdown
- **Best Time to Post**:
  - Heatmap of posting times
  - Recommended optimal times
- **Content Ideas**:
  - Trending hashtags
  - Related content suggestions
  - Competitor insights (anonymized)
- **Export Data**:
  - Download reports
  - Weekly/Monthly summaries

### UI Components Library
Create reusable glassmorphism components:
- GlassCard
- GlassButton (primary gradient, secondary)
- GlassTextField
- GlassToggle
- GlassBottomNav (with centered create button)
- GlassBottomSheet
- GlassDialog
- PostCard (complete post UI)
- StoryCircle (story thumbnail with ring)
- StoryRing (gradient ring animation)
- UserAvatar (with verified badge)
- ActionButton (like, comment, share, bookmark)
- CommentBubble
- MessageBubble
- NotificationItem
- ProfileStats
- HighlightCircle
- PostGrid
- ReelCard
- CarouselIndicator (dots)
- ProgressBar (for reels)
- AnimatedBackground
- ShimmerLoading

### Animations Requirements
- **Page Transitions**: Smooth slide transitions
- **Like Animation**: Heart scale + burst animation
- **Double Tap**: Heart overlay animation
- **Story Ring**: Gradient rotation animation
- **Bottom Nav**: Smooth indicator slide
- **Theme Switch**: Smooth color transition (300ms)
- **Background**: Subtle floating social elements
- **List Items**: Staggered fade-in on load
- **Reels**: Auto-scroll or swipe
- **Carousel**: Smooth page transition
- **Follow Button**: Animation on tap

### Visual Style
- **Glassmorphism**: Frosted glass effect on overlays, modals, sheets
- **Blur Effect**: backdropFilter with blur sigma 10-20
- **Gradients**: Purple to pink for story rings, CTAs
- **Instagram-like**: Clean, image-forward design
- **Borders**: Subtle borders on glass elements
- **Border Radius**: Rounded corners (8-16 radius)
- **Typography**: Clean, modern sans-serif (Poppins or similar)
- **Icons**: Outlined for inactive, filled for active

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
│   │   └── home_feed_screen.dart
│   ├── search/
│   │   └── explore_screen.dart
│   ├── reels/
│   │   └── reels_screen.dart
│   ├── live/
│   │   ├── live_screen.dart
│   │   └── live_view_screen.dart
│   ├── create/
│   │   └── create_post_screen.dart
│   ├── notifications/
│   │   └── notifications_screen.dart
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   └── other_profile_screen.dart
│   ├── post/
│   │   └── post_detail_screen.dart
│   ├── messages/
│   │   ├── messages_screen.dart
│   │   └── chat_detail_screen.dart
│   ├── stories_archive/
│   │   └── stories_archive_screen.dart
│   ├── close_friends/
│   │   └── close_friends_screen.dart
│   ├── business/
│   │   └── business_profile_screen.dart
│   ├── analytics/
│   │   └── analytics_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── glass_card.dart
│   ├── glass_button.dart
│   ├── glass_text_field.dart
│   ├── glass_toggle.dart
│   ├── glass_bottom_nav.dart
│   ├── glass_bottom_sheet.dart
│   ├── glass_dialog.dart
│   ├── post_card.dart
│   ├── story_circle.dart
│   ├── story_ring.dart
│   ├── user_avatar.dart
│   ├── action_button.dart
│   ├── comment_bubble.dart
│   ├── message_bubble.dart
│   ├── notification_item.dart
│   ├── profile_stats.dart
│   ├── highlight_circle.dart
│   ├── post_grid.dart
│   ├── reel_card.dart
│   ├── carousel_indicator.dart
│   ├── progress_bar.dart
│   ├── live_stream_card.dart
│   ├── story_archive_card.dart
│   ├── close_friends_tile.dart
│   ├── business_stat_card.dart
│   ├── analytics_chart.dart
│   ├── animated_background.dart
│   └── shimmer_loading.dart
└── utils/
    └── constants.dart
```

### Quality Checklist
- [ ] Login page with engaging glassmorphism design
- [ ] Theme switcher with 3 themes working correctly
- [ ] Default theme is Dark Sidebar + Light Content
- [ ] Home feed with stories and posts
- [ ] Explore/search screen with grid
- [ ] Reels full-screen view
- [ ] Create post screen
- [ ] Notifications screen
- [ ] Profile screen with stats and grid
- [ ] Other user profile
- [ ] Post detail with comments
- [ ] Messages list and chat
- [ ] Live Streaming with viewer controls
- [ ] Stories Archive with management
- [ ] Close Friends with groups
- [ ] Business Profile dashboard
- [ ] Analytics with charts
- [ ] Settings with theme switcher
- [ ] Consistent social media design throughout
- [ ] Smooth animations on all interactions
- [ ] No state management (pure UI)
- [ ] Social-appropriate content text
- [ ] Shimmer loading effects
- [ ] Empty states designed
- [ ] No crashes or layout issues

### Output
When complete, ensure:
1. The app runs without errors: `flutter run`
2. Theme switching works for all 3 themes (using adaptive_theme)
3. Login navigates to home feed
4. All navigation works (bottom nav, back buttons)
5. All screens have proper social media content
6. Post and story UI looks authentic
7. **Android build succeeds**: Run `flutter build apk --debug` and verify BUILD SUCCESSFUL
8. No crashes, no layout overflow, no missing assets
