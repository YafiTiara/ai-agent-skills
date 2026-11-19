---
name: content-motion-studio
description: >-
  Social media content & programmatic motion video workflow combining
  Instagram content research/hooks, raea, and Remotion viral motion graphics
  standards. Use automatically when scripting IG Reels/posts or building Remotion
  motion graphics videos.
---

# Content & Motion Studio

## 1. Social Content & Hook Workflow (IG / Short-Form)
- Structure short-form scripts with: **Scroll-stopping Hook (0–3s)** -> **Relatable Problem / Curiosity Gap** -> **Concrete Value / Demo** -> **Clear CTA**.
- Keep captions scannable with a strong first line and focused hashtags.

## 2. Programmatic Motion Video (Remotion & Raea Standards)
- **Audio & Transcription First**: anchor pacing and kinetic captions to transcribed timestamps/beat markers when voiceover is present.
- **Deterministic Frame Code**: drive **all** motion from `useCurrentFrame()` + `interpolate()` / `spring()`—NEVER use CSS transitions, Tailwind `animate-*`, or unseeded `Math.random()` (use Remotion `random(seed)`).
- **Media & Sequencing**: use `<OffthreadVideo>` for frame-accurate video sync, `staticFile()` for local assets, and `<Sequence>` / `<TransitionSeries>` for clean scene composition.
- **Kinetic Typography & Depth**: use dynamic center/floating captions with crisp spring physics (`damping`, `stiffness`), subtle continuous Z-axis camera/layer motion, and intentional SFX cues.

## 3. Lottie & SVG Logo Animation
- For lightweight web/app motion (loaders, icons, lower thirds), prefer **Lottie JSON** with parameterized slots (swappable colors/text) when reusable.
- When animating static SVG logos, separate distinct layers (icon mark vs. wordmark/text) before applying seamless loop motion.

## 4. Execution & Voiceover Rules (Strict)
- **No Automatic Remotion Rendering**: NEVER run `npx remotion render` or `npm run render` yourself. Always prepare the composition, run `tsc --noEmit` to verify types, and launch `remotion studio` (`npm run dev`) for user preview. Only the user renders the final video on their laptop.
- **Indonesian Tech TTS Phonetics**: When generating Indonesian TTS/cloned voiceovers (`languageCode: "id"`), spell English acronyms phonetically in the TTS prompt text so the model pronounces them naturally without switching accents (while keeping standard spelling in on-screen captions):
  - `AI` -> `"Ey-Ay"`
  - `UI` -> `"Yu-Ay"`
