---
name: content-motion-studio
description: >-
  Social media content, local media pipeline (yt-dlp, auto-editor, faster-whisper,
  ffmpeg), and programmatic motion video workflow (Remotion, HyperFrames, Lottie).
  Use automatically when scripting IG Reels/posts, processing video/audio clips,
  or building programmatic motion graphics.
---

# Content & Motion Studio

## 1. Social Content & Hook Workflow (IG / Short-Form)
- Structure short-form scripts with: **Scroll-stopping Hook (0–3s)** -> **Relatable Problem / Curiosity Gap** -> **Concrete Value / Demo** -> **Clear CTA**.
- Keep captions scannable with a strong first line and focused hashtags.

## 2. Programmatic Motion Video (Remotion & HyperFrames)
- **Audio & Transcription First**: anchor pacing and kinetic captions to word-level transcribed timestamps/beat markers when voiceover is present.
- **Remotion Determinism**: drive **all** motion from `useCurrentFrame()` + `interpolate()` / `spring()`—NEVER use CSS transitions, Tailwind `animate-*`, or unseeded `Math.random()` (use `random(seed)`). Use `calculateMetadata` for audio-driven duration/dimensions, `<OffthreadVideo>` for frame-accurate sync, `staticFile()` for local assets, and `<Sequence>` / `<TransitionSeries>` (plus `@remotion/captions` for word-by-word sync and cursor/zoom highlights for SaaS UI demos).
- **HyperFrames Alternative**: when building pure HTML/CSS/JS motion graphics instead of React, use `hyperframes` with timeline-seekable animations (`npx hyperframes preview` / `check`).
- **Kinetic Typography & Depth**: use dynamic center/floating captions with crisp spring physics (`damping`, `stiffness`), subtle continuous Z-axis camera/layer motion, and intentional SFX cues.

## 3. Local Media Pipeline (`yt-dlp` -> `auto-editor` -> `faster-whisper` -> `ffmpeg`)
- **Order matters**: run `auto-editor` (silence/jump-cut removal) **before** `faster-whisper` transcription so caption timestamps stay aligned.
- **yt-dlp**: fetch clean MP4 (`H.264`) or audio-only reference clips without bloat.
- **faster-whisper**: generate local SRT/VTT/word-level JSON timestamps from extracted audio.
- **ffmpeg**: export mobile/social-compatible video with `-c:v libx264 -pix_fmt yuv420p -movflags +faststart` and normalize voiceover audio with `loudnorm`.

## 4. Lottie & SVG Logo Animation
- For lightweight web/app motion (loaders, icons, lower thirds), prefer **Lottie JSON** with parameterized slots (swappable colors/text) when reusable.
- When animating static SVG logos, separate distinct layers (icon mark vs. wordmark/text) before applying seamless loop motion.

## 5. Execution & Voiceover Rules (Strict)
- **No Automatic Remotion Rendering**: NEVER run `npx remotion render` or `npm run render` yourself. Always prepare the composition, run `tsc --noEmit` to verify types, and launch `remotion studio` (`npm run dev`) for user preview. Only the user renders the final video on their laptop.
- **Indonesian Tech TTS Phonetics**: When generating Indonesian TTS/cloned voiceovers (`languageCode: "id"`), spell English acronyms phonetically in the TTS prompt text so the model pronounces them naturally without switching accents (while keeping standard spelling in on-screen captions):
  - `AI` -> `"Ey-Ay"`
  - `UI` -> `"Yu-Ay"`
