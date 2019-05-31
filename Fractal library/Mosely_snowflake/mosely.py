from solid import *
import sys
import os

cubesize = 100

def segments(maxIter = 1, offx = 0, offy = 0, offz = 0, iter = 1):
    s3 = cubesize / pow(3, iter)
    cub = cube(s3+0.001 ,center = True)
    res = (
        translate([offx, offy, offz])(    
            cub),
        translate([offx+s3, offy+s3, offz+s3])(    
            cub),
        translate([offx-s3, offy+s3, offz+s3])(    
            cub),
        translate([offx-s3, offy-s3, offz+s3])(    
            cub),
        translate([offx+s3, offy-s3, offz+s3])(    
            cub),

        translate([offx+s3, offy+s3, offz-s3])(    
            cub),
        translate([offx-s3, offy+s3, offz-s3])(    
            cub),
        translate([offx-s3, offy-s3, offz-s3])(    
            cub),
        translate([offx+s3, offy-s3, offz-s3])(    
            cub),
            


        
          )

    if iter < maxIter:
        iter += 1
        res += (
            segments(maxIter,offx+s3,offy,offz+s3,iter),
            segments(maxIter,offx-s3,offy,offz+s3,iter),
            segments(maxIter,offx,offy+s3,offz+s3,iter),
            segments(maxIter,offx,offy-s3,offz+s3,iter),


            segments(maxIter,offx+s3,offy,offz-s3,iter),
            segments(maxIter,offx-s3,offy,offz-s3,iter),
            segments(maxIter,offx,offy+s3,offz-s3,iter),
            segments(maxIter,offx,offy-s3,offz-s3,iter),

            
            segments(maxIter,offx,offy,offz+s3,iter),
            segments(maxIter,offx,offy,offz-s3,iter),
            segments(maxIter,offx,offy+s3,offz,iter),
            segments(maxIter,offx,offy-s3,offz,iter),
            segments(maxIter,offx+s3,offy,offz,iter),
            segments(maxIter,offx-s3,offy,offz,iter),

               )
    return res

def mosley(maxIter=3):
    s = translate([0,0,0])(segments(maxIter))
    d = difference()(
            cube(cubesize, True),
            s,
            rotate([90,0,0])(s),
            rotate([0,90,0])(s),
        )
    return d


if __name__ == '__main__':
    out_dir =  sys.argv[1] if len(sys.argv) > 1 else os.curdir
    file_out = os.path.join(out_dir, 'mosley.scad')

    a = mosley(3)

    print("%(__file__)s: SCAD file written to: \n%(file_out)s" % vars())

scad_render_to_file(a, file_out, include_orig_code=True)







