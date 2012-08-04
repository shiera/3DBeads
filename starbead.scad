//lenght of star
starlenght=20;

//thickness of star
starT=5;

//radius of hole
hole=2.5/2;

//lengt from middle of the star to end of star (the lengt of the whole star is 1.85starlen)
starlen=starlenght/1.85;


//making the bead
starbead();

//making an hole in the star change hole to change hole radius
//also rotating it to lie down
module starbead() {
  difference() {
    translate([0,0,starT/2]) star();
    translate([-starlen,starlen/2,starT/2]) rotate(a=[90,0,90]) cylinder(2*starlen, hole,hole, center = false, $fn=45 );      
  }
}

//rotating and moving the star so that it stands
module standstar() {
  rotate(a=[90,0,0]) {
    translate([0,starlen*85/100,0]) {
      star();   
    }
  }
}

//creates star shape
module star() {
  linear_extrude(height = starT, center = true, convexity = 10, twist = 0) {
        polygon( points=[[0,starlen],[starlen*25/100,starlen*28/100],[starlen,starlen*28/100],[starlen*40/100,-starlen*14/100],[starlen*57/100,-starlen*85/100],[0,-starlen*43/100],[-starlen*57/100,-starlen*85/100],[-starlen*40/100,-starlen*14/100],[-starlen,starlen*28/100],[-starlen*25/100,starlen*28/100]] );
   }
}
