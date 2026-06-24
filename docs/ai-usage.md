# AI Usage Documentation — D.E.A.R. Podcast Website

> Documentation of how AI was used throughout this project.

---

## AI Tools Used

| Tool | Purpose |
|---|---|
| **opencode** | Primary AI assistant for code generation, architecture planning, project management |

---

## AI Development Environments Comparison

### opencode vs Cursor

| Criterion | opencode | Cursor | Weight |
|---|---|---|---|
| Cost | Free | Free tier available | High |
| AI Integration | Built-in | Built-in | High |
| Response Quality | Excellent | Excellent | High |
| Learning Curve | Low (CLI-based) | Medium (IDE) | Low |
| Multi-file awareness | Strong | Strong | Medium |
| Git integration | Native | Via VS Code | Medium |
| **Conclusion** | **Optimal for this project** | **Good alternative** | - |

**Why opencode was chosen:**
- Direct git integration with automatic commits
- Strong multi-file awareness for project-wide changes
- CLI-based workflow fits the project structure
- Free tier sufficient for this project

---

## Specific Use Cases

### 1. Project Planning & Architecture
- **Prompt:** "Analyze the project structure and create a detailed implementation plan"
- **Result:** Full architecture document with 5-phase plan, Supabase schema, file structure
- **Time saved:** ~2 hours of planning and documentation

### 2. Code Generation
- **Prompt:** "Create a Supabase client module and data fetching functions"
- **Result:** `supabase.js` and `data.js` with all fetch functions
- **Time saved:** ~1 hour of boilerplate code

### 3. CSS Refactoring
- **Prompt:** "Add CSS variables and replace hardcoded colors"
- **Result:** `:root` variables added, all colors refactored across 4 CSS files
- **Time saved:** ~30 minutes of manual find-and-replace

### 4. Page Structure
- **Prompt:** "Build the home page with hero, intro, latest podcasts, and categories"
- **Result:** Complete HTML structure and responsive CSS
- **Time saved:** ~1 hour per page

### 5. Documentation
- **Prompt:** "Create wireframes, style guide, and AI usage documentation"
- **Result:** 3 comprehensive Markdown documents
- **Time saved:** ~2 hours of documentation writing

### 6. Problem Solving
- **Prompt:** "How to handle multi-page build with Vite and auto-discover HTML files?"
- **Result:** Vite config with `readdirSync` for auto-discovery
- **Time saved:** ~30 minutes of research

---

## Iterative Improvements

### CSS Variables
- **Initial:** AI generated variables with generic names
- **Iteration:** Renamed to match project conventions (`--primary`, `--secondary`)
- **Learning:** Understanding CSS custom properties and inheritance

### Supabase Schema
- **Initial:** Basic tables without relationships
- **Iteration:** Added junction table for podcast-presenters, RLS policies
- **Learning:** Database normalization and Supabase security

### Responsive Design
- **Initial:** Desktop-first approach
- **Iteration:** Converted to mobile-first with `min-width` queries
- **Learning:** Mobile-first methodology and breakpoint strategy

---

## Prompt Examples

### Good Prompts
- "Create a Supabase client module that initializes with environment variables"
- "Build a category filter that filters podcasts by category ID"
- "Add responsive breakpoints for tablet (481px) and desktop (1025px)"

### Iterative Prompts
- "Follow the existing CSS style but add responsive breakpoints"
- "Wire the header navigation links to the actual page files"
- "Create a podcast detail page that fetches by URL parameter"

---

## Time Savings Estimate

| Task | Estimated without AI | With AI | Savings |
|---|---|---|---|
| Project planning | 2h | 0.5h | 1.5h |
| Code generation | 8h | 3h | 5h |
| CSS styling | 6h | 2h | 4h |
| Documentation | 3h | 1h | 2h |
| Debugging | 2h | 0.5h | 1.5h |
| **Total** | **21h** | **7h** | **14h** |

---

## Learning Effect

### What I Learned
1. **Supabase integration:** How to structure queries with nested relationships
2. **Mobile-first CSS:** Proper use of `min-width` media queries
3. **Vite multi-page:** Auto-discovering HTML files as entry points
4. **CSS variables:** Proper scoping and inheritance
5. **ES modules:** Import/export patterns for vanilla JS

### Critical Thinking
- Reviewed all AI-generated code before committing
- Adjusted architecture based on project requirements
- Made independent design decisions (color palette, typography)
- Validated responsive breakpoints on target devices

---

## Transparency Statement

This project was developed with AI assistance using opencode. All code was reviewed and understood before being committed. The AI was used for:
- Code generation and scaffolding
- Architecture planning
- Documentation writing
- Problem solving and debugging

All design decisions, architecture choices, and final approvals were made by the developer.
