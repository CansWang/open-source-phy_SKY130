

proc place_stdcell { x_center y_center index } {
	
    puts $x_center
	select clear
	box [expr $x_center]um [expr $y_center]um [expr $x_center]um [expr $y_center]um  
	

}