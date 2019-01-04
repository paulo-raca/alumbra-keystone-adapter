module mybox(width=0, height=0, depth=0, x=0, x1=undef, x2=undef, y=0, y1=undef, y2=undef, z=0, z1=undef, z2=undef) {
    center = [
        x1 == undef || x2 == undef ? x : (x1+x2)/2,
        y1 == undef || y2 == undef ? y : (y1+y2)/2,
        z1 == undef || z2 == undef ? z : (z1+z2)/2,
    ];
    size = [
        x1 == undef || x2 == undef ? width : abs(x2-x1),
        y1 == undef || y2 == undef ? height : abs(y2-y1),
        z1 == undef || z2 == undef ? depth : abs(z2-z1),
    ];
    translate(center) {
        cube(size=size, center=true);
    }
};

module keystone_adapter() {
    intersection() {
        //mybox(x1=-50, x2=0, height=100, depth=50);

        difference() {
            union() {
                difference() {
                    union() {
                        mybox(width=16.6, height=17.85, z1=0.00, z2= 2);
                        hull() {
                            mybox(width=16.6, height=20, z1=2, z2= 7.50);
                            mybox(width=16.6, y1=-12, y2=15.5, z1=4.00, z2= 7.50);
                        }
                        mybox(width=18.8, y1=-12, y2=15.5, z1=7.50, z2=10.00);
                        //mybox(width=19.5, y1=-12, y2=15.5, z1=8.50, z2=10.00);
                    };
                    union() {
                        mybox(x1= 6, x2= 10,   height=10,    z1=2.00, z2=6);
                        mybox(x1=-6, x2=-10,   height=10,    z1=2.00, z2=6);
                    }
                }

                mybox(x1= 7.5, x2= 8.3,   y = 3.5, height= 1, z1=1, z2=7);
                mybox(x1= 7.5, x2= 8.3,   y = -3.5, height= 1, z1=1, z2=7);
                mybox(x1=-7.5, x2=-8.3,   y = 3.5, height= 1, z1=1, z2=7);
                mybox(x1=-7.5, x2=-8.3,   y = -3.5, height= 1, z1=1, z2=7);
                hull() {
                    mybox(x1= 7.5, x2= 9.5,   height=8, z=4.8, depth=0.0001);
                    mybox(x1= 7.5, x2= 8.3,   height=8,  z=2, depth=0.0001);
                }
                hull() {
                    mybox(x1=-7.5, x2=-9.5,   height=8, z=4.8, depth=0.0001);
                    mybox(x1=-7.5, x2=-8.3,   height=8,  z=2, depth=0.0001);
                }
            }

            mybox(width=14.8, y1=-8.2, y2=8.2, z1=0, z2=3.2);
            hull() {
                mybox(width=14.8, y1=-8.2, y2=8.2, z1=3.2, z2=7.9);
                mybox(width=14.8, y1=-9.7, y2=9.7, z1=4.69, z2=4.7);
                //mybox(width=14.8, y1=-8.2, y2=8.2, z1=3.2, z2=1.7);
                //mybox(width=14.8, y1=-8.2, y2=11.7, z1=4.7, z2=6.5);
                //mybox(width=14.8, y1=-11.2, y2=14.9, z1=4.9, z2=7.9);
            }
            mybox(width=14.8, y1=-10, y2=13.5, z1=4.7, z2=7.9);
            mybox(width=14.8, y1=-8.2, y2=11.9, z1=7.9, z2=10);
        }
    };
}
rotate([0,0,90])
for(x = [0 : 0]) {
    for(y = [0 : 0]) {
        translate([20*x, 30*y,0]) {
            keystone_adapter();
        }
    }
}
