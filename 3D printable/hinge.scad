/*
 * Author: Kevin Osborn
 * License: Public Domain
 * Print in place hinge. Mostly Paremetric, though the 
 * hinge pin needs enough clearance to break free, so it may not
 * scale equally well in all dimensions (right now there is a fixed
 * .5mm clearance)I think 1.5mm is probably about the lowest radius 
 * The end caps are 1/3 body length, but could probably be fixed length.
 * 
 *
 */
 
 module hinge(radius,length,gap)
{
    module hingebody(r=radius,l=length){
            union(){
            cylinder(r=r,h=l,$fn=99);
            translate([0,-r,0])cube([r,2*r,l]);
            }
    }
    translate([length/3+gap,0,radius])rotate([0,90,0])union(){
        difference(){ //central hollow part
        hingebody(radius,length);
        translate([0,0,-1])cylinder(r=radius-.5,h=length+2,$fn=99);
        }
        //hinge pin
        translate([0,0,-5])cylinder(r=radius/2,h=length+10,$fn=99);
        translate([0,0,-length/3-gap])hingebody(radius,length/3);
        translate([0,0,length+gap])hingebody(radius,length/3);
    }
}
// let's make us a sample hinge!
Hinge_r =2.5;
Hinge_l = 15;
tab_l = 15;
gap = 1;
hinge_centerx = Hinge_l/2+Hinge_l/3+gap;
translate([0,0,1.5])hinge(Hinge_r,Hinge_l,gap);
//outer tabs
translate ([0,-Hinge_r,0])cube([Hinge_l/3,tab_l,1.5]);
translate ([Hinge_l+Hinge_l/3+2*gap,-Hinge_r,0])cube([Hinge_l/3,tab_l,1.5]);
//center tab
translate([Hinge_l/3+gap,-tab_l+Hinge_r,0])cube([Hinge_l,tab_l,1.5]);
//something to connect 
translate([Hinge_l/3+gap,-15,0])cube([Hinge_l,10,1.5]);
translate([0,10,0])cube([Hinge_l+2*(Hinge_l/3+gap),10,1.5]);

