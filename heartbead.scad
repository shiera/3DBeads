

//The lenght of the heart
heartlen=20;

//max thicknes of heart
heartT=heartlen/2;

//the radius of the hole
hole=heartT/5;


//----------------------------------------------------------------------------------------


//making the heartbead
heartbead();


//subtrackt the thicknes from heart. The thicknes would be the same to whole heart whitout this+ makes a hole in the heart
module heartbead() {
  difference() {
    heart();
    Thick();
    cylinder(1.5*heartlen, hole, hole,  center = false, $fn=45 );
  }
}



//placing 2 halfheart beside each other making a whole heart
module heart() {
  union() {
   rotate(a=[0,270]) {
    translate([0,0,-heartT/2]) {
      halfheart();
     } 
     }
    rotate(a=[180,270]){
      translate([0,-0.1,-heartT/2]) {
        halfheart();
      
    }
  }
}
}


// placing the thickness module on both sides of the heart
module Thick() {
  rotate(a=[180,270,90]) {
    thickness();
  }
  rotate(a=[0,270,90]) {
    thickness();
    
  }
}

//The module that makes half of the heart form
module halfheart() {
 linear_extrude(height = heartT, center = false, convexity = 10, twist = 0) {
   polygon( points=[[heartlen*17/100,0],[heartlen*11/100,heartlen*4/100],[heartlen*7/100,heartlen*8/100],[heartlen*4/100,heartlen*11/100],[heartlen*2/100,heartlen*14/100] ,[0,heartlen*18/100],[0,heartlen*30/100],[heartlen*2/100,heartlen*35/100],[heartlen*5/100,heartlen*40/100],[heartlen*10/100,heartlen*45/100],[heartlen*15/100,heartlen*48/100],[heartlen*20/100,heartlen*50/100],[heartlen*27/100,heartlen*50/100],[heartlen*34/100,heartlen*48/100],[heartlen*41/100,heartlen*45/100],[heartlen*50/100,heartlen*40/100],[heartlen*57/100,heartlen*36/100],[heartlen*66/100,heartlen*30/100],[heartlen*74/100,heartlen*24/100],[heartlen*85/100,heartlen*15/100],[heartlen*95/100,heartlen*5/100],[heartlen,0] ] );
   }
}


//the polygone that does the thicknes of the heart (-1 and +1 in some places so that the lines of halfeart and thiock dosent go ontop of each oter
module thickness(){
 linear_extrude(height = heartlen, center = true, convexity = 10, twist = 0) {
   polygon( points=[[heartlen+1,heartT+1], [heartlen+1,-1],[heartlen*90/100,heartT*15/100],[heartlen*80/100,heartT*27/100],[heartlen*70/100,heartT*36/100],[heartlen*60/100,heartT*44/100],[heartlen*50/100,heartT*49/100],[heartlen*40/100,heartT*50/100], [heartlen*30/100,heartT*50/100],[heartlen*25/100,heartT*49/100],[heartlen*20/100,heartT*47/100],[heartlen*15/100,heartT*44/100],[heartlen*10/100,heartT*40/100],[heartlen*5/100,heartT*35/100],[-1,heartT*29/100],[-1,heartT+1] ] );
   }
}



