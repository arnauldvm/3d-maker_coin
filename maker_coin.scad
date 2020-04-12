// unit = mm

module cut() {
    $fn=60;
    difference() {
        union() {
            translate([-40, 12.5]) circle(12.5);
            translate([-40,0]) square([40,22.85]);
        }
        translate([0, 72.85]) circle(60);
    }
}

module logo() {
    $fn=12;
    text("A V M", size=21, font="Marker Felt:style=Bold", halign="center", valign="center");
}

module dents()  {
    for (i=[0:30:359]) {
        d=55;
        translate([d*cos(i),d*sin(i),-1]) cylinder(30, r=10);
    }
}

module coin() {
    difference() {
        $fn=30;
        rotate_extrude() cut();
        translate([0,0,2]) linear_extrude(height = 30) logo();
        //dents();
    }
    {
        $fn=12;
        sphere(0.5);
    }
}

coin();
