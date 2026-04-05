



module M4_imbus_B(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    union() {  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
  }
}
}



module M4_imbus_D(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=35, r=4.2/2, center=false, $fn=360);
 translate([0,0,20.5 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
  }
}
}

module M4_imbus_C(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      
  }
}
}



module M4_imbus(){

  union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
      
  }
}




module EAF_HolderN() {
difference() {                
   union() { 

      translate([-25,-25, -10] ) cube([50,12.5 ,30]);    
      translate([-15,-25, -70] ) cube([30,12.5 ,90]);    

       translate([-25,-96,7 ]) cube([ 50, 73, 13]); 
/*    difference() {            
        union() {
            translate([-25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
            translate([ 25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
        }   
        union() {  
            translate([ 25,-36, 7 ]) cube([ 13, 26, 13]); 
            translate([-38,-36, 7 ]) cube([ 13, 26, 13]); 
        }
    }
*/  
   } 
   union () {
       translate([-25,  -102,7 ]) cube([ 4.5, 77, 13]); 
       translate([ 20.5,-102,7 ]) cube([ 4.5, 77, 13]); 
       
       translate([-30,-64, 14 ]) rotate ([0,90,0]) cylinder(h=60, r=2, center=false, $fn=360);   //Sroub
       
       translate([-36.5,-64, 14 ]) rotate ([0,90,0]) M4_imbus_B();
       translate([36.5,-64, 14 ]) rotate ([0,0,180]) rotate ([0,90,0]) M4_imbus_B();
       
       translate([0,-57, 7 ]) cylinder(h=13, r=12, center=false, $fn=360);  
       translate([ -12,-57.5, 7 ]) cube([ 24, 49, 13]); 
       
       translate([ -12.7,-90.5, 7 ]) cube([ 7.4, 18, 5]); 
       translate([   5.3,-90.5, 7 ]) cube([ 7.4, 18, 5]); 
       
       
       translate([  9,-72.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([  9,-90.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([ -9,-72.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([ -9,-90.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       
       translate([ -25,-10, -10 ]) rotate ([90,0,0]) cylinder(h=15, r=10, center=false, $fn=100);
       translate([ 25,-10, -10 ]) rotate ([90,0,0]) cylinder(h=15, r=10, center=false, $fn=100);  
       
       translate([ 0,-25, 7-65 ]) rotate ([-90,0,0])M4_imbus(); 
       translate([ 0,-15, 7-50 ]) rotate ([90,0,0])  cylinder(h=14, r=7, center=false, $fn=360);  
       
       translate([ 0,-10, 7-50 ]) rotate ([90,0,0])  cylinder(h=14, r=3.2, center=false, $fn=360);  
       
       translate([ 0,-25, 7-35 ]) rotate ([-90,0,0])M4_imbus(); 

       translate([ 0,-25, 7-50 ]) rotate ([-90,0,0])M4_imbus(); 
         
   }    
  } 
}    


 EAF_HolderN() ;

