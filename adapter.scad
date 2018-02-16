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

difference() {
    union() {
        difference() {
            union() {
                mybox(width=16.6, height=17.85, z1=0.00, z2= 1.75);
                mybox(width=16.6, y1=-12, y2=15.5, z1=1.75, z2= 7.50);
                mybox(width=18.8, y1=-12, y2=15.5, z1=7.50, z2= 8.50);
                mybox(width=19.5, y1=-12, y2=15.5, z1=8.50, z2=10.00);
            };
            union() {
                mybox(x1= 6, x2= 10,   height= 6,    z1=2.00, z2=7);
                mybox(x1=-6, x2=-10,   height= 6,    z1=2.00, z2=7);
            }
        }

        mybox(x1= 7.5, x2= 8.3,   height= 4, z1=1, z2=6);
        mybox(x1=-7.5, x2=-8.3,   height= 4, z1=1, z2=6);
        hull() {
            mybox(x1= 7.5, x2= 9.25,   height=4, z=5, depth=0.0001);
            mybox(x1= 7.5, x2= 8.3,   height=4,  z=2, depth=0.0001);
        }
        hull() {
            mybox(x1=-7.5, x2=-9.25,   height=4, z=5, depth=0.0001);
            mybox(x1=-7.5, x2=-8.3,   height=4,  z=2, depth=0.0001);
        }
    }
    
    mybox(width=14.8, y1=-8.2, y2=8.2, z1=0, z2=5);
    mybox(width=14.8, y1=-10, y2=13.5, z1=5, z2=8.2);
    mybox(width=14.8, y1=-8.2, y2=11.9, z1=8.2, z2=10);
}