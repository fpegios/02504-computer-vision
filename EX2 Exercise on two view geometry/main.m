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
Aq = [1 b Dx; 0 a Dy; 0 0 1];
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
k3 = -1e-6;
k5 = 0;

Pd = (Ap * [R,t]) * [Q; ones(1,size(Q,2))]; % Pd = Ap[Rt]Qi
Pd = Pd./Pd(end,:);

r = sqrt(Pd(1,:).^2 + Pd(2,:).^2) % r = sqrt(xd^2 + yd^2)
Dr = zeros(size(r));
Dr = k3*r.^2 + k5*r.^4 % Dr = k3r^2 + k5r^4

Pc = Pd(1:2,: ).*( 1 + Dr);
Pc = [Pc;Pd(end,:)]; % Pc = Pd * (1 + Dr)

figure
q = Aq * Pc;
q(1,:) = q(1,:)./q(3,:);
q(2,:) = q(2,:)./q(3,:);
q(3,:) = q(3,:)./q(3,:);
plot(q(1,:), q(2,:), '.');
axis equal
axis([0 640 0 480])

%% Q4 
avec = CrossOp([1,2,3])

%% Q5
f = 100
deltaX = 300
deltaY = 200
alpha = 10;
beta = 0;

A1 = [f      beta      deltaX ;
     0       alpha*f   deltaY ;
     0       0         1 ];
 
A2 = [f      beta      deltaX ;
     0       alpha*f   deltaY ;
     0       0         1 ];

Ap=[f,0,0;0,alpha*f,0;0,0,1]; %%internal parameters
Aq=[1,0,deltaX;0,1,deltaY;0,0,1]; %%internal parameters

R1 = eye(3,3);
R2 = Rot(0.2,-0.3,0.1); %%Rotation

t1 = [0;0;0];
t2 = [0.2;2;0.1]; %%translation

k3 = -1*exp(-6);
k5 = -1*exp(-12);

Q = [1;0.5;4;1];

%project point Q
P1 = A1*[R1,t1];
P2 = A2*[R2,t2];

q1=P1*Q;
q1 = q1/q1(3);
q2 = P2 * Q;
q2 = q2/q2(3);

F = transpose(inv(A2)) * CrossOp(t2) * R2*inv(A1); %fundamental matrix

%% Q6
l2 = F*q1 %the epipolar line.. : ASK what is epipolar line exactly and epipoles

answer = transpose(q2)*l2; %% IS this clsoe to 0 enough???

%% Q9
%R is orthogonal, since R*R' = I. So then dividing by R, or  inv(R) = R'.
%and so on..

%% Q10
%??

%% Q11
Fund = transpose(inv(A)) * CrossOp(T2) * R2*inv(A); %fundamental matrix

%% Q12
PlotAndDrawEpip(im1,im2,A,R2,T2);

%% Q13
PlotAndDrawEpip(im2,im1,A,R2,T2);

%% Q14
Q = PointsInPlane();

f = 1000;
deltaX = 300;
deltaY = 200;
A=[f,0,deltaX;0,f,deltaY;0,0,1]; %%internal parameters
R = Rot(0.2,-0.3,0.1); %%Rotation

t = [0.8866;0.5694;0.1911]; %%translation
temp = [R,t];
P = A*temp;

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis equal
axis([0 640 0 480])

%% Q15
A = [1/sqrt(2);0;1/sqrt(2)];
B = [0;1;0];
C = [1;0.5;5];
H = P*[A B C;
      0 0 1];

%% Q16
Hprime = inv(H); %%???
q1 = H*Q;
plot(q1);