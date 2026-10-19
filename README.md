<div align="center">
  <h1>Flutter Templates</h1>
  <p><strong>Four production-grade Flutter UI templates — e-commerce, food delivery, healthcare, and fitness.</strong><br>
  Glassmorphism design, dark &amp; light themes, smooth animations, and mock data throughout. Clone a folder, run it, and make it yours.</p>
</div>

[![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.13-0175C2.svg)](https://dart.dev/)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📱 The Templates

| Template | What it is | Screens |
|---|---|---|
| [ShopWave](#1--shopwave--e-commerce) | E-commerce storefront | 15 |
| [FoodieGo](#2--foodiego--food-delivery) | Food delivery | 14 |
| [MediCare Plus](#3--medicare-plus--healthcare) | Healthcare & appointments | 14 |
| [FitLife Pro](#4--fitlife-pro--fitness--workouts) | Fitness & workout tracking | 16 |

> **Screenshots:** coming soon — each template is visual-first, so run one with `flutter run` to see it live, or capture screens from your device to drop into `assets/screenshots/`.
>
> **Note:** these are **UI templates** — polished front-ends wired to local mock data. No backend, no API keys, no state-management packages. They are starting points you can connect to Firebase, REST APIs, or your own backend.

---

### 1. 🛍️ ShopWave — E-Commerce

A complete online store: storefront, catalog, and order flow with a vendor dashboard.


**Highlights**
- Home with banner carousel, category grid, flash-deal countdown (live timer), and featured products
- Product detail with image gallery dots, quantity selector, and reviews entry point
- Side-by-side product comparison table
- Cart, wishlist, gift cards, and checkout flow
- Order list + animated order-tracking stepper
- Vendor dashboard screen
- Working navigation drawer, glassmorphic dialogs, shimmer loading states

```
shopwave/
├── lib/screens/   # home, categories, product_detail, compare, cart, wishlist,
│                   # flash_deals, gift_cards, orders, order_tracking, vendor, login…
├── lib/widgets/   # product_card, deal_card, banner_carousel, comparison_table,
│                   # tracking_stepper, glass_* components…
└── lib/theme/     # light / dark themes, shared colors
```

---

### 2. 🍔 FoodieGo — Food Delivery

A food-delivery app: discover restaurants, order food, book tables, and track deliveries.


**Highlights**
- Home with restaurant/food cards, category chips, and offer banners
- Restaurant detail with menu, reviews screen, and bestseller badges
- Food detail with working add-ons (extras adjust the total live)
- Advanced search with filters; results navigate to restaurant pages
- Cart with quantity steppers, checkout, and order history
- Live order-tracking screen with timeline
- Table-booking flow with seating preferences
- Dark/light theme-aware throughout

```
foodiego/
├── lib/screens/   # home, search, restaurant, cart, checkout, orders,
│                   # order_tracking, booking, login, profile, settings…
├── lib/widgets/   # restaurant_card, food_item_card, cart_item_card,
│                   # quantity_selector, rating_stars, offer_banner…
└── lib/theme/     # light / dark themes, shared colors
```

---

### 3. 🏥 MediCare Plus — Healthcare

A healthcare companion: find doctors, book appointments, and manage health records.


**Highlights**
- Dashboard with upcoming appointments, quick actions, and health tips
- Doctor directory with specialty filters and an empty-state design
- Appointment booking flow and appointment management (upcoming / pending / completed / cancelled)
- Video-consultation screen, symptom checker, and medicine reminders
- Health records with tabbed categories, health articles, and emergency screen
- App shell with glass sidebar navigation + bottom nav, real dark/light theme switching

```
medicare_plus/
├── lib/screens/   # dashboard, doctors, appointments, medicines, health_records,
│                   # symptom_checker, video_consultation, emergency, articles…
├── lib/widgets/   # doctor_card, appointment_card, symptom_card, article_card,
│                   # glass_sidebar, glass_dialog, glass_* components…
└── lib/theme/     # light / dark themes, theme controller
```

---

### 4. 💪 FitLife Pro — Fitness & Workouts

A fitness tracker: workouts, nutrition, hydration, and progress analytics.


**Highlights**
- Dashboard with activity rings, streak calendar, and quick stats
- Workout library with detail pages and a guided active-workout screen (timer included)
- Exercise database with muscle-group filters and step-by-step instructions
- Progress analytics with charts ([fl_chart](https://pub.dev/packages/fl_chart))
- Diet tracking, meal planner, and water tracker with custom goals
- Body-measurements log and community challenges
- Theme-aware in both dark and light mode; "More Features" hub links every screen

```
fitlife_pro/
├── lib/screens/   # home, workouts, active_workout, exercises, progress, diet,
│                   # meal_planner, water_tracker, body_measurements, challenges…
├── lib/widgets/   # workout_card, glass_progress_ring, macro_ring, streak_calendar,
│                   # water_progress_ring, measurement_chart, workout_timer…
└── lib/theme/     # light / dark themes, shared colors
```

---

## ✨ Shared design language

Every template is built on the same foundation, so components feel familiar across apps:

- **Glassmorphism** — frosted cards, bottom navs, dialogs, and buttons (`glass_*` widgets in each template)
- **Dark & light themes** — full theme pairs with a settings toggle; no hardcoded colors that break in either mode
- **Motion** — page transitions and micro-animations via [flutter_animate](https://pub.dev/packages/flutter_animate)
- **Loading states** — shimmer placeholders via [shimmer](https://pub.dev/packages/shimmer)
- **Typography** — runtime Google Fonts via [google_fonts](https://pub.dev/packages/google_fonts) (needs internet on first launch)
- **Zero backend** — everything runs on structured mock data; no keys or accounts needed

## 🛠️ Tech stack

| | ShopWave | FoodieGo | MediCare Plus | FitLife Pro |
|---|---|---|---|---|
| cupertino_icons | – | ✅ | ✅ | ✅ |
| google_fonts | ✅ | ✅ | ✅ | ✅ |
| flutter_animate | ✅ | ✅ | ✅ | ✅ |
| shimmer | ✅ | ✅ | ✅ | ✅ |
| adaptive_theme | – | ✅ | ✅ | – |
| fl_chart | – | – | – | ✅ |

All four templates pass `flutter analyze` with **zero issues** on the latest stable SDK.

---

## 💻 Requirements

- **Flutter**: 3.x stable (tested on 3.47.7)
- **Dart**: 3.x (comes with Flutter)
- **Platforms**: Android / iOS (Android Studio or Xcode for device builds)
- No backend accounts, API keys, or extra services required

---

## ⚡ Quick start

Each template is a standalone Flutter project — pick one and run it:

```bash
# 1. Clone the repo
git clone https://github.com/rawquesh/flutter-templates.git
cd flutter-templates

# 2. Pick a template
cd shopwave        # or foodiego, medicare_plus, fitlife_pro

# 3. Get dependencies
flutter pub get

# 4. Run it
flutter run
```

> First launch needs an internet connection so `google_fonts` can fetch fonts. After that, fonts are cached.

### Run the tests

```bash
cd foodiego && flutter test
```

### Analyze

```bash
flutter analyze   # zero issues on all four templates
```

---

## 📁 Repository structure

```
flutter-templates/
├── shopwave/          # 🛍️ E-commerce template
├── foodiego/          # 🍔 Food delivery template
├── medicare_plus/     # 🏥 Healthcare template
├── fitlife_pro/       # 💪 Fitness template
├── planning/          # Design specs & implementation plans (incl. ideas for future templates)
└── assets/
    └── screenshots/   # README showcase screenshots
```

The `planning/` folder holds the original design specifications for each built template, plus specs for future template ideas (crypto wallet, travel booking, online learning, event tickets, home services, social).

---

## 🎨 Customizing a template

1. **Branding** — start in `lib/theme/colors.dart` and `lib/theme/app_theme.dart`: primary colors, fonts, radii.
2. **Data** — mock data lives next to the screens that use it (look for lists like `_restaurants`, `_workouts`, `_doctors`); swap in your API models.
3. **Backend** — add `firebase_core` / your REST client, replace the mock lists with real futures, and keep the widgets as-is.
4. **App identity** — update `name`/`description` in `pubspec.yaml` and the `applicationId` / bundle ID under `android/` and `ios/`.

---

## 🤝 Contributing

Issues and pull requests are welcome — especially new templates following the same glassmorphism design language. Please run `flutter analyze` and `flutter test` before submitting.

## 📄 License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute these templates for personal or commercial projects.
