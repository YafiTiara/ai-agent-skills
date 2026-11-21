---
name: content-motion-studio
description: >-
  Social media content, local media pipeline (yt-dlp, auto-editor, faster-whisper,
  ffmpeg), and programmatic 2D/3D motion video workflow (Remotion full 13-skill
  stack including @remotion/three, HyperFrames, Lottie). Use automatically when
  scripting IG Reels/posts, processing video/audio clips, or building
  programmatic motion graphics.
---

# Content & Motion Studio

## 1. Social Content & Hook Workflow (IG / Short-Form)
- Structure short-form scripts with: **Scroll-stopping Hook (0–3s)** -> **Relatable Problem / Curiosity Gap** -> **Concrete Value / Demo** -> **Clear CTA**.
- Keep captions scannable with a strong first line and focused hashtags.

## 2. Remotion Full-Stack Standards (2D, 3D & Data)
- **Project Setup, Docs & Versioning**: scaffold with `npx create-video@latest`; keep `remotion` and every `@remotion/*` package pinned to the **exact same version**. Query Context7 / `remotion.dev` docs before using unfamiliar APIs. *(License note: free for individuals and teams $\le 3$ people; larger orgs require a Company License).*
- **Deterministic Frame Code**: drive **all** motion from `useCurrentFrame()` + `interpolate()` / `spring()`—NEVER use CSS transitions, Tailwind `animate-*`, `requestAnimationFrame`, or unseeded `Math.random()` (use `random(seed)`).
- **Composition, Studio & Media**: use `calculateMetadata` for audio/prop-driven duration & resolution, `zod` schemas + `defaultProps` for live Remotion Studio editing, `<OffthreadVideo>` for frame-accurate sync, `staticFile()` for local assets, `<Sequence>` / `<TransitionSeries>`, and `mediabunny` when browser-side trimming/metadata extraction is needed.
- **3D Scenes (`@remotion/three` + React Three Fiber)**:
  - Always wrap 3D scenes in `<ThreeCanvas>` from `@remotion/three` (NEVER plain R3F `<Canvas>`).
  - Drive `camera.position`, `camera.lookAt`, and mesh animations from `useCurrentFrame()` (NEVER use R3F `useFrame()` for timeline motion).
  - Build *low-poly* scenes with geometric primitives (`flatShading: true`) or `.glb`/`.gltf` assets, intentional lighting, and post-processing DoF (`EffectComposer`). On Windows, pass `--gl=angle` if WebGL renders black.
- **Captions, SaaS Demos, Charts & Maps**:
  - **Captions**: anchor pacing to `faster-whisper` word-level timestamps using `@remotion/captions`.
  - **SaaS Demos**: wrap UI in clean browser/device frames with `scale` + `transformOrigin` pan/zoom and cursor highlights.
  - **Charts**: animate SVG/Canvas charts via `interpolate()`; if using Recharts/chart libs, set `isAnimationActive={false}` to prevent timer flicker.
  - **Maps**: sync Mapbox/MapLibre/GeoJSON camera and route progress strictly to `useCurrentFrame()`.

## 3. HyperFrames & Lottie / SVG Logo Motion
- **HyperFrames**: when building pure HTML/CSS/JS motion graphics instead of React, use `hyperframes` with timeline-seekable animations (`npx hyperframes preview` / `check`).
- **Lottie & SVG Logos**: use Lottie JSON with parameterized slots (swappable colors/text) for reusable UI motion; separate icon mark vs. wordmark/text layers before animating static SVG logos.

## 4. Local Media Pipeline (`yt-dlp` -> `auto-editor` -> `faster-whisper` -> `ffmpeg`)
- **Order matters**: run `auto-editor` (silence/jump-cut removal) **before** `faster-whisper` transcription so caption timestamps stay aligned.
- **yt-dlp**: fetch clean MP4 (`H.264`) or audio-only reference clips without bloat.
- **faster-whisper**: generate local SRT/VTT/word-level JSON timestamps from extracted audio.
- **ffmpeg**: export mobile/social-compatible video with `-c:v libx264 -pix_fmt yuv420p -movflags +faststart` and normalize voiceover audio with `loudnorm`.

## 5. Execution, Render & Voiceover Rules (Strict)
- **No Automatic Remotion Rendering**: NEVER run `npx remotion render` or `npm run render` yourself. Always run `tsc --noEmit` to verify types, launch `remotion studio` (`npm run dev`) for user preview, and hand the user ready-to-run commands for their laptop:
  - Still check (1 frame): `npx remotion still <CompId> out/check.png`
  - Final MP4: `npx remotion render <CompId> out/video.mp4 --pixel-format yuv420p` (append `--gl=angle` for 3D on Windows).
- **Indonesian Tech TTS Phonetics**: When generating Indonesian TTS/cloned voiceovers (`languageCode: "id"`), spell English acronyms phonetically in the TTS prompt text so the model pronounces them naturally without switching accents (while keeping standard spelling in on-screen captions):
  - `AI` -> `"Ey-Ay"`
  - `UI` -> `"Yu-Ay"`
