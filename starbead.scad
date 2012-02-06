//lengt from middle of the star to end of star the lengt of the whole star is 1.85starlen
starlen=10;
//tickness of star
starT=5;

//making the bead
starbead();

//making an hole in the star the hole is 1/2 of the ticknes of the star. change starT/4 to change hole
//also rotating it to lie down
module starbead() {
  rotate(a=[90,0,0]) {
    translate([0,starT/2,0]) {
      difference() {
        standstar();
        cylinder(2*starlen, starT/4, center = false, $fn=45 );
      }
    }
  }
}

//rotating and mooving the star so that it stands
module standstar() {
  rotate(a=[90,0,0]) {
    translate([0,starlen*85/100,0]) {
      star();   
    }
  }
}


module star() {
  linear_extrude(height = starT, center = true, convexity = 10, twist = 0) {
        polygon( points=[[0,starlen],[starlen*25/100,starlen*28/100],[starlen,starlen*28/100],[starlen*40/100,-starlen*14/100],[starlen*57/100,-starlen*85/100],[0,-starlen*43/100],[-starlen*57/100,-starlen*85/100],[-starlen*40/100,-starlen*14/100],[-starlen,starlen*28/100],[-starlen*25/100,starlen*28/100]] );
   }
}
