---
name: ثواب — Spiritual Clarity
colors:
  surface: '#f8f9ff'
  surface-dim: '#ccdbf3'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e6eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d5e3fc'
  on-surface: '#0d1c2e'
  on-surface-variant: '#45464d'
  inverse-surface: '#233144'
  inverse-on-surface: '#eaf1ff'
  outline: '#76777d'
  outline-variant: '#c6c6cd'
  surface-tint: '#565e74'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#131b2e'
  on-primary-container: '#7c839b'
  inverse-primary: '#bec6e0'
  secondary: '#904d00'
  on-secondary: '#ffffff'
  secondary-container: '#fe932c'
  on-secondary-container: '#663500'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#271901'
  on-tertiary-container: '#98805d'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dae2fd'
  primary-fixed-dim: '#bec6e0'
  on-primary-fixed: '#131b2e'
  on-primary-fixed-variant: '#3f465c'
  secondary-fixed: '#ffdcc3'
  secondary-fixed-dim: '#ffb77d'
  on-secondary-fixed: '#2f1500'
  on-secondary-fixed-variant: '#6e3900'
  tertiary-fixed: '#fcdeb5'
  tertiary-fixed-dim: '#dec29a'
  on-tertiary-fixed: '#271901'
  on-tertiary-fixed-variant: '#574425'
  background: '#f8f9ff'
  on-background: '#0d1c2e'
  surface-variant: '#d5e3fc'
typography:
  quran-display:
    fontFamily: Amiri Quran, Amiri, serif
    fontSize: 30px
    fontWeight: '400'
    lineHeight: 68px
  quran-body:
    fontFamily: Amiri Quran, Amiri, serif
    fontSize: 24px
    fontWeight: '400'
    lineHeight: 56px
  quran-ayah-number:
    fontFamily: Amiri, serif
    fontSize: 16px
    fontWeight: '700'
    lineHeight: 24px
  display-lg:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 32px
  headline-md:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 28px
  title-md:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 16px
    fontWeight: '500'
    lineHeight: 24px
  body-lg:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 26px
  body-md:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 22px
  label-lg:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  caption:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 11px
    fontWeight: '400'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system establishes a quiet, contemplative digital sanctuary engineered for devotion, study, and daily Islamic practice. The aesthetic language merges Material 3 structural discipline with flat, monastic minimalism. It eliminates distraction by abandoning ambient drop shadows, glossy skeumorphism, and harsh saturated accents in favor of tactile hairline borders, precise typographic proportion, and expansive negative space.

### Core Philosophy & Audience
- **Target Audience:** Daily worshippers, students of scripture, and individuals seeking continuous spiritual habit-building across variable lighting environments (daylight recitation, night prayer, low-light mosque environments).
- **Emotional Resonance:** Reverence, serenity, legibility, and architectural poise. The interface recedes entirely, allowing sacred text and intentional actions (Dhikr, prayer timings, recitation) to hold absolute focus.
- **RTL-First Architecture:** Built strictly for Right-to-Left (RTL) reading flows. Layout geometry, icon orientation, list hierarchies, and progress vectors honor the natural mechanics of the Arabic script.
- **Negative Constraints:** Strictly zero ambient drop shadows (`box-shadow: none`), zero photographic imagery, zero harsh neon gradients, and zero pure white (`#FFFFFF`) body or heading text to prevent ocular fatigue during sustained reading sessions.

## Colors

The system relies on four contextual theme modes tuned for optical comfort during recitation and ritual workflows. Depth is produced exclusively via tonal shift and hairline borders, never through drop shadows. Pure `#FFFFFF` text is forbidden across all themes to preserve typographic softness.

### Theme Matrix

#### 1. Light (Default — Day & High-Ambience)
- **Canvas / Background:** `#FDFBF7` (Warm parchment neutral)
- **Surface / Card:** `#FFFFFF`
- **Border / Hairline:** `#E2E8F0`
- **Text Primary:** `#0F172A`
- **Text Muted:** `#475569`
- **Primary Brand:** `#0F172A`
- **Accent (Gold / Nur):** `#D97706`

#### 2. Sepia (Traditional Reading & Eye Comfort)
- **Canvas / Background:** `#F4ECD8`
- **Surface / Card:** `#FBF5E6`
- **Border / Hairline:** `#DDD2B5`
- **Text Primary:** `#3B2F2F`
- **Text Muted:** `#6B5B4B`
- **Primary Brand:** `#3B2F2F`
- **Accent (Gold / Amber):** `#D97706`

#### 3. Dark Navy (Nocturnal & Tahajjud)
- **Canvas / Background:** `#0F172A`
- **Surface / Card:** `#1E293B`
- **Border / Hairline:** `#334155`
- **Text Primary:** `#E2E8F0`
- **Text Muted:** `#94A3B8`
- **Primary Brand:** `#D97706`
- **Accent (Gold):** `#D97706`

#### 4. OLED Black (Pure Battery Preservation & Deep Night)
- **Canvas / Background:** `#000000`
- **Surface / Card:** `#111113`
- **Border / Hairline:** `#27272A`
- **Text Primary:** `#E5E5E5`
- **Text Muted:** `#A1A1AA`
- **Primary Brand:** `#D97706`
- **Accent (Gold):** `#D97706`

### Usage Rules
- Semantic gold (`#D97706`) is reserved for sacred signifiers: active prayer tracking indicators, ayah markers, bookmark toggles, and completed tasbeeh cycles.
- Borders must always render as `1px solid [theme-border]`. Do not use multi-stop gradients or blurred borders.

## Typography

The typographic engine balances crisp contemporary UI wayfinding with traditional Quranic calligraphy. 

### Font Roles
- **Quran & Sacred Text (`Amiri Quran`, fallback `Amiri`):** Calibrated with expansive line-heights (`lineHeight: 56px` to `68px`) to ensure complex Arabic vocalization, tashkeel, maddah, and waqf marks remain completely legible without vertical clipping.
- **Interface & System (`IBM Plex Sans Arabic`):** Neutral, architectural, and highly structured across both Latin numbers and Arabic glyphs.

### RTL Typographic Rules
- Body text alignment defaults to right (`text-align: right`). Scripture center-alignment is strictly permitted only for single solitary ayahs or short dua cards.
- Letter spacing (`letter-spacing`) must remain `0` or `normal` across all Arabic text variants. Expanding letter tracking degrades the natural cursive ligature connections of Arabic typography.
- Ayah end markers and digits must utilize standard Arabic-Indic or clean Eastern numerals rendered inside circular boundary tokens.

## Layout & Spacing

The canvas is tailored for a standard mobile viewport (390x844 viewport target) using an 8pt architectural rhythm, with a supplementary 4pt baseline for compact component interiors.

### Viewport Guidelines
- **Margins & Safe Areas:** Side canvas margin is locked to `1rem` (16px). Top safe area accommodates dynamic status bar metrics; bottom area enforces minimum navigation clearance above the home indicator.
- **Grid Structure:** Single-column stacked content layout for reading views, splitting into a 2-column symmetric grid for prayer times, tasbeeh metrics, and Surah indexing cards.
- **Touch Target Discipline:** Every interactive touchpoint (buttons, ayah bookmarks, audio scrubbers, audio speed triggers, list items) must satisfy a strict minimum envelope of `48x48px`, regardless of visual footprint.
- **RTL Flow:** Padding and margin directives follow logical CSS properties (`margin-inline-start`, `padding-inline-end`) ensuring native flipping when transitioning between language contexts without hardcoded directional shifts.

## Elevation & Depth

This design system completely discards elevation through drop shadows (`box-shadow: none !important`, `elevation: 0`). Depth and visual hierarchy are communicated strictly through:

1. **Hairline Structural Borders:** Every card, container, divider, and bottom navigation bar is framed by a `1px solid` border using the designated theme border token (`#E2E8F0`, `#DDD2B5`, `#334155`, or `#27272A`).
2. **Tonal Planar Contrast:** Visual grouping uses contrast between canvas backgrounds (e.g., `#FDFBF7`) and card surfaces (e.g., `#FFFFFF`).
3. **Active & Selected States:** Highlighted states employ solid border color swaps (transitioning to `#D97706`) or an inner tint offset rather than elevated z-axis shifts.
4. **Dividers:** Horizontal and vertical dividers share the exact theme hairline color, maintaining a crisp, architectural blueprint aesthetic throughout.

## Shapes

The shape vocabulary uses structured softness to counterbalance the rigidity of flat hairline borders.

- **Base Radius (`rounded-md`):** `0.5rem` (8px) applied to standard text fields, small prayer card badges, and menu surfaces.
- **Component Radius (`rounded-lg`):** `1rem` (16px) applied to primary cards, modal bottom sheets, prayer timetable containers, and ayah containers.
- **Specialty Radius (`rounded-full`):** Used strictly for icon buttons, tasbeeh counters, ayah index badges, and floating control nodes.
- **Outer Shell Alignment:** In nested card layouts, inner container radii scale downward by 4px to maintain concentric geometric balance with parent containers.

## Components

### Buttons
- **Primary Button:** Solid fill with theme primary color (`#0F172A` in light, `#D97706` in dark modes). Height: 48px minimum. Text: `label-lg`, contrast color. Border: `1px solid transparent`. Border radius: `0.75rem`. Zero shadow.
- **Secondary / Outline Button:** Background: transparent. Height: 48px. Border: `1px solid [theme-border]`. Text: `theme-text-primary`. Active state swaps border to `accent-gold`.
- **Icon Action Buttons (Audio, Bookmark, Share):** Minimum touch zone `48x48px` centered on a 24px icon. Optional hairline perimeter border.

### Prayer & Ayah Cards
- **Card Structure:** Flat surface fill matching `theme-surface`. Border: `1px solid [theme-border]`. Border radius: `1rem`. Internal padding: `1rem` to `1.25rem`.
- **Ayah Reading Tile:** Houses scripture in `quran-body` with explicit right alignment. Includes an ayah action utility row with discrete 48x48px tap targets for recitation playback, tafsir expansion, and bookmarking.
- **Active Prayer Card:** Outlined with `1px solid #D97706` with a subtle badge denoting the upcoming prayer interval.

### Chips & Badges
- **Juz / Surah Type Chip:** Height: 32px (embedded inside 48px touch bounding box). Padding: `0.25rem 0.75rem`. Radius: `0.5rem`. Border: `1px solid [theme-border]`. Background: transparent.
- **Active Filter Chip:** Background: `[theme-primary]` or gold tint. Border: `1px solid [theme-primary]`.

### Lists & Surah Index
- **List Items:** Explicit height minimum 56px to guarantee comfortable 48px touch registration.
- **Divider:** `1px solid [theme-border]` positioned between items, terminating with a 16px inset from the canvas margin.
- **Number Indicators:** Surah index numbers placed inside a 36px circular frame (`border: 1px solid [theme-border]`) with `quran-ayah-number` font.

### Checkboxes & Radio Controls
- **Form Controls:** Flat 22x22px geometry (with minimum 48x48px touch frame). 
- **Borders:** `1.5px solid [theme-border]`.
- **Selected State:** Filled with `#D97706` exhibiting an internal white or canvas-matching glyph. No ambient glow or drop shadow.

### Input Fields & Search Bars
- **Search Bar (Surah/Ayah Lookup):** Height: 48px. Background: `[theme-surface]`. Border: `1px solid [theme-border]`. Padding: `0 1rem`. Trailing search icon oriented for RTL. Focus state: `1px solid #D97706`. Text: `body-md`.

### Tasbeeh Digital Counter
- **Counter Display:** Minimalist geometric disk with a prominent central tap area (minimum 180x180px for blind physical thumb taps).
- **Perimeter Ring:** Flat hairline stroke representing cumulative progress toward customary increments (33, 99, 100), highlighted with `#D97706`. Zero radial shadows or skeuomorphic plastic bevels.