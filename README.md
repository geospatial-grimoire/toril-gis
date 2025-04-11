# Toril GIS: The Source for Forgotten Realms Geospatial Data

**Toril GIS** is the most accurate digital map of the Forgotten Realms — built on top of the legendary *Forgotten Realms Interactive Atlas*. It’s an open, fan-made geospatial database that lets you explore Faerûn and other continents, measure distances, translate map labels, and create your own maps or visualizations.

This is part of the [Geospatial Grimoire](https://www.geospatial-grimoire.com/) initiative — where maps come alive, and worlds take shape.

![A glimpse of the Toril GIS project in QGIS](resources/toril-gis-proj-behrmann.jpg)

---

## Quick Start

**Looking for ready-to-use maps?**
Check the [PDF maps folder](./exports/maps) for beautifully rendered, printable maps.

**Want to explore the world interactively?**
Visit [Toril Explorer](https://toril-explorer.geospatial-grimoire.com/) — a live web map based on Toril GIS data.

**Are you a designer or illustrator?**
Download [vector and raster exports](./exports/data) to use in your graphics software (Illustrator, Photoshop, Gimp, etc.).

**GIS user or map nerd?**
Grab the [latest QGIS project release](https://github.com/geospatial-grimoire/toril-gis/releases) — fully styled and ready to use out of the box.

## Repository Structure

This repository is organized to separate GIS data, project configuration, exports, and supporting resources.

### `exports/`

Preprocessed files for external use and public sharing.

- `exports/data/` - Exported datasets in accessible formats such as CSV, GeoJSON, or PNG. These are simplified or reformatted for reuse outside of QGIS or GIS environments.
- `exports/maps/` - Static map exports (e.g., JPG, PDF) rendered from the QGIS project. These represent finalized map views, which may not always reflect the latest edits.

### `gis/`

The main folder for all GIS-related files.

- `gis/crs/` - Custom coordinate reference systems (CRS), including WKT definitions, SQL inserts for PostGIS, and optional QGIS `.prj` or `.qpj` files.
- `gis/layers/` - Core geospatial datasets used in the project (e.g., GeoPackage, GeoJSON). Each file may be accompanied by a `.USAGE_TERMS.txt` file describing its origin and applicable usage terms.
- `gis/project/` - QGIS project files (`.qgz`), map styles (`.qml`, `.svg`), layout templates, and other configuration files used for authoring and visualizing the map.

### `resources/`

Additional reference material to support the GIS work.

### Root files

- `README.md` - this file
- `USAGE_TERMS.md` - Describes the applicable licenses and usage terms for all content in the repository, with special attention to the `gis/layers/` folder.

## Documentation

You’ll find detailed documentation on the use of Toril GIS in the [Toril GIS Wiki](https://github.com/geospatial-grimoire/toril-gis/wiki).

## Blog & Updates

Get the latest news, tutorials, and behind-the-scenes insights on the [Geospatial Grimoire Blog](https://www.geospatial-grimoire.com/blog/).

## License & Usage

Toril GIS is made of original content, unofficial fan content, and third-party datasets. Please read [Usage Terms](/USAGE_TERMS.md) carefully.

> If in doubt, please [open a discussion](https://github.com/geospatial-grimoire/toril-gis/discussions) — we’ll be happy to help.

## Community & Contributions

Toril GIS is a fan-driven, non-commercial project. Contributions are welcome — whether you're helping translate names, improve data, report issues, or simply spreading the word. Join the conversation in the [Discussions section](https://github.com/geogrimoire/toril-gis/discussions).

## Status

_Update status, map exports, and new data releases are handled manually. This project is updated regularly, but not on a fixed schedule._

- **🛠️ Current phase: Active development (2025)** - New features, layers, translations, and styling improvements are being added — your ideas and feedback are especially welcome during this phase!
