//lenght of main section
len=30;
//radius of body
rad=5;
//radius of hole
holerad=rad/3;



// Lets have more sides on circles:
$fa = 0.5;
$fs = 0.1;

//making
spacebead();


//making a hole in spaceship
module spacebead() {
  difference() {
    rocket(rad, len, scale=1);
    cylinder(3*len, holerad,holerad,  center = true, $fn=45 );
  }
}

// Rocket module.  

module rocket(rad = 5, len = 40, scale = 1) {
  
   
  scale(scale) {
    translate([0,0,0]) {   
      // Head
      translate([0,0,len]) {
	   cylinder(r1 =  rad, r2 = 0, h = len/2, center = false);
      }

      // Body
      translate([0,0,0]) {
        cylinder(r =  rad, h = len, center = false);
      }
  
      // Side wings
      wing(0,rad,len, 0);
      wing(120,rad,len, 0);
      wing(240,rad,len, 0);
      }
    }
  }


// Side wing module
module wing(a,rad,len, groundheight) {
  rotate(a= [a,270,0]) {
    // Define the wing shape with a polygon, and extrude it 
    linear_extrude(height = 1, center = true, convexity = 10, twist = 0) {
      translate([0, -rad, 0]) {
        polygon( points=[[0,-8],[0,-3],[3,0],[18,0]] );
      }	
    }
  }
}



