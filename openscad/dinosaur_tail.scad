
// Higher resolution
$fn=100;

joint_separation = 40;

// Gentle swish
angles = [10,10,10,10,-10,-10,-10,-10,-10,-10,-10,-10];

// Curl
//angles = [-20,0,-20,0,-20,0,-20,0,-20,0,-20,0,-20];

// Flat
//angles = [0,0,0,0,0,0,0,0,0];

color([0,1,0])
translate([-17,0,0]) {
    //cube(34, center=true);
}
    
horizontal_servo();
tail_segments(angles);

module tail_segments(segments=[], position=0) {
    echo (position);
    echo (segments[position]);
    if (position % 2 == 0) {
        // horizontal servo
        rotate([0,segments[position],0]){ 
            translate([joint_separation,0,0]) {
                vertical_servo();
                if (position < len(segments)-1) {
                    tail_segments(segments, position+1);
                }
            }
        } 
    } else {
        // vertical servo
        rotate([0,0,segments[position]]){ 
            translate([joint_separation,0,0]) {
                horizontal_servo();
                if (position < len(segments)-1) {
                    tail_segments(segments, position+1);
                }
            }
        } 
    }
    
}

module vertical_servo() {
    rotate([90,0,0]) {
        servo();
        servo_bracket();
    }  
}

module horizontal_servo() {
    servo();
    servo_bracket();
}

module servo() {

    // Servo

    // Centre it
    translate([0,-12.4,0]){
        rotate([0,180,0]) {
        // Main body
        translate([-5.5,0,-5.7]){
        cube(size=[25.5,21.2,11.4]);
        }

        difference() {
            // Mounting tabs
            translate([-9.5,15.5,-5.7]) {
                cube(size=[33.5,2,11.4]);
            }
            
            // Screw holes
            translate([22.25,0,0]) {
                rotate([90,0,180]){
                cylinder(h=50, r=1.3);
                }
            }

            translate([-7.75,0,0]) {
                rotate([90,0,180]){
                cylinder(h=50, r=1.3);
                }
            }
        }

        // Top large circular bit
        translate([0,21.2,0]) {
            rotate([90,0,180]){
            cylinder(h=4, r=5.7);
            }
        }

        // Top smaller circular bit
        translate([0,24.2,0]) {
            rotate([90,0,180]){
            cylinder(h=2, r=3);
            }
        }

        
        // Servo horn
        translate([0,26.2,0]) {
            rotate([90,0,180]){
                color([1,1,1])
                cylinder(h=2.6, r=1.8);
            }
        }
    }
}

}

module servo_bracket() {

    color([1,0,0])
    difference(){
        union(){
            translate([-24.5,-6,-8.4]) {
                    cube([34,12,14]);
            }
            //color([1,0,0])
            translate([-24.5,-6,-15]) {
                cube([4.5,12,30]);
            }
            
            //color([1,0,0])
            translate([-45,-6,-17]) {
                cube([25,12,3]);
            }
            //color([1,0,0])
            translate([-45,-6,14]) {
                cube([25,12,3]);
            }
        }
            
        // Make space for the servo
        translate([-24,3.1,-5.7]) {
            color([0,1,0])
            cube(size=[34.2,20,11.5]);
        }
        translate([-20,-20,-5.7]){
            cube(size=[25.5,40,11.5]);
        }
    }
}
