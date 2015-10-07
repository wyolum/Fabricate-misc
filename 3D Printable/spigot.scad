spigot_R = 8.25;
wall_thick = 1.5;
module spigot(){
    $fn=50;
    translate([0,25,25])rotate([0,90,0])
    union(){
        difference(){
            rotate_extrude(convexity = 10)
            translate([25,0,0])circle(r=spigot_R);
            rotate_extrude(convexity = 10)
            translate([25,0,0])circle(r=spigot_R-wall_thick);
            translate([-26-spigot_R,0,-spigot_R-1])cube([110,110,55]);
            translate([0,-26-spigot_R,-spigot_R-1])cube([110,110,55]);
        }
        difference(){
            translate([0,-25,0])rotate([0,90,0])cylinder(r=spigot_R, h=25);
            translate([-1,-25,0])rotate([0,90,0])cylinder(r=spigot_R-wall_thick, h=30);        
        }
    
    }
}

difference(){
    translate([-25,-15,0])cube([50,50,2]);
    translate([0,0,-1])cylinder(r=spigot_R-wall_thick,h=4);
    translate([-20,-10,-1])cylinder(r=1.7,h=4);
    translate([-20,30,-1])cylinder(r=1.7,h=4);
    translate([20,-10,-1])cylinder(r=1.7,h=4);
    translate([20,30,-1])cylinder(r=1.7,h=4);
}
translate([0,0,2])spigot();