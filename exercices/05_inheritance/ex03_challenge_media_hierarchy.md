# Inheritance — Challenge

## Instructions

Design a media hierarchy with three levels of inheritance.

### Base class: `MediaItem`
- **Fields**: `title` (String), `year` (int)
- **Constructor**
- **Method**: `getDescription()` returns `"title (year)"`

### Level 2: `Book` extends `MediaItem`
- **Additional fields**: `author` (String), `pageCount` (int)
- **Override `getDescription()`**: returns `"title by author (year) — pageCount pages"`
- **Method**: `isLong()` — returns `true` if more than 400 pages

### Level 2: `Film` extends `MediaItem`
- **Additional fields**: `director` (String), `durationMinutes` (int)
- **Override `getDescription()`**: returns `"title directed by director (year) — durationMinutes min"`

### Level 3: `Audiobook` extends `Book`
- **Additional fields**: `narrator` (String), `durationHours` (double)
- **Override `getDescription()`**: calls `super.getDescription()` then appends `" — narrated by narrator (durationHours hours)"`

### Level 3: `Documentary` extends `Film`
- **Additional field**: `topic` (String)
- **Override `getDescription()`**: calls `super.getDescription()` then appends `" — Topic: topic"`

### In `main()`:
- Create one `Book`, one `Film`, one `Audiobook`, and one `Documentary`
- Call `getDescription()` on each and print the result

## Expected Output

```
The Hobbit by J.R.R. Tolkien (1937) — 310 pages
Inception directed by Christopher Nolan (2010) — 148 min
Atomic Habits by James Clear (2018) — 281 pages — narrated by James Clear (5.5 hours)
Our Planet directed by Alastair Fothergill (2019) — 60 min — Topic: Nature
```
