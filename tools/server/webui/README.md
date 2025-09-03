Web UI (Standalone)

Overview
- React + Vite + Tailwind web UI for llama.cpp.
- Works independently of the server repo; points at any running llama.cpp server via a configurable API base URL.

Quick Start
- Install deps: `npm ci`
- Run dev against a local server:
  - Option A (recommended): `VITE_API_BASE=http://localhost:8080 npm run dev`
  - Option B (proxy): `VITE_DEV_PROXY=http://localhost:8080 npm run dev` (the app will call same-origin `/v1` and be proxied by Vite)
- Build: `npm run build` (outputs to `dist/`)

Config
- `VITE_API_BASE`: Base URL of the llama.cpp server (e.g., `https://api.example.com` or `http://localhost:8080`). If omitted, the UI will call the same origin it is hosted from.
- In-app Settings allow changing the Server URL and API Key at runtime. The Server URL defaults to `VITE_API_BASE` when first loaded.

Deploy
- Serve the `dist/` directory on any static host or CDN.
- The app calls the server at `VITE_API_BASE` (or the configured Server URL). Ensure the server is reachable and CORS is allowed. The llama.cpp server already returns permissive CORS based on `Origin`.
- If you enable the Python interpreter (Pyodide) feature, your static host must send headers:
  - `Cross-Origin-Embedder-Policy: require-corp`
  - `Cross-Origin-Opener-Policy: same-origin`

Optional (Legacy embedding)
- For embedding the UI into a server repo, you can run a specialized build that emits `index.html.gz`:
  - `EMBED_FOR_SERVER=1 npm run build`
  - This writes `index.html.gz` adjacent to the server’s expected path when used within that repository layout.

