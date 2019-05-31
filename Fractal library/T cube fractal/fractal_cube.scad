side=1000;	
sizeFactor=2.3;  
fractal(5);
module fractal(levels, i=1, xPos=0, yPos=0, zPos=0) {			
	currentFactor=pow(sizeFactor,i);
	x=side/currentFactor;
	if (i<=levels) {	
		fractal(levels, i+1, xPos +x/2, yPos + x/2, zPos + x/2);
		fractal(levels, i+1, xPos -x/2, yPos + x/2, zPos + x/2);
		fractal(levels, i+1, xPos +x/2, yPos - x/2, zPos + x/2);
		fractal(levels, i+1, xPos -x/2, yPos - x/2, zPos + x/2);
		fractal(levels, i+1, xPos +x/2, yPos + x/2, -zPos - x/2);
		fractal(levels, i+1, xPos -x/2, yPos + x/2, -zPos - x/2);
		fractal(levels, i+1, xPos +x/2, yPos - x/2, -zPos - x/2);
		fractal(levels, i+1, xPos -x/2, yPos - x/2, -zPos - x/2);
		makeCube(x, xPos, yPos, zPos, i);
	}
}
module makeCube(x, xPos, yPos, zPos, level) {
	difference() {
		translate([xPos, yPos, zPos]) 
			color([(1-level/10),(1-level/10),(1-level/10)])
			cube(x, center=true);	
	}	
}