# Usage Terms

This repository contains a combination of original content, unofficial fan content, and third-party datasets. As such, it is **not governed by a single license**. Please read carefully to understand the applicable usage terms. Unless otherwise noted, all **original content** created by the Toril GIS project is made available under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/) license.

This includes, but is not limited to:

- QGIS project files and layouts
- Custom map styles and symbology
- Scripts and utilities
- Documentation
- Any original datasets created specifically for Toril GIS

This license allows you to use, adapt, and share these components for **non-commercial purposes**, provided you give credit and distribute any modifications under the same terms. If you use or share Toril GIS, please include the following attribution:
> Geospatial Grimoire. Toril GIS: The Source for Forgotten Realms Geospatial Data. Available at: https://github.com/geospatial-grimoire/toril-gis

## Map Layers

The only part of this repository **not uniformly covered by the above license** is the `gis/layers` folder, which contains geospatial datasets sourced from a variety of external origins.
Each dataset may include a companion file named `*.USAGE_TERMS.txt`, describing how that specific file can be used. These usage terms may include formal licenses or more informal reuse policies (such as the Fan Content Policy described below):

- **Unofficial Fan Content** — derived directly from official materials published by Wizards of the Coast and used under their [Fan Content Policy](https://company.wizards.com/en/legal/fancontentpolicy). *Not approved or endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.*
- **Open datasets** — released under various open data usage terms (e.g., Public Domain, Creative Commons).

For convenience, most vector data is compiled into a single GeoPackage file: **`gis/layers/toril.gpkg`**. A GeoPackage is a standard open format used in GIS to store many map layers in one file. It serves as a unified access point for viewing the project's map layers. This file is a **compilation** and is **not released under a single set of usage terms**. Each feature (map object) includes metadata like `source` and `usage_terms`, which you can view directly in GIS software such as QGIS, or by exporting the data to more familiar formats. **Before using or redistributing any part of this file, please check the included metadata and referenced usage terms.**

## Summary

All original components of Toril GIS are made available under **CC BY-NC-SA 4.0**, with the **sole exception** of the `gis/layers` folder and its compiled GeoPackage, which has content subject to a variety of external usage terms. You are welcome to use, remix, and share the original work for non-commercial purposes, provided you meet the conditions of the license. For any reuse or redistribution of geospatial data from the `gis/layers` folder, please refer to the relevant usage terms for each dataset or map feature.