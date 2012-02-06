


//lenght of the bead
beadlen=15;
//  the pearl's radius
beadrad=beadlen/4;
// the radius of the hole
hole=beadrad/2;



//making the bead
bead();




//makes the bead module. 
module bead() {
  difference() {
      cylinder(beadlen, beadrad, beadrad ,$fn=50  );
      cylinder(2*beadlen+2, hole, hole, center=true, $fn=45 );
  }
}