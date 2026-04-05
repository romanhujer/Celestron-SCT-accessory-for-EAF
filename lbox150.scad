
difference() {
union() {
      cube([ 195, 195, 4],center=true); 
      translate([ 0,0,-2])cylinder(h=20, r=212/2, center=false, $fn=100);
}
{
    translate([ 0,0,-3]) cylinder(h=30, r=101.6, center=false, $fn=200);
    translate([ 170/2,170/2,-3]) cylinder(h=30, r=1.7, center=true, $fn=100);
    translate([ -170/2,170/2,-3]) cylinder(h=30, r=1.7, center=true, $fn=100);
    translate([ 170/2,-170/2,-3]) cylinder(h=30, r=1.7, center=true, $fn=100);
    translate([ -170/2,-170/2,-3]) cylinder(h=30, r=1.7, center=true, $fn=100);
}
}

    

