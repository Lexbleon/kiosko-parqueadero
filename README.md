# AETHER Lane — kioskos de ingreso y salida

Diseño de gabinete para parqueadero: tres cuerpos (Pylon, Compact VIP, Wall) y dos caras (ingreso / salida). Cotas en milímetros, listas para chapa.

## Cómo revisar el diseño

1. Abre `viewer/index.html` en el navegador (doble clic).
2. Elige modelo, ingreso o salida, y activa **Despiece** o **Cotas**.
3. Gira el modelo con el ratón.
4. Renders de concepto: `renders/`
5. Alzados 2D: `drawings/`
6. CAD paramétrico: abre `cad/aether.scad` en OpenSCAD (cambia `variant` y `face`).

## Carpetas

| Ruta | Contenido |
|---|---|
| `viewer/index.html` | Modelo 3D interactivo + despiece + cotas |
| `cad/aether.scad` | Paramétrico OpenSCAD (STL / DXF) |
| `docs/01-brief.md` | Concepto y lenguaje visual |
| `docs/02-medidas.md` | Medidas exactas y BOM de despiece |
| `docs/03-industria.md` | Cotas de SKIDATA, S&B, CI24, etc. |

## Familia rápida

- **Pylon 1620 × 360 × 300** — carril estándar.
- **Compact VIP 1280 × 260 × 220** — islas reducidas / moto / VIP.
- **Wall 520 × 300 × 140** — para colgar. Montaje auto: fondo a 820 mm sobre isla.

Ingreso: LCD 7" + botón Ø50 + rejilla de impresora.  
Salida: LCD 7" + ventana de lector de barras interno.
