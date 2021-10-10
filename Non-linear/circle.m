function cir = circle(center, r)
th = 0:pi/60:2*pi;
cir_x = r * cos(th) + center(1);
cir_y = r * sin(th) + center(2);
cir_z = zeros(size(cir_x));
cir = [cir_x; cir_y; cir_z];
end