# Brief de diseño — AETHER Lane

Kiosko de **ingreso** y **salida** para parqueaderos. No incluye talanquera, isla, LPR de poste ni cajero de pago.

## Problema

Los gabinetes locales (CI24, Security Access, VIPPARK) son cajas rectas de inox o pintura. Los internacionales (SKIDATA, S&B, Designa) son más resueltos, pero se leen como “máquina de peaje”. El carril colombiano pide algo que:

1. Alcance la ventana del auto sin bloquear la isla.
2. Distinga ingreso (botón + ticket) de salida (lector interno).
3. Tenga versión VIP / moto / colgable.
4. Se fabrique en chapa plegada, no en moldes caros.

## Concepto

**AETHER** = un **filo de vehículo**, no un armario.

- Planta trapezoidal: ancha hacia el conductor, estrecha hacia la talanquera.
- **Cockpit hundido** de 28 mm: la ceja sustituye el parasol tipo hongo.
- **Blade LED** vertical en el canto de ataque (cian ingreso / ámbar salida).
- Una sola familia de cara: se cambia la hoja frontal y el interior.

## Tres cuerpos, dos caras

| Modelo | Uso | Alto | Frente |
|---|---|---:|---:|
| Pylon | Carril de autos, isla 500–600 | 1620 | 360 |
| Compact VIP | Isla estrecha, sótano, moto, VIP | 1280 | 260 |
| Wall | Columna, muro, lobby VIP | 520 (cuerpo) | 300 |

Cada cuerpo existe en **Ingreso** y **Salida**.

## Flujo operativo (diseño, no software)

Ingreso: vehículo presente → LCD “TOME SU TICKET” → botón → impresora 80 mm por rejilla → barrera.

Salida: vehículo presente → LCD “PRESENTE EL CÓDIGO” → lector **interno** lee barras/QR a través de la ventana → si válido, barrera.

## Materiales

- Cuerpo: acero 1,5 mm, RAL 7021 Negro gris.
- Cara y visor: aluminio anodizado.
- Blade: perfil + diffuser opal, LED 24 V.
- Cristales: PC anti-vandal 4 mm.

## Lo que no es este proyecto

- No es cajero de pago.
- No es totem publicitario de 21–29".
- No es diseño de la talanquera.
