clear
close all
Q=Box3D;


%%
%%without radial distortion
f = 1000
deltaX = 300
deltaY = 200
A=[f,0,deltaX;0,f,deltaY;0,0,1] %%internal parameters
R = Rot(0.2,-0.3,0.1) %%Rotation

t = [0.8866;0.5694;0.1911] %%translation
temp = [R,t]
P = A*temp

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis equal
axis([0 640 0 480])

%%
%%%%with radial distortion 
clear all;
clc;
Q=Box3D;

f = 1000;
deltaX = 300;
deltaY = 200;
R = Rot(0.2,-0.3,0.1); %%Rotation

t = [0.8866;0.5694;0.1911]; %%translation

k3 = -1e-6;
k5 = 1e-12;

Ap=[f,0,0;0,f,0;0,0,1]; %%internal parameters
Aq=[1,0,deltaX;0,1,deltaY;0,0,1]; %%internal parameters

temp = Ap*[R,t];
Pd = temp*[Q;ones(1,size(Q,2))];

Pd = Pd./Pd(end,:);

r = sqrt(Pd(1,:).^2 + Pd(2,:).^2)
Dr = k3*r.^2 + k5*r.^4

Pc = Pd(1:2,: ).*( 1 + Dr);

Pc = [Pc;Pd(end,:)];

q = Aq*Pc

figure
%q=Ptemp*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis equal
axis([0 640 0 480])

%%
%%
%%%%with radial distortion k5 is 0.. what is different???
clear all;
clc;
Q=Box3D;

f = 1000;
deltaX = 300;
deltaY = 200;
R = Rot(0.2,-0.3,0.1); %%Rotation

t = [0.8866;0.5694;0.1911]; %%translation

k3 = -1e-6;
k5 = 0;

Ap=[f,0,0;0,f,0;0,0,1]; %%internal parameters
Aq=[1,0,deltaX;0,1,deltaY;0,0,1]; %%internal parameters

temp = Ap*[R,t];
Pd = temp*[Q;ones(1,size(Q,2))];

Pd = Pd./Pd(end,:);

r = sqrt(Pd(1,:).^2 + Pd(2,:).^2)
Dr = k3*r.^2 + k5*r.^4

Pc = Pd(1:2,: ).*( 1 + Dr);

Pc = [Pc;Pd(end,:)];

q = Aq*Pc

figure
%q=Ptemp*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis equal
axis([0 640 0 480])

%%
%part 2
%4 in script
avec = CrossOp([1,2,3])
%%
%5
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


R1 = eye(3,3)
R2 = Rot(0.2,-0.3,0.1) %%Rotation

t1 = [0;0;0]
t2 = [0.2;2;0.1] %%translation

k3 = -1*exp(-6);
k5 = -1*exp(-12);

Q = [1;0.5;4;1]

%project point Q
P1 = A1*[R1,t1]
P2 = A2*[R2,t2]

q1=P1*Q
q1 = q1/q1(3)
q2 = P2 * Q
q2 = q2/q2(3)

F = transpose(inv(A2)) * CrossOp(t2) * R2*inv(A1) %fundamental matrix

%%
%6
l2 = F*q1 %the epipolar line.. : ASK what is epipolar line exactly and epipoles

answer = transpose(q2)*l2 %% IS this clsoe to 0 enough???

%%3
%9
%R is orthogonal, since R*R' = I. So then dividing by R, or  inv(R) = R'.
%and so on..

%10
%??

%11
Fund = transpose(inv(A)) * CrossOp(T2) * R2*inv(A) %fundamental matrix
%12
%%
PlotAndDrawEpip(im1,im2,A,R2,T2)
%%
%13
PlotAndDrawEpip(im2,im1,A,R2,T2)


%%
%4
%14
Q = PointsInPlane()

f = 1000
deltaX = 300
deltaY = 200
A=[f,0,deltaX;0,f,deltaY;0,0,1] %%internal parameters
R = Rot(0.2,-0.3,0.1) %%Rotation

t = [0.8866;0.5694;0.1911] %%translation
temp = [R,t]
P = A*temp

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis equal
axis([0 640 0 480])

%%
%15
A = [1/sqrt(2);0;1/sqrt(2)];
B = [0;1;0]
C = [1;0.5;5]
H = P*[A B C;
      0 0 1]
%%
%16
Hprime = inv(H) %%???
q1 = H*Q
plot(q1)