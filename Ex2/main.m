clear
close all
clc

%% Q1 
Q = Box3D;
R = Rot(0.2, -0.3, 0.1);
t = [0.8866 0.5694 0.1911].';
f = 1000;
Dx = 300;
Dy = 200;
A = [f 0 Dx; 0 f Dy; 0 0 1];
P = A * [R,t];
figure
q = P * [Q; ones(1,size(Q,2))];
q(1,:) = q(1,:)./q(3,:);
q(2,:) = q(2,:)./q(3,:);
q(3,:) = q(3,:)./q(3,:);
plot(q(1,:), q(2,:), '.');
axis equal
axis([0 640 0 480])

%% Q2
Q = Box3D;
R = Rot(0.2, -0.3, 0.1);
t = [0.8866 0.5694 0.1911].';
f = 1000;
a = 1;
b = 0;
Dx = 300;
Dy = 200;
Ap = [f 0 0; 0 f 0; 0 0 1];
Aq = [1 b Dx; 0 1 Dy; 0 0 1];
k3 = -1e1 -6;
k5 = 1e1 -12;

Pd = (Ap * [R,t]) * [Q; ones(1,size(Q,2))]; % Pd = Ap[Rt]Qi
Pd(1,:) = Pd(1,:)./Pd(3,:);
Pd(2,:) = Pd(2,:)./Pd(3,:);
Pd(3,:) = Pd(3,:)./Pd(3,:);

r = zeros(1, length(Pd) );
r(:) = sqrt( Pd(1,:).^2 + Pd(2,:).^2); % r = sqrt(xd^2 + yd^2)
Dr = zeros(size(r));
Dr(:) = k3*r(:).^2 + k5*r(:).^4; % Dr = k3r^2 + k5r^4

Pc = zeros(size(Pd));
Pc(1,:) = Pd(1,:) .* (1 + Dr); % Pc = Pd * (1 + Dr)
Pc(2,:) = Pd(2,:) .* (1 + Dr);
Pc(3,:) = Pd(3,:) .* (1 + Dr);

figure
q = Aq * Pc;
q(1,:) = q(1,:)./q(3,:);
q(2,:) = q(2,:)./q(3,:);
q(3,:) = q(3,:)./q(3,:);
plot(q(1,:), q(2,:), '.');
axis equal
axis([0 640 0 480])

%% Q3 
% It looks the same
Q = Box3D;
R = Rot(0.2, -0.3, 0.1);
t = [0.8866 0.5694 0.1911].';
f = 1000;
a = 1;
b = 0;
Dx = 300;
Dy = 200;
Ap = [f 0 0; 0 f 0; 0 0 1];
Aq = [1 b Dx; 0 1 Dy; 0 0 1];
k3 = -1e1 -6;
k5 = 0;

Pd = (Ap * [R,t]) * [Q; ones(1,size(Q,2))]; % Pd = Ap[Rt]Qi
Pd(1,:) = Pd(1,:)./Pd(3,:);
Pd(2,:) = Pd(2,:)./Pd(3,:);
Pd(3,:) = Pd(3,:)./Pd(3,:);

r = zeros(1, length(Pd) );
r(:) = sqrt( Pd(1,:).^2 + Pd(2,:).^2); % r = sqrt(xd^2 + yd^2)
Dr = zeros(size(r));
Dr(:) = k3*r(:).^2 + k5*r(:).^4; % Dr = k3r^2 + k5r^4

Pc = zeros(size(Pd));
Pc(1,:) = Pd(1,:) .* (1 + Dr); % Pc = Pd * (1 + Dr)
Pc(2,:) = Pd(2,:) .* (1 + Dr);
Pc(3,:) = Pd(3,:) .* (1 + Dr);

figure
q = Aq * Pc;
q(1,:) = q(1,:)./q(3,:);
q(2,:) = q(2,:)./q(3,:);
q(3,:) = q(3,:)./q(3,:);
plot(q(1,:), q(2,:), '.');
axis equal
axis([0 640 0 480])