// Magnetický držák pro DJI Osmo Action (Konfigurace: 2x dvojice magnetů)
// Rozteč středů dvojic: 22mm. Magnety těsně u sebe. 
// Očko na KRATŠÍ straně - OPRAVENÁ ORIENTACE OTVORU (svisle, bez podpěr).

$fn = 60; // Vyhlazení oblouků

// --- PARAMETRY ---
base_width = 42;       // Celková šířka bloku (delší strana)
base_length = 20;      // Celková délka bloku (kratší strana)
base_height = 8;       // Výška bloku (pro 4.6mm hluboké magnety)

// Rozměry magnetů + tolerance pro tisk
mag_diam = 8.0 + 0.2;  // Průměr otvoru s vůlí
mag_depth = 4.6 + 0.1; // Hloubka otvoru s vůlí
mag_r = mag_diam / 2;

// --- GEOMETRIE POZIC MAGNETŮ ---
pair_distance = 22;    // Rozteč středů levé a pravé dvojice magnetů
intra_pair_offset = mag_r - 0.1; // Posun od středu dvojice, aby byly magnety těsně u sebe

// --- HLAVNÍ SESTAVA ---
union() {
    difference() {
        // Základní kostka se zaoblenými rohy
        main_body();
        
        // LEVÁ DVOJICE MAGNETŮ
        translate([-pair_distance/2,  intra_pair_offset, base_height - mag_depth + 0.01]) cylinder(r=mag_r, h=mag_depth);
        translate([-pair_distance/2, -intra_pair_offset, base_height - mag_depth + 0.01]) cylinder(r=mag_r, h=mag_depth);
        
        // PRAVÁ DVOJICE MAGNETŮ
        translate([ pair_distance/2,  intra_pair_offset, base_height - mag_depth + 0.01]) cylinder(r=mag_r, h=mag_depth);
        translate([ pair_distance/2, -intra_pair_offset, base_height - mag_depth + 0.01]) cylinder(r=mag_r, h=mag_depth);
        translate([0, 0, -1]) cylinder(r=2.5 ,h=10);
    }
    
    translate([-36/2-3, -5, 2])cube([3, 10, 7.6]);
    translate([36/2, -5, +2])cube([3, 10, 7.6]);
        
    
    // Očko na poutko – napoziciováno ven z pravé KRATŠÍ stěny.
    // Díra je teď orientována svisle.
    translate([base_width/2, 0, 0]) eyelet();
}

// --- MODULY ---

module main_body() {
    corner_r = 3; // Poloměr zaoblení rohů
    w = base_width / 2 - corner_r;
    l = base_length / 2 - corner_r;
    
    hull() {
        translate([ w,  l, 0]) cylinder(r=corner_r, h=base_height);
        translate([-w,  l, 0]) cylinder(r=corner_r, h=base_height);
        translate([ w, -l, 0]) cylinder(r=corner_r, h=base_height);
        translate([-w, -l, 0]) cylinder(r=corner_r, h=base_height);
    }
}

module eyelet() {
    // Definujeme vodorovné očko se svislou dírou
    eye_inner = 2.0;   // Vnitřní poloměr (pro 4mm šňůrku)
    eye_thickness = 4.0; // Celková tloušťka očka
    outer_w = 6.0;    // Šířka očka ven z modelu
    outer_l = 9.0;     // Délka očka podél stěny

    difference() {
        // Vnější zaoblený blok očka, který se zaboří do stěny
        hull() {
            // Vnější válec, kde bude díra
            translate([outer_w - outer_l/2, 0, 0]) cylinder(d=outer_l, h=eye_thickness);
            // Plochá část zabořená do stěny
            translate([-0.01, -outer_l/2, 0]) cube([1.0, outer_l, eye_thickness]);
        }
        // Svislý otvor pro poutko – prochází celým očkem
        translate([outer_w - outer_l/2, 0, -1]) cylinder(r=eye_inner, h=eye_thickness + 2);
    }
}