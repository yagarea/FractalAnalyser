side_length =5;
overlap = 1.5;
iterations = 3;
useful_length = side_length / pow(2, iterations - 1);
 Sierpinski(side_length, iterations) {
    icosahedron(useful_length);
 }
module iterate(size = 3) {
    x1 = size * ((1/4) * sqrt(10 + (2*sqrt(5))));
    x2 = size * ((1/4) * sqrt(10 - (2*sqrt(5))));
    y1 = size * ((1/4) * (sqrt(5) - 1));
    y2 = size * ((1/4) * (sqrt(5) + 1));
    pentagonHeight = size / 1.999;
    tipHeight = size * 1.118;
    translate([0, 0, -tipHeight]) children(0);
    translate([0, 0, tipHeight]) children(0);

    translate([0,0, pentagonHeight]) {
        translate([0, size, 0])  children(0);
        translate([x1, y1, 0]) children(0);
        translate([x2, -y2, 0]) children(0);
        translate([-x2, -y2 , 0]) children(0);
        translate([-x1, y1, 0]) children(0);
}
    translate([0,0, -pentagonHeight]) {
        translate([0, -size, 0])  children(0);
        translate([-x1, -y1, 0]) children(0);
        translate([-x2, y2, 0]) children(0);
        translate([x2, y2 , 0]) children(0);
        translate([x1, -y1, 0]) children(0);
    }
}
module Sierpinski(side = 10, iterations = 3) {
    if(iterations > 0) {
        iterate(side) {
            Sierpinski(side / 2, iterations - 1) {
                children(0);
            }
        }
        scale(overlap) children(0);
    }
}

module icosahedron(a = 2) {
    phi = a * ((1 + sqrt(5)) / 2);
    rotate([58.3, 0, 0]) {
        polyhedron(
            points = [
                [0,-phi, a], [0, phi, a], [0, phi, -a], [0, -phi, -a], [a, 0, phi], [-a, 0, phi], [-a, 0, -phi], [a, 0, -phi], [phi, a, 0], [-phi, a, 0], [-phi, -a, 0], [phi, -a, 0]    
            ],
            faces = [
                [0,5,4], [0,4,11], [11,4,8], [11,8,7], [4,5,1], [4,1,8], [8,1,2], [8,2,7], [1,5,9], [1,9,2], [2,9,6], [2,6,7], [9,5,10], [9,10,6], [6,10,3], [6,3,7], [10,5,0], [10,0,3], [3,0,11], [3,11,7]
            ]
        );
    }
}