# TORIL GIS: DATA EXPORT

**Format:** GeoPackage
**Batch ID:** `2026-07-30_2`

> **DISCLAIMER:** This is an automated export of a database in active development.

## Usage Terms

Toril GIS is unofficial Fan Content permitted under the [Wizards of the Coast (WotC) Fan Content Policy](https://company.wizards.com/en/legal/fancontentpolicy). Not approved/endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.

## Layer Inventory

**Total layers:** 29

### global

#### conceptual

- **Geographic Lines** (`glb_con_geographic_lines_ln`)
  - *Key conceptual geographic lines, such as the Equator and Tropics.*
  - *features: 7*
- **Graticule** (`glb_con_graticule_ln`)
  - *Evenly spaced meridians and parallels for geographic positioning.*
  - *features: 542*
- **Graticule MD** (`glb_con_graticule_md_ln`)
  - *Evenly spaced meridians and parallels for geographic positioning, centered around the Myth Drannor prime meridian.*
  - *features: 541*
- **Time Zones** (`glb_con_time_zones_pg`)
  - *15° wide bands across Toril, centered around the Myth Drannor meridian for zero time.*
  - *features: 26*

### surface

#### civilized

- **Important Sites** (`srf_civ_important_sites_pt`)
  - *Key locations of cultural, historical, and strategic significance on Toril's surface, such as bridges, ruins, temples, and fortresses.*
  - *features: 348*
- **Pathways** (`srf_civ_pathways_ln`)
  - *Major roads, trade routes, and travel corridors connecting cities, towns, and settlements on Toril's surface.*
  - *features: 329*
- **Populated Places** (`srf_civ_populated_places_pt`)
  - *Cities, towns, villages, and other inhabited settlements on Toril's surface.*
  - *features: 1030*
- **Structures** (`srf_civ_structures_ln`)
  - *Significant artificial linear constructions on Toril's surface, such as defensive walls, canals, and aqueducts.*
  - *features: 0*

#### conceptual

- **Named Regions** (`srf_con_named_regions_pg`)
  - *The boundaries of various named regions on Toril's surface, including political units and culturally significant or historically established areas without formal governance.*
  - *features: 61*

#### natural

- **Lake Islands** (`srf_nat_lake_islands_pg`)
  - *Islands located within internal waterbodies on Toril's surface.*
  - *features: 52*
- **Lakes** (`srf_nat_lakes_pg`)
  - *Various inland waterbodies on Toril's surface, including internal seas.*
  - *features: 150*
- **Land** (`srf_nat_land_pg`)
  - *Toril's surface areas not covered by ocean, such as continents and oceanic islands.*
  - *features: 2022*
- **Land Cover** (`srf_nat_land_cover_pg`)
  - *Various land cover types on Toril's surface, including sand, ice, woodlands, and swamp.*
  - *features: 479*
- **Land regions** (`srf_nat_land_regions_pg`)
  - *Land areas and significant natural landforms on Toril's surface, such as mountains and valleys.*
  - *features: 482*
- **Landmarks** (`srf_nat_landmarks_pt`)
  - *Notable geographical landmarks on Toril's surface, such as mountains, waterfalls, and capes.*
  - *features: 661*
- **Linear Landmarks** (`srf_nat_linear_landmarks_ln`)
  - *Prominent natural linear landforms on Toril's surface, such as cliffs.*
  - *features: 5*
- **Marine Regions** (`srf_nat_marine_regions_pg`)
  - *Marine areas on Toril's surface, such as bays and gulfs.*
  - *features: 1*
- **Ocean** (`srf_nat_ocean_pg`)
  - *Vast saltwater body covering a large part of Toril's surface.*
  - *features: 16*
- **Rivers** (`srf_nat_rivers_ln`)
  - *Centerlines of rivers, streams, and other significant waterways on Toril's surface.*
  - *features: 1195*
- **Sea Ice** (`srf_nat_sea_ice_pg`)
  - *Sea ice enclosed within the ice packs in the Toril's polar regions.*
  - *features: 2*

### underdark

#### civilized

- **Important Sites** (`udk_civ_important_sites_pt`)
  - *Key sites within Underdark civilizations, such as ancient ruins.*
  - *features: 20*
- **Populated Places** (`udk_civ_populated_places_pt`)
  - *Inhabited locations within the Underdark.*
  - *features: 50*

#### conceptual

- **Named Regions** (`udk_con_named_regions_pg`)
  - *The boundaries of various named regions within the Underdark, including political units and culturally significant or historically established areas without formal governance.*
  - *features: 2*

#### natural

- **Domains** (`udk_nat_domains_pg`)
  - *Major domains of the Underdark, each comprising vast networks of interconnected caverns and caves.*
  - *features: 15*
- **Lakes** (`udk_nat_lakes_pg`)
  - *Significant bodies of water within the Underdark.*
  - *features: 17*
- **Landforms** (`udk_nat_landforms_pg`)
  - *Significant landforms in the Underdark, such as abysses and caverns.*
  - *features: 12*
- **Landmarks** (`udk_nat_landmarks_pt`)
  - *Notable natural landmarks within the Underdark, such as unique geological structures and volcanic sites.*
  - *features: 17*
- **Rivers** (`udk_nat_rivers_ln`)
  - *Major underground rivers and flowing watercourses within the Underdark.*
  - *features: 0*
- **Underground Cover** (`udk_nat_underground_cover_pg`)
  - *Natural ground cover in the Underdark, such as fungal forests and ice.*
  - *features: 1*

## About this format

GeoPackage (.gpkg) is a binary GIS format that stores vectors, raster, and metadata in a single SQLite-based file. Ideal for offline QGIS projects and data exchange between GIS applications.

## Files included

- `toril_gis_layers.gpkg` — vector layers grouped by geometry type
- `toril_gis.qgs` — QGIS project file with layer filters, styling, and visualization settings
- `toril_gis_attachments.zip` — file attachments referenced by features
- `README.md` — this documentation

## How to use

Double-click `toril_gis.qgs` to open the full project in QGIS. You can also open `toril_gis_layers.gpkg` in another GIS tool, but the layer styling and visualization are defined in `toril_gis.qgs`; when using the GeoPackage directly, set up and style the GIS layers yourself. GeoPackage data is grouped by geometry type (`core.polygons_v`, `core.points_v`, and `core.linestrings_v`), not by conventional map layer, so use the `layer_id` field to filter each geometry table into the intended GIS layers.

## Coordinate System

This export uses **Toril GCS** — a custom coordinate reference system for the Forgotten Realms setting.
Coordinate reference system resources are available in [`resources/crs`](https://github.com/geospatial-grimoire/toril-gis/tree/main/resources/crs).
