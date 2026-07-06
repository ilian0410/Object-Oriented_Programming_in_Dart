# Abstract Classes — Challenge

## Instructions

Build a **file converter framework** using an abstract class.

### `FileConverter` abstract class
- **Fields**: `sourcePath` (String), `destinationPath` (String)
- **Constructor**: takes both paths
- **Abstract method**: `void load()` — load the source file
- **Abstract method**: `void convert()` — perform the conversion
- **Abstract method**: `void save()` — save to destination
- **Concrete method**: `void execute()` that calls `load()`, `convert()`, `save()` and prints `"Conversion complete!"` at the end
- **Concrete method**: `String getSummary()` that returns `"sourcePath -> destinationPath"`

### `CsvToJsonConverter` extends `FileConverter`
- **Override `load()`**: prints `"Loading CSV from sourcePath"`
- **Override `convert()`**: prints `"Converting CSV rows to JSON objects"`
- **Override `save()`**: prints `"Saving JSON to destinationPath"`

### `ImageResizer` extends `FileConverter`
- **Additional field**: `targetWidth` (int)
- **Constructor**: takes all four params, calls `super`
- **Override `load()`**: prints `"Loading image from sourcePath"`
- **Override `convert()`**: prints `"Resizing image to targetWidth pixels wide"`
- **Override `save()`**: prints `"Saving resized image to destinationPath"`

### In `main()`:
- Create one of each converter
- Store them in a `List<FileConverter>`
- Loop through and call `execute()` on each, then print the summary

## Expected Output

```
Loading CSV from data.csv
Converting CSV rows to JSON objects
Saving JSON to data.json
Conversion complete!
data.csv -> data.json

Loading image from photo.png
Resizing image to 800 pixels wide
Saving resized image to photo_small.png
Conversion complete!
photo.png -> photo_small.png
```
