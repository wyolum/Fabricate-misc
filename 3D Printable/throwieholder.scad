/*
 * Throwie model for embedding in things, or as a simple holder
 * for a CR2032 Coin cell with a 5MM LED on it. (LED throwie)
 * subtract throwie(center_height) from your model. Center Height is 
 * the height of the center of the battery.
 */
 
//battery cutout with square bottom for insertion
// note: -2mm added to poke through the bottom.
module cr2032(center_height){
    translate([1.6,0,center_height])rotate([0,270,0])union(){
        cylinder(r=10.5,h=3.3);
        translate([-center_height-2,-10.5,0])cube([center_height+2,21,3.3]);
    }
}
// throwie cutout for embedding in other models
module throwie(center_height,embed=false)
{
    $fn=99;
    union(){
        cr2032(center_height);
        5mmLED(center_height);
    }
}
// positive lead 28mm
// negative lead 25mm
module 5mmLED(center_height){
        $fn=99;
        translate([0,0,center_height+11])cylinder(r=5.8/2,h=8.3-(5.8/2),$fn=99);
        translate([0,0,center_height+11+8.3-(5.8/2)])sphere(5.8/2);
        translate([-1.6,0,center_height+11-28])cylinder(r=.75,h=28);
        translate([1.6,0,center_height+11-25])cylinder(r=.75,h=25);
}
//test holder
module test_holder(){
    base_x =10;
    base_y = 23;
    base_h = 30;
    difference(){
        translate([-base_x/2,-base_y/2,0])cube([base_x,base_y,base_h]);
        throwie((base_h/2)+3);
    }
}
//note that this requires http://www.thingiverse.com/thing:8896
module octo_led(){
    difference(){
        translate([0,0,3])import("OctopusThickLegs.stl");
        translate([0,8.5,0])throwie(14);
    }
}
test_holder();
//5mmLED((30/2)+3);
//throwie(15);
//octo_led();





