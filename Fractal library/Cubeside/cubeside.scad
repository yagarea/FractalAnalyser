size_decrement=1/3;

fract(rec=3, size=200, first=true);

module fract(size=200, rec=2, first=false) {
	newsize=size*size_decrement;
	distance=(newsize+size)/2.001;
	cube(size,center=true);
	if(rec>0) {
		if(first) {
			rotate([180,0,0]) {
				translate([0,0,distance]) fract(newsize,rec-1);
				recursive(size,rec);
			}
		}
		for(alpha=[[0,0,0],[90,0,0],[270,0,0],[0,90,0],[0,270,0]]) {
			rotate(alpha) {
				translate([0,0,distance]) fract(newsize,rec-1);
				recursive(size,rec);
			}
		}
	}
	module recursive(size, rec) {
		if(rec>1) {
			for(r=[2:rec]) {
				assign(childnum=sumpowersof3(r-2),
					childspacing=size/pow(3,r-1),
					childsize=newsize*pow(size_decrement,r-1),
					childdist=(size+newsize*pow(size_decrement,r-1))/2.001) {
					for(x=[-childnum:childnum]) {
						for(y=[-childnum:childnum]) {
							if(!occupied(x,y,r-1)) {
								translate([childspacing*x,childspacing*y,childdist])
								fract(childsize,rec-r);
							}
						}
					}
				}
			}
		}
	}
}
function sumpowersof3(number)= pow(3,number)+
			(number<=0?0:sumpowersof3(number-1));
function occupied(x, y, rec)=rec<=0?false:
			((x%3==0&&y%3==0)||
			occupied(round(abs(x/3)), round(abs(y/3)), rec-1));