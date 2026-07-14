// ====================================================================
// PARAMETRICKÝ DRŽÁK FILTRU - JEDNODUCHÁ BOOLEOVSKÁ GEOMETRIE (CSG)
// ====================================================================

$fn = 360; // Vyhlazení kruhů

/* [Hlavní rozměry clony] */
// Vnější průměr sluneční clony objektivu (mm)
hood_diameter = 52.0; 
// Vůle pro snadné nasazení (mm)
hood_tolerance = 0.5;  
// Výška celého těla (mm)
total_height = 15.0; 
// Hloubka pro nasunutí clony (mm)
hood_engagement = 12.5; 

/* [Rozměry filtru a kroužku] */
// Světelný průměr / optické okno filtru (mm)
aperture_diameter = 42.0; 
// Tloušťka stěny hlavního tubusu (mm)
wall_thickness = 3.5; 
// Výška jistícího kroužku (mm)
ring_thickness = 4.0; 

/* [Spojovací materiál (M3)] */
screw_hole_ring = 2.5; 
screw_hole_body = 3.2;                                                     

/* [Zobrazení] */
render_mode = "both"; // [both, body, ring]

// --- Výpočty průměrů ---
inner_body_dia = hood_diameter + hood_tolerance;
outer_body_dia = inner_body_dia + (2 * wall_thickness);
// Rozteč šroubů uprostřed schodu
screw_pcd = aperture_diameter + (inner_body_dia - aperture_diameter) / 2; 
// Tloušťka pevného vnitřního dorazu/schodu
stop_thick = total_height - hood_engagement; 

// --- Render ---
if (render_mode == "both") {
    main_body();
    translate([outer_body_dia + 15, 0, 0]) ring();
} else if (render_mode == "body") {
    main_body();
} else if (render_mode == "ring") {
    ring();
}

// ====================================================================
// MODUL: Hlavní tělo (Přesně podle tvého popisu)
// ====================================================================
module main_body() {
    difference() {
        // Základní plný válec
        cylinder(h = total_height, d = outer_body_dia);
        
        // Odečtení optického okna skrz celou výšku
        translate([0, 0, -1])
            cylinder(h = total_height + 2, d = aperture_diameter);
        
        // Odečtení prostoru pro clonu a kroužek (posunuté o tloušťku schodu nahoru)
        translate([0, 0, stop_thick])
            cylinder(h = hood_engagement + 1, d = inner_body_dia);
        
        // 3x otvory pro závit M3 ze spodní strany (skrz schod)
        for (a = [0, 120, 240]) {
            rotate([0, 0, a])
                translate([screw_pcd / 2, 0, -1])
                    cylinder(h = stop_thick + 2, d = screw_hole_body);
        }
    }
}

// ====================================================================
// MODUL: Jistící kroužek
// ====================================================================
module ring() {
    ring_clearance = 0.4; 
    
    difference() {
        // Kroužek pasující do vnitřku tubusu
        cylinder(h = ring_thickness, d = inner_body_dia - ring_clearance);
        
        // Vnitřní otvor
        translate([0, 0, -1])
            cylinder(h = ring_thickness + 2, d = aperture_diameter);
        
        // 3x průchozí otvory pro M3
        for (a = [0, 120, 240]) {
            rotate([0, 0, a])
                translate([screw_pcd / 2, 0, -1])
                    cylinder(h = ring_thickness + 2, d = screw_hole_ring);
        }
    }
}