// AETHER Lane — kiosko ingreso / salida (cotas en mm)
// OpenSCAD: F6 render, File > Export > STL
//
// Parámetros:
variant   = "pylon";   // "pylon" | "compact" | "wall"
face      = "ingreso"; // "ingreso" | "salida"
explode   = 0;         // 0 cerrado … 1 despiece

$fn = 48;

function spec(v) =
    v == "pylon"   ? [1620, 360, 260, 300, 90, 12, 420, 360] :
    v == "compact" ? [1280, 260, 200, 220, 70, 10, 320, 280] :
                     [520,  300, 300, 140, 0,  6,  480, 280];
// H, Wf, Wr, D, plinthH, plateT, plateW, plateD

S      = spec(variant);
H      = S[0];
Wf     = S[1];
Wr     = S[2];
D      = S[3];
PH     = S[4];
PT     = S[5];
PW     = S[6];
PD     = S[7];
WALL   = variant == "wall";
BODY_H = WALL ? H : H - PH - 18;
BODY_Z = WALL ? 0 : PH;

lcd_c  = variant == "pylon" ? 1280 : variant == "compact" ? 1160 : 360;
btn_c  = variant == "pylon" ? 1140 : variant == "compact" ? 1060 : 250;
slot_c = variant == "pylon" ? 1040 : variant == "compact" ?  980 : 180;
scan_c = variant == "pylon" ? 1100 : variant == "compact" ? 1030 : 220;
ck_w   = variant == "pylon" ? 280  : variant == "compact" ? 210  : 240;
ck_h   = variant == "pylon" ? 520  : variant == "compact" ? 460  : 400;
ck_bot = lcd_c - ck_h * 0.62;

ex = explode;

module plate() {
    translate([0, 0, -PT/2 - ex * 70])
        cube([PW, PD, PT], center = true);
}

module plinth() {
    if (!WALL)
        translate([0, 0, PH/2])
            cube([Wf, D, PH], center = true);
}

module tapered(h, wf, wr, d) {
    hull() {
        translate([0, 0, 0.5])
            cube([wr, d * 0.92, 1], center = true);
        translate([0, (d - d * 0.92) / 4, h - 0.5])
            cube([wf, d, 1], center = true);
    }
}

module blade() {
    translate([-Wf/2 + 8 - ex * 90, D/2 - 6, BODY_Z + 40])
        cube([12, 10, BODY_H - 80]);
}

module visor() {
    translate([0, D/2 + 20 + ex * 40, BODY_Z + BODY_H - 8 + ex * 90])
        cube([ck_w + 24, 55, 8], center = true);
}

module cockpit_cut() {
    translate([0, D/2 + 1, BODY_Z + ck_bot + ck_h/2])
        cube([ck_w, 60, ck_h], center = true);
}

module shell() {
    difference() {
        translate([0, 0, BODY_Z])
            tapered(BODY_H, Wf, Wr, D);
        translate([0, 0, BODY_Z + 18])
            tapered(BODY_H - 36, Wf - 24, Wr - 24, D - 24);
        cockpit_cut();
        // service door recess
        translate([0, -D/2, BODY_Z + BODY_H/2])
            cube([Wr - 40, 8, BODY_H - 80], center = true);
    }
}

module lcd() {
    translate([0, D/2 - 18 + ex * 160, lcd_c])
        cube([170, 12, 105], center = true);
}

module button() {
    translate([0, D/2 - 10 + ex * 190, btn_c])
        rotate([90, 0, 0])
            cylinder(h = 18, d = 50);
}

module slot() {
    translate([0, D/2 - 8 + ex * 210, slot_c])
        cube([90, 16, 16], center = true);
    translate([0, D/2 - 4 + ex * 200, slot_c + 22])
        cube([120, 6, 44], center = true);
}

module scanner_window() {
    translate([0, D/2 - 12 + ex * 190, scan_c])
        cube([90, 8, 46], center = true);
}

module face_modules() {
    lcd();
    if (face == "ingreso") {
        button();
        slot();
    } else {
        scanner_window();
    }
}

module internals() {
    translate([0, 0 + ex * 140, BODY_Z + BODY_H * 0.45])
        cube([min(Wf, 220) - 50, D - 80, 80], center = true);
}

module aether() {
    color([0.35, 0.38, 0.40]) plate();
    color([0.18, 0.20, 0.22]) plinth();
    color([0.16, 0.18, 0.20]) shell();
    color([0.24, 0.88, 0.84]) blade();
    color([0.72, 0.75, 0.78]) visor();
    color([0.10, 0.12, 0.14]) face_modules();
    color([0.40, 0.42, 0.45]) internals();
}

aether();
