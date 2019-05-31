optimized_menger(4);
module optimized_menger(n) {
  s=pow(3,n);
  translate([s/2,s/2,s/2]) menger(s,n);
}
module menger(s, n) {
  intersection() {
    rotate([ 0,90,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
    rotate([90, 0,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
    rotate([ 0, 0,0]) translate([0,0,-s/2-1]) linear_extrude(s+2, convexity=pow(2,n)) sierpinski(s,n);
  }
}
module sierpinski(s, n) {
  difference() { 
    square(s, center=true);
    _sierpinski(0,0,s,n);
  }
}
module _sierpinski(x, y, s, n) {
  translate([x,y]) {
    if (n>0) {
      i = n-1;
      scale([1/3,1/3]) {
        square(s, center=true);
        if (i>0) {
          _sierpinski(-s,-s, s, i);
          _sierpinski(-s, 0, s, i);
          _sierpinski(-s, s, s, i);
          _sierpinski( 0,-s, s, i);
          //_sierpinski( 0, 0, s, i);
          _sierpinski( 0, s, s, i);
          _sierpinski( s,-s, s, i);
          _sierpinski( s, 0, s, i);
          _sierpinski( s, s, s, i);
        }
      }
    }
  }
}