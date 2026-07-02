# AI Usage Documentation — D.E.A.R. Podcast Website

> Personal documentation of how AI was used throughout this project.

---

## Project Context

D.E.A.R. (Drop Everything And Read) is a school project for the Technical Vocational School Zurich. The goal is to build a podcast website showcasing student book presentations. The project requires custom HTML/CSS (no frameworks), mobile-first responsive design, and Supabase as the backend.

---

## Phase 1: Preparation (Before AI) — 10 hours

Before any AI involvement, I did the groundwork entirely on my own:

- **Wireframes** — designed manually, no AI assistance
- **Docker boilerplate** — set up with minor AI help for Docker Compose syntax
- **Discovery & research** — investigated how Supabase works, explored how to build a web project without a framework and without SPA (Single Page Application)
- **Teacher discussions** — exchanged ideas with the teacher to determine the best technical approach for this project

This preparation phase took **10 hours** and was essential to understand the problem space before involving AI.

---

## Phase 2: Foundation

After the preparation, I created the necessary basis files for the AI to build upon. The initial commit (`ba5a9cd`) contains the boilerplate structure — the AI only needed to continue from this foundation. The project structure and frontend basics were established before any heavy AI involvement.

---

## Phase 3: Planning

With the foundation in place, I created `objective-detailed.md` (the VERITE) through an iterative exchange with the AI. **I was responsible for all architectural choices and decisions.** The AI helped structure and document the plan, but every choice — Supabase schema, file structure, mobile-first approach, responsive breakpoints — came from me.

---

## Phase 4: Development

Once the plan was fixed, the AI generated code, but I enforced consistency:

- **Regular commits** — every logical change committed separately with clear messages
- **Clean code** — well-structured, readable, no shortcuts
- **Code review** — despite the backend being generated, I reviewed every line to learn new things, not just copy-paste
- **No "vibe coding"** — I understood every generated piece before accepting it

### Time Savings Estimate

| Task | Estimated without AI | With AI | Savings |
|---|---|---|---|
| Project planning | 2h | 0.5h | 1.5h |
| Code generation | 8h | 3h | 5h |
| CSS styling | 6h | 2h | 4h |
| Documentation | 3h | 1h | 2h |
| Debugging | 2h | 0.5h | 1.5h |
| Transcription sync | 3h | 1h | 2h |
| Sort toggle (newest/oldest) | 2h | 0.5h | 1.5h |
| **Total** | **26h** | **8.5h** | **17.5h** |

The AI saved approximately **20 hours** of development time.

---

## Phase 5: Documentation

The AI assisted with documentation (wireframes, style guide, this file), but under my supervision. I provided the content direction and reviewed everything before committing.

---

## Tool Choice: opencode (Qwen) vs Claude

I chose **opencode with Qwen** over Claude for two main reasons:

1. **Data privacy** — opencode is hosted locally on a server, meaning no code or data leaves the local infrastructure
2. **Ecology** — local hosting reduces the energy footprint compared to cloud-based AI services

### Comparison

| Criterion | opencode (Qwen) | Claude | Weight |
|---|---|---|---|
| Data privacy | Local hosting | Cloud-based | High |
| Ecology | Lower energy footprint | Cloud servers | High |
| Cost | Free | Paid | High |
| Response quality | Excellent | Excellent | High |
| Git integration | Native | Via IDE | Medium |
| **Conclusion** | **Chosen for this project** | — | — |

---

## What I Learned

Through this project and the AI collaboration, I learned:

1. **Supabase** — how to set up a Supabase project, design a schema with relationships, configure RLS policies, use Storage buckets
2. **Docker Compose** — multi-container setups, volume mounts, multi-stage builds, dev/prod overrides
3. **HTML** — semantic HTML structure, proper use of `<main>`, `<section>`, `aria-*` attributes
4. **CSS** — CSS custom properties (variables), mobile-first methodology, `max-height` transitions, `aspect-ratio`, `object-fit`
5. **Vite** — multi-page builds, auto-discovery of HTML entry points, environment variables
6. **AI collaboration** — how to give clear instructions, review AI output critically, maintain consistency across sessions

---

## Transparency Statement

This project was developed with AI assistance using opencode (Qwen). The workflow was:

1. **Preparation** — wireframes, discovery, teacher discussions (10 hours, mostly without AI)
2. **Foundation** — boilerplate and basis files created by the developer
3. **Planning** — all architectural decisions made by the developer, AI helped document
4. **Development** — AI generated code, developer reviewed every line for understanding
5. **Documentation** — AI assisted, developer supervised

**All architectural choices, design decisions, and final approvals were made by the developer.** The AI was a tool for efficiency, not a replacement for understanding.
