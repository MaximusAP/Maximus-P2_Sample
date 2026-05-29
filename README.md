# MaximusLab Website

> *"A man's own mind is the greatest battle he will face."* — Maximus

A fully responsive, production-ready static website for **MaximusLab**, served via Docker + Nginx.

---

## Project Structure

```
maximuslab-site/
├── index.html        # Main website (HTML + CSS + JS, single file)
├── MaximusLab.png    # Hero image asset
├── nginx.conf        # Custom Nginx server configuration
├── Dockerfile        # Docker image definition (FROM nginx:latest)
└── README.md         # This file
```

---

## Quick Start

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed and running

### 1. Clone / Download the project
Place all files in the same directory:
```
maximuslab-site/
├── index.html
├── MaximusLab.png
├── nginx.conf
└── Dockerfile
```

### 2. Build the Docker image
```bash
docker build -t maximuslab .
```

### 3. Run the container
```bash
docker run -d -p 80:80 --name maximuslab-site maximuslab
```

### 4. Open in browser
```
http://localhost
```

---

## Docker Commands Reference

| Action | Command |
|---|---|
| Build image | `docker build -t maximuslab .` |
| Run container | `docker run -d -p 80:80 --name maximuslab-site maximuslab` |
| Stop container | `docker stop maximuslab-site` |
| Remove container | `docker rm maximuslab-site` |
| View logs | `docker logs maximuslab-site` |
| Rebuild & restart | `docker stop maximuslab-site && docker rm maximuslab-site && docker build -t maximuslab . && docker run -d -p 80:80 --name maximuslab-site maximuslab` |

### Run on a different port (e.g. 8080)
```bash
docker run -d -p 8080:80 --name maximuslab-site maximuslab
# Open: http://localhost:8080
```

---

## Features

- **Fully Responsive** — adapts to all screen sizes (desktop, tablet, mobile)
- **Mobile Navigation** — hamburger menu with full-screen overlay on small screens
- **Cinzel / Crimson Text typography** — Roman-themed Google Fonts loaded via CDN
- **Gold accent design system** — CSS variables for consistent theming
- **Animated entrance** — hero content fades up on page load
- **Grain texture background** — inline SVG noise overlay for depth
- **Stats section** — Warriors, Days, Potential counters
- **Gzip compression** — enabled in Nginx for faster delivery
- **Static asset caching** — images cached for 30 days via Nginx headers
- **Zero dependencies** — pure HTML, CSS, and vanilla JS; no build step required

---

## Nginx Configuration

The custom `nginx.conf` provides:
- Serves files from `/usr/share/nginx/html`
- **Gzip** compression for HTML, CSS, JS, and image types
- **Cache-Control** headers (`30d`, `immutable`) for `.png`, `.jpg`, `.woff2`, etc.
- SPA-friendly routing (`try_files $uri /index.html`)

---

## Customization

### Change the quote or tagline
Edit `index.html` — search for the `<blockquote>` tag:
```html
<blockquote class="hero__quote">
  "A man's own mind is the greatest battle he will face."
  <cite>— Maximus</cite>
</blockquote>
```

### Change colors
All colors are CSS variables at the top of the `<style>` block:
```css
:root {
  --gold:       #c9a84c;
  --gold-light: #e8c97a;
  --crimson:    #8b1a1a;
  --dark:       #0d0a07;
  --parchment:  #f0e6cc;
}
```

### Replace the hero image
Swap `MaximusLab.png` with your own image and update the `src` in `index.html`:
```html
<img class="hero__img" src="YourImage.png" alt="Your alt text" />
```
Then rebuild the Docker image.

### Update stats
Find the `.stats` section in `index.html`:
```html
<div class="stat">
  <span class="stat__number">10K+</span>
  <span class="stat__label">Warriors Joined</span>
</div>
```

---

## Browser Support

Works on all modern browsers: Chrome, Firefox, Safari, Edge.  
No polyfills required — uses standard CSS Grid, Flexbox, and CSS variables.

---

## License

© 2025 MaximusLab. All rights reserved.
