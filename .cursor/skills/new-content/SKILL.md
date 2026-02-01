---
name: new-content
description: Create new Apple II program posts or blog posts for this Jekyll site. Use when the user wants to add a new program, start a new post, create content, or asks about adding programs or blog entries.
---

# Creating New Content

This skill guides you through creating new program posts or blog posts for the Apple II Programs Jekyll site.

## Content Types

**Program Post**: Showcases an Apple II Applesoft BASIC program with source code, screenshot, and description.

**Blog Post**: General updates, announcements, or articles about the site or Apple II topics.

## Quick Start

Ask the user:
1. **Type**: Program or blog post?
2. **Title**: What should it be called?
3. **Date**: Use today's date or a specific date?

For programs, also ask:
4. **Program type**: One-liner or two-liner?
5. **Performance**: Runs OK at 1MHz or slow?
6. **Source code**: Provide the Applesoft BASIC code

---

## Creating a Program Post

### Required Files

| File | Location | Purpose |
|------|----------|---------|
| Post | `docs/programs/_posts/YYYY-MM-DD-slug.md` | Main post file |
| Source | `docs/_includes/src/slug.txt` | Applesoft source code |
| Screenshot | `docs/media/slug.png` or `.gif` or `.jpg` | Full-size image |
| Thumbnail | `docs/media/slug-tn.png` | Thumbnail (smaller version) |

### Post Template

```markdown
---
layout: post
title: Program Title
date: YYYY-MM-DD
description: Brief description of the program
tags: program one-liner 1mhz-ok
author: Lee Fastenau
screenshot: /media/slug.png
thumbnail: /media/slug-tn.png
source: /src/slug.txt
discussion:
    -
        name: Discussion Link Name
        url: https://example.com/link
---

Description of the program and any usage instructions.
```

### Tag Options

| Tag | Description |
|-----|-------------|
| `program` | **Required** for all programs |
| `one-liner` | Program fits on one line |
| `two-liner` | Program fits on two lines |
| `1mhz-ok` | Runs well on 1MHz Apple II |
| `1mhz-slow` | Runs slow on 1MHz (triggers warp mode in emulator) |
| `notable` | Featured/award-winning program |
| `monochrome` | Best viewed in monochrome mode |

### Source File Format

Create `docs/_includes/src/slug.txt` with the raw Applesoft code. Each logical line should be on its own line:

```
0HGR2:FORN=1TO100:HCOLOR=RND(1)*7+1:HPLOTX,Y:NEXT
```

For two-liners, use two lines:

```
0FIRST LINE OF CODE HERE
1SECOND LINE OF CODE HERE
```

---

## Creating a Blog Post

### Post Template

```markdown
---
layout: post
title: Post Title
date: YYYY-MM-DD HH:MM:SS -0700
tags: updates
author: Lee Fastenau
---

Blog post content here.

Use `<!--more-->` to create an excerpt break.
```

### Common Blog Tags

- `updates` - Site updates and announcements
- `emulation` - Emulator-related content

### Including Images

Use the img include:

```liquid
{% include img.html src="/assets/images/post/image-name.png" caption="Image caption" alt="Alt text description" %}
```

### Including Code Snippets

Use the applesoft include:

```liquid
{% capture source_code -%}
0YOUR CODE HERE
{%- endcapture %}{% include applesoft.md src=source_code %}
```

---

## Naming Conventions

- **Slug**: Lowercase, hyphen-separated (e.g., `my-program-name`)
- **Date format**: `YYYY-MM-DD` or `YYYY-MM-DD HH:MM:SS -0700` for specific times
- **Filename**: `YYYY-MM-DD-slug.md`

## Media Guidelines

- **Screenshots**: Use PNG for static, GIF for animated, JPG for photos
- **Thumbnails**: Should be `-tn.png` suffix, smaller version of screenshot
- Place all media in `docs/media/`

---

## Checklist

### Program Post

- [ ] Create post file: `docs/programs/_posts/YYYY-MM-DD-slug.md`
- [ ] Create source file: `docs/_includes/src/slug.txt`
- [ ] Add screenshot: `docs/media/slug.png|gif|jpg`
- [ ] Add thumbnail: `docs/media/slug-tn.png`
- [ ] Frontmatter includes: layout, title, date, description, tags, author, screenshot, thumbnail, source
- [ ] Tags include `program` plus line count and performance tags

### Blog Post

- [ ] Create post file: `docs/_posts/YYYY-MM-DD-slug.md`
- [ ] Frontmatter includes: layout, title, date, tags, author
- [ ] Add images to `docs/assets/images/post/` if needed
