function params = parameters()

%% Quadrotor parameters
l = 0.215; %arm length
b = 8.5e-6; %thrust constant
d = 8.04e-5; %drag constant
J = diag([0.034 0.034 0.09]); %inertia
m = 1.5; %mass
g = 9.81; %gravity

%% Allocation Matrix

%Fill in the allocation matrix such that:
%[U_1, U_2, U_3, U_4]' = A * [omega_{p,1}^{2} ... omega_{p,4}^{2}]'

% You might need these values in the allocation matrix calculation:
allocation_matrix = [
    b, b, b, b; ...
    0, -b*l, 0, b*l; ...
    b*l, 0, -b*l, 0; ...
    d, -d, d, -d];



params.allocation_matrix = allocation_matrix;

%the pseudo inverse of the allocation matrix
params.pinv_allocation_matrix = pinv(allocation_matrix);

params.l = l;
params.b = b;
params.d = d;
params.J = J;
params.m = m;
params.g = g;

%% Controllers tuning parameters
%Attitude
params.attitude_Kp = [42; 42; 4]; %Kp attitude controller
params.attitude_Kd = [2; 2; 3.5]; %Kd attitude controller

%Position
params.position_Kp = [0.5; 0.5; 25]; %Kp for position controller
params.position_Kd = [1.0; 1.0; 10]; %Kd for position controller

end