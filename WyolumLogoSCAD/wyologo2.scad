difference(){
	cube([55,19,2]);
	translate([0,0,0])scale([.2,.2,.2])linear_extrude(height=10)import("wyologo2.dxf");
}