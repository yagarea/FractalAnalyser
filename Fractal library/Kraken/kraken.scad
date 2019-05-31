for(i=[0:180:359]){
    rotate([0,0,i]) 
    rot(9,18,1);
}
module rot(r,a,n)
    if(r>2){
        make_sphere(r);
        rotate([0,0,a]) translate([r,0,0]) rot(r*0.95,a*1.01,n+1);
        
    if(!n%3)
        rotate([0,0,-90]) translate([r,0,0]) rot(r*0.6,a,1);
}
module make_sphere(r)
    difference(){
        sphere(r,$fn=40);
        translate([0,0,-r]) cube(2*r,center=true);
    }