
//  the pearl's radius
beadrad=20;
// the radius of the hole
hole=beadrad/4;



//making the bead
bead();

// moving the bead to the right place
module bead(){
  translate([0,0,(sqrt((beadrad*beadrad)-(hole*hole)))]) {
    beadmodule();   
  }
}


//makes the pearl module
module beadmodule() {
  difference() {
      sphere( beadrad ,$fn=45  );
      cylinder(2*beadrad+1, hole, hole,center=true, $fn=45 );
  }
}


