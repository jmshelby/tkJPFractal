set info(currentCoords) {200 300}
set info(units) 3
set bufferList ""
set directionList ""

canvas .c -background black
pack .c -expand yes -fill both
.c create line [lindex $info(currentCoords) 0] [lindex $info(currentCoords) 1] [lindex $info(currentCoords) 0] [lindex $info(currentCoords) 1] -tag line -fill green

proc create {iterations initDirection} {
	global bufferList directionList
	$initDirection
	for {set i 0} {$i<=$iterations} {incr i} {
		foreach direction $directionList {
			after 1
			$direction
			update
		}
		set directionList $bufferList
		puts $directionList
	}
}

proc u {} {	;#go right
	global info bufferList
	puts "going right"
	foreach {x y} $info(currentCoords) {
		set nx [expr $x +  $info(units)]
		set newCoords "$nx $y"
	}
	.c insert line end $newCoords
	set info(currentCoords) $newCoords
	set bufferList [linsert $bufferList 0 "r"]
}

proc d {} {	;#go left
	global info bufferList
	puts "going left"
	foreach {x y} $info(currentCoords) {
		set nx [expr $x - $info(units)]
		set newCoords "$nx $y"
	}
	.c insert line end $newCoords
	set info(currentCoords) $newCoords
	set bufferList [linsert $bufferList 0 "l"]
}

proc r {} {		;#go down
	global info bufferList
	puts "going down"
	foreach {x y} $info(currentCoords) {
		set ny [expr $y +  $info(units)]
		set newCoords "$x $ny"
	}
	.c insert line end $newCoords
	set info(currentCoords) $newCoords
	set bufferList [linsert $bufferList 0 "d"]
}

proc l {} {		;#go up
	global info bufferList
	puts "going up"
	foreach {x y} $info(currentCoords) {
		set ny [expr $y - $info(units)]
		set newCoords "$x $ny"
	}
	.c insert line end $newCoords
	set info(currentCoords) $newCoords
	set bufferList [linsert $bufferList 0 "u"]
}

create 20 r
