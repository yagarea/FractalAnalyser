side_length = 10;
overlap = 1.5; //[0.5:0.5:10]
iterations = 4; //[1:8]
useful_length = side_length / pow(2, iterations - 1);

Sierpinski(side_length, iterations) {
    tetrahedron(useful_length);
}
module iterate(side = 10) {
    children(0);
    translate([side, 0, 0]) children(0);
    translate([side / 2, side * sqrt(3) / 2, 0]) children(0);
    translate([side / 2, side * sqrt(3) / 6, side * sqrt(6) / 3 ]) children(0);  
}
module tetrahedron(size) {
    polyhedron( 
        points = [ 
            [0, size * (sqrt(3) - (1 / sqrt(3))), 0], 
            [size, size * (-1 / sqrt(3)), 0], 
            [-size, size * (-1 / sqrt(3)), 0],
            [0, 0, size * 2 * sqrt(2 / 3)]
        ], 
        faces = [
            [0, 1, 3],
            [2, 3, 1], 
            [2, 0, 3],
            [2, 1, 0]
        ]
    );
}
module Sierpinski(side = 10, iterations = 5) {
    if(iterations > 0) {
        iterate(side) {
            Sierpinski(side / 2, iterations - 1) {
                children(0);
            }
        }
        scale(overlap) children(0);
    }
}