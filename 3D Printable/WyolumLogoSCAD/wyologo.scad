

/* Wyolum logo for adding or subtracting.
	 flip parameter makes it backward for printing
		on the bottom of things
*/
module wyologo(flip){
	if (flip == true){
		translate([0,0,0])scale([-1,1,1])linear_extrude(height=10)import("wyologo2.dxf");
	}else{
		translate([0,0,0])scale([1,1,1])linear_extrude(height=10)import("wyologo2.dxf");
	}

}



	translate([0,0,0])wyologo(flip = false);
