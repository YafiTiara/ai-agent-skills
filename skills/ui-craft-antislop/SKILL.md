---
name: ui-craft-antislop
description: >-
  Anti-slop frontend & UI design system combining taste-skill, anti-slop, and
  Impeccable (DESIGN.md / PRODUCT.md tokens). Use automatically whenever designing,
  building, restyling, or reviewing any landing page, SaaS dashboard, web app,
  or UI component.
---

# UI Craft & Anti-Slop Design System

## 1. One Cohesive System (Design Tokens First)
- If `DESIGN.md` or `PRODUCT.md` exists in the project, read and follow its exact color palette, typography scale, spacing, and component rules.
- Otherwise, establish a single restrained palette (1 dominant background, 1 primary accent, clear neutral hierarchy) and consistent spacing/radius tokens before writing components.

## 2. Anti-Slop Visual Rules
- **Reject generic AI clichés**: avoid purple/indigo-pink neon gradients, floating glassmorphic cards everywhere, generic 3-column icon-box grids, fake vanity metrics, and gratuitous bounce/pulse animations.
- **Typography & Hierarchy**: use deliberate font pairing and clear size/weight contrast (tighter letter-spacing/tracking on large headings, neutral tracking on body); keep prose scannable with generous whitespace and equal visual edges/alignment.
- **Real Content & UI**: use realistic domain copy, real product UI previews, or genuine photography/SVG assets instead of lorem ipsum or empty placeholder boxes.

## 3. Fluid Motion, Gestures & 3D Hygiene (Apple Fluid + Emil Kowalski + GSAP)
- **Crafted Easing & Critically-Damped Springs**: prefer physics springs (`damping ~1.0` by default; `~0.8` only for flicks/rubber-banding) or custom `cubic-bezier` (`150ms–300ms`) with natural `transform-origin`; animate only composited properties (`transform`, `opacity`, `clip-path`)—never `width`, `height`, `top`, or `left`.
- **Interruptible 1:1 Gestures & Velocity Handoff**: for draggable/swipeable UI (drawers, sheets, modals), avoid CSS transitions/`@keyframes`—start motion from the current on-screen value, track the pointer 1:1 on `pointerdown`, inherit release velocity on flicks, and give buttons instant `pointerdown` feedback. Always respect `prefers-reduced-motion`.
- **GSAP Lifecycle**: in React/frameworks, wrap animations in `useGSAP()` (or `gsap.context()` revert) for automatic cleanup, and use `gsap.matchMedia()` for responsive/motion rules. With `ScrollTrigger`, set `invalidateOnRefresh: true` for responsive layouts without hijacking native scroll; with `SplitText`, keep `aria-label` on the parent element for screen readers.
- **3D / WebGL Hygiene**: lazy-load Three.js/R3F/Spline canvases, dispose geometries/materials/textures on unmount, and cap pixel ratio (`dpr`) or provide a static fallback on mobile.

## 4. Layout, Geometry & Mobile-Native Checklist
- Ensure zero horizontal overflow at both desktop (`1280px+`) and mobile (`375px`) viewports.
- **Concentric Geometry & Touch Targets**: align nested rounded corners (`innerRadius = outerRadius - padding`) and keep interactive touch targets at least `44px × 44px`.
- **Mobile-Native Web**: prefer `100dvh` over `100vh`, respect `env(safe-area-inset-*)`, guard hover states with `@media (hover: hover)`, and remove jarring tap highlights.
- Maintain accessible color contrast, visible focus rings, and semantic HTML landmarks.
