

if ( 0 ) {
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
}

if (0){
difference() {
union() {
     cylinder(h=17, r=212/2, center=false, $fn=100);
     translate([ 0,0,15]) cylinder(h=25, r=100, center=false, $fn=100);

}
{
    translate([ 0,0,-3]) cylinder(h=18, r=101.6, center=false, $fn=200);
    translate([ 0,0,-3]) cylinder(h=46, r=97, center=false, $fn=360);


}

}
}    

if (1){
difference() {
union() {
     cylinder(h=2, r=104, center=false, $fn=100);
     cylinder(h=17, r=100, center=false, $fn=100);

}
{
        translate([ 0,0,-3]) cylinder(h=28, r=97, center=false, $fn=360);


}

}
}    

