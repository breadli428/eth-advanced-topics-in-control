figure(1);
hold on
axis equal
axis([-5 5 -5 5 0 4])
grid on
view([-60 30])
xlabel("x");
ylabel("y");
zlabel("-z");


p_x = p.Data(:, 1);
p_y = p.Data(:, 2);
p_z = p.Data(:, 3);

for i = 1:size(p.Data, 1)

    o = [p_x(i), p_y(i), p_z(i)]';
    h_1 = plot3(o(1), o(2), -o(3), 'r.');
    h_2 = plot3(o(1), o(2), 0, '.', 'Color', [0.8500 0.3250 0.0980]);
    h_3 = plot3([o(1) o(1)], [o(2) o(2)], [-o(3) 0], 'Color', [0.6 0.6 0.6]);
    v = R.Data(:, :, i) * diag([0.215 0.215 0]);
    q_1 = o + v;
    q_2 = o - v;
    
    h_4 = [];
    prop = [[0.215; 0; 0], [-0.215; 0; 0], [0; 0.215; 0], [0; -0.215; 0]];
    for j = 1:4
        cir = circle(prop(:, j), 0.1);
        cir_E = R.Data(:, :, i) * cir;
        h_4(j) = plot3(o(1) + cir_E(1, :), o(2) + cir_E(2, :), -o(3) - cir_E(3, :), 'Color', [0 0.4470 0.7410], 'LineWidth', 1.2);
    end

    h_5 =[];
    h_6 =[];

    for k = 1:3
        h_5(k) = plot3([o(1) q_1(1, k)], [o(2) q_1(2, k)], -[o(3) q_1(3, k)], 'k-', 'LineWidth', 1.2);
        h_6(k) = plot3([o(1) q_2(1, k)], [o(2) q_2(2, k)], -[o(3) q_2(3, k)], 'k-', 'LineWidth', 1.2);
    end
    drawnow limitrate
    
    delete(h_3);
    delete(h_4);
    delete(h_5);
    delete(h_6);

end
