// The front side of the dice is the side whith 5 dots. 
// All dot modules are done first on it and then translated 
// and rotatated to their place

// Lenght of the dice side. The dots will also scale if len is changed
len=10;
//rad of hole
holerad=len/10;

// Makes the dice

difference() {
  dice(len);
  rotate(a=[42,39,100]) {
    cylinder(2*len, holerad, holerad, $fn=45 );
  }
}

// This module makes a cube whit the size len and then subtracts the
// dots away from the cube
module dice(len=30) {
  $fs=0.1;  

  difference() {
    translate([len/2,len/2,len/2]) {
      roundedBox([len,len,len],len/7, false);
    }
    dots(len); 
    
  }
}


// This module makes the dot. The dot can be changed to something 
// else if wanted. It will scale whith the dice as long as its 
// size is derived from len
module dot() {
   sphere(len/10);
}



// This module places the dots on the right places on the cube
module dots(len) {
  

  //1
  rotate(a=[-90,0,90]) {
    translate([0,-len,-len]) {
      one();
    }
  }
   
  //2
  rotate(a=[180,0,180]) {
    translate([-len,0,-len]) {
      two();
    }
  }

  //3
  rotate(a=[-90,90,0]) {
    translate([-len,-len,0]) {
      one();
      two();
    }
  }

  // 4
  rotate(a=[90,270,0]) {
    translate([0,-len,-len]) {
      four();
    }
  }

  // 5
  one();
  four();
  
  // 6
  rotate(a=[270,0,270]) {
    translate([-len,-len,0,])  {
      threeontop();
    }
    translate([-len,-len/2,0,])  {
      threeontop();
    }
  }
}



 

// Makes 1 dot in front
module one() {
  translate([0,len/2,len/2]) {
    dot();
  }
}

// Makes 2 dots in front
module two() {
 
  translate([0,len/4,len/4]) {
    dot();
  }
  translate([0,len/4*3,len/4*3]) {
    dot();
  }
}


// Makes 4 dots in front
module four() {
  translate([0,len/4,len/4]) {
    dot();
  }
  translate([0,len/4*3,len/4*3]) {
    dot();
  }
  translate([0,len/4,len/4*3]) {
    dot();
  }
  translate([0,len/4*3,len/4]) {
    dot();
  }
}


// Makes 3 of the dots in number 6 in front
module threeontop() {
   
  translate([0,len/4,len/4]) {
    dot();
  }
  translate([0,len/4,len/2]) {
    dot();
  }
  translate([0,len/4,len/4*3]) {
    dot();   
  }
}

// this is taken from https://github.com/elmom/MCAD/blob/master/boxes.scad
// Library: boxes.scad
// Version: 1.0
// Author: Marius Kintel
// Copyright: 2010
// License: BSD
module roundedBox(size, radius, sidesonly)
{
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
    }
  }
  else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);


    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis])
          translate([x,y,0])
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true);
      }
    }
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(radius);
    }
  }
}