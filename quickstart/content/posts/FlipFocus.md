---
title: "FlipFocus - Product Documentation"
date: 2025-12-10
draft: false
tags: ["iOS"]
---

## Product Overview

**FlipFocus** is a minimalist flip clock application with an integrated Pomodoro timer, designed to help users stay focused and productive. The app features a beautiful flip clock display, customizable themes, and seamless integration with iOS system features like Live Activity and Dynamic Island.

---

## Target Users

| User Type | Use Case |
|-----------|----------|
| Students | Study timer, exam preparation, focus sessions |
| Remote Workers | Work sprints, meeting countdowns, desk clock |
| Creatives | Deep work sessions, distraction-free environment |
| General Users | Bedside clock, aesthetic desk display |

---

## Core Features

### 1. Flip Clock Display

A classic flip clock with smooth page-turning animations.

**Specifications:**
- Real-time clock display with hours and minutes
- Smooth flip animation for digit transitions (1.5s duration)
- Breathing colon animation (optional)
- Auto-hide UI controls after 5 seconds of inactivity
- Tap to reveal controls

**Technical Details:**
- Animation: Custom SwiftUI flip animation using 3D rotation
- Update frequency: 1 second interval
- Font: System font with customizable weight and size

---

### 2. Pomodoro Timer

A productivity timer based on the Pomodoro Technique.

**Timer Configuration:**

| Session Type | Duration | Color |
|--------------|----------|-------|
| Focus | 25 minutes | Red |
| Short Break | 5 minutes | Green |
| Long Break | 15 minutes | Green |
| Paused | - | Yellow |

**Cycle Structure:**
```
Round 1: Focus (25m) → Short Break (5m)
Round 2: Focus (25m) → Short Break (5m)
Round 3: Focus (25m) → Short Break (5m)
Round 4: Focus (25m) → Long Break (15m)
→ Cycle repeats
```

**Controls:**
- Play/Pause: Start or pause the current session
- Reset: Return to initial state (Focus, 25:00)
- Skip: Jump to the next session

**Visual Indicators:**
- Circular progress ring showing remaining time
- Round indicator dots (4 dots showing completed rounds)
- State icon (flame for focus, leaf for break, pause for paused)

---

### 3. Live Activity & Dynamic Island

Real-time timer display on Lock Screen and Dynamic Island.

**Supported Devices:**
- Live Activity: iPhone with iOS 16.1+
- Dynamic Island: iPhone 14 Pro, iPhone 14 Pro Max, iPhone 15 series

**Display Modes:**

| Mode | Left Side | Right Side |
|------|-----------|------------|
| Compact | State icon | Progress ring |
| Expanded | Icon + State text | Round indicators |
| Minimal | Progress ring | - |
| Lock Screen | Timer in ring | State + Rounds |

**Data Sync:**
- Updates every second during active timer
- Displays paused time when timer is paused
- Ends automatically when timer is reset

---

### 4. Home Screen Widgets

Quick glance widgets for the Home Screen.

**Widget Sizes:**

| Size | Content | Dimensions |
|------|---------|------------|
| Small | Time display | 155 x 155 pt |
| Medium | Date + Time | 329 x 155 pt |

**Features:**
- Light and dark mode support
- Rounded font design
- Monospaced digits for consistent layout
- Updates every minute

---

### 5. Customization Options

**Background Colors (16 options):**

| Category | Colors |
|----------|--------|
| Blacks | Pure Black, Charcoal, Dark Gray, Graphite |
| Blues | Navy, Midnight, Ocean, Slate |
| Greens | Dark Green, Forest |
| Browns | Dark Brown, Espresso |
| Reds | Dark Red, Wine |
| Purples | Dark Purple, Plum |

**Adjustable Settings:**
- Clock font size (0.8x - 1.2x)
- Clock digit opacity (50% - 100%)
- Colon opacity (30% - 80%)
- Colon breathing animation (on/off)
- Pomodoro font size (0.8x - 1.2x)
- Pomodoro opacity (50% - 100%)

---

### 6. Localization

**Supported Languages (30):**

| Region | Languages |
|--------|-----------|
| East Asia | Chinese (Simplified), Chinese (Traditional), Japanese, Korean |
| South Asia | Hindi |
| Southeast Asia | Indonesian, Malay, Thai, Vietnamese |
| Middle East | Arabic, Hebrew, Turkish |
| Europe | English, German, French, Spanish, Portuguese, Italian, Dutch, Polish, Russian, Ukrainian, Czech, Romanian, Hungarian, Greek, Swedish, Danish, Norwegian, Finnish |

**Localized Content:**
- All UI text
- Settings labels
- Background color names
- App name on Home Screen (via InfoPlist.strings)

---

## User Flows

### Flow 1: Basic Clock Usage

```
1. Open App → Flip Clock displayed
2. Wait 5s → Controls auto-hide
3. Tap screen → Controls appear
4. Tap Settings → Customize appearance
5. Swipe left → Switch to Pomodoro
```

### Flow 2: Pomodoro Session

```
1. Swipe to Pomodoro view
2. Tap Play → Timer starts (25:00)
3. Live Activity appears on Lock Screen
4. Timer counts down
5. At 0:00 → Haptic feedback → Auto-switch to Break
6. Complete 4 rounds → Long Break
7. Tap Reset → Return to initial state
```

### Flow 3: Widget Setup

```
1. Long press Home Screen → Edit mode
2. Tap + → Search "FlipFocus"
3. Select widget size (Small/Medium)
4. Place widget → Done
```

---

## Technical Architecture

### Project Structure

```
FashionClock/
├── FashionClock/
│   ├── FashionClockApp.swift      # App entry point
│   ├── ContentView.swift           # Main container view
│   ├── Views/
│   │   ├── FlipClockView.swift     # Flip clock display
│   │   ├── FlipDigitView.swift     # Single digit with animation
│   │   └── PomodoroView.swift      # Pomodoro timer
│   ├── Models/
│   │   ├── Settings.swift          # App settings (ObservableObject)
│   │   ├── PomodoroTimer.swift     # Timer logic
│   │   └── LiveActivityManager.swift # Live Activity control
│   ├── Ads/
│   │   └── AdManager.swift         # Google AdMob integration
│   └── Resources/
│       └── [30 language].lproj/    # Localization files
│
└── FlipFocusWidget/
    ├── FlipFocusWidget.swift       # Home Screen widget
    ├── FlipFocusWidgetLiveActivity.swift # Live Activity UI
    └── FlipFocusWidgetBundle.swift # Widget bundle
```

### Key Technologies

| Technology | Usage |
|------------|-------|
| SwiftUI | All UI components |
| ActivityKit | Live Activity & Dynamic Island |
| WidgetKit | Home Screen widgets |
| Combine | Reactive data binding |
| UserDefaults | Settings persistence |
| Google AdMob | Monetization |
| UMP SDK | GDPR consent management |

### Minimum Requirements

| Requirement | Value |
|-------------|-------|
| iOS Version | 16.0+ |
| Widget Extension | iOS 17.0+ |
| Live Activity | iOS 16.2+ |
| Dynamic Island | iPhone 14 Pro+ |

---

## Monetization

### Ad Strategy

| Ad Type | Placement | First Day |
|---------|-----------|-----------|
| Banner | Settings page bottom | Shown |
| Interstitial | After closing Settings | Hidden |
| Rewarded | Future feature | Hidden |

**First Day Policy:**
- Banner ads: Always shown
- Interstitial ads: Hidden for first 24 hours after install
- Improves user experience and retention

### Ad Networks

- Google AdMob (primary)
- SKAdNetwork integration for attribution

---

## Privacy & Compliance

### Data Collection

| Data Type | Collected | Purpose |
|-----------|-----------|---------|
| Device ID | Yes (AdMob) | Advertising |
| Usage Data | Yes (AdMob) | Analytics |
| Personal Data | No | - |
| Location | No | - |

### Compliance

- GDPR: UMP SDK for consent management
- CCPA: Supported via UMP SDK
- ATT: App Tracking Transparency implemented
- COPPA: Not targeted at children (4+ rating)

---

## Version History

### Version 1.0.0 (Initial Release)

**Features:**
- Flip clock with smooth animations
- Pomodoro timer (25/5/15 min)
- Live Activity & Dynamic Island support
- Home Screen widgets (Small, Medium)
- 16 background color options
- 30 language support
- Google AdMob integration
- Accessibility support (VoiceOver)

---

## Future Roadmap

| Version | Planned Features |
|---------|------------------|
| 1.1 | Custom timer durations, Sound notifications |
| 1.2 | Apple Watch app |
| 1.3 | Statistics & history tracking |
| 1.4 | iCloud sync, Multiple timer presets |

---

## Support Information

| Resource | Link |
|----------|------|
| Email | levi.duan.arts@gmail.com |
| App Store | https://apps.apple.com/app/id6756367564 |

---

## Document Info

| Field | Value |
|-------|-------|
| Version | 1.0 |
| Last Updated | December 2025 |
| Author | Levi |


