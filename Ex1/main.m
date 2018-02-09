clear
close all
clc
Q=Box3D;

%% Intro
Q=Box3D;
plot3(Q(1,:),Q(2,:),Q(3,:),'.')
axis equal
axis([-1 1 -1 1 -1 5])
xlabel('x')
ylabel('y')
zlabel('z')
P = eye(3,4);

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis([-0.3 0.3 -0.3 0.3])

%% Q10
A = eye(3, 3);
R = eye(3, 3);
t = ones(3, 1);
P = A *(R * t);

figure
q=P*[Q; ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis([-0.3 0.3 -0.3 0.3])

%% Q11
A = eye(3, 3);
R = [0.9397 0.3420 0; -0.3420 0.9397 0; 0 0 1.0000];
t = ones(3, 1);
P = A *(R * t);

figure
q=P*[Q; ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis([-0.3 0.3 -0.3 0.3])

%% Q12
A = eye(3, 3);
R = [0.9397 0.3420 0; -0.3420 0.9397 0; 0 0 1.0000];
t = [0 0 2].';
P = A *(R * t);

figure
q=P*[Q; ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.')
axis([-0.3 0.3 -0.3 0.3])

%% Q13
f = 1000;
Dx = 200;
Dy = 200;
A = [f 0 Dx; 0 f Dy; 0 0 1];
R = eye(3, 3);
t = ones(3, 1);
P = A *(R * t);


figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.');
axis equal
axis([0 640 0 480])


%% Q14
f = 1000;
Dx = 300;
Dy = 200;
A = [f 0 Dx; 0 f Dy; 0 0 1];
R = eye(3, 3);
t = ones(3, 1);
P = A *(R * t);


figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.');
axis equal
axis([0 640 0 480])

%% Q15
f = 1200;
Dx = 300;
Dy = 200;
A = [f 0 Dx; 0 f Dy; 0 0 1];
R = eye(3, 3);
t = ones(3, 1);
P = A *(R * t);

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.');
axis equal
axis([0 640 0 480])

%% Q16
f = 2000;
Dx = 300;
Dy = 200;
A = [f 0 Dx; 0 f Dy; 0 0 1];
R = eye(3, 3);
t = [0 0 3].';
P = A *(R * t);

figure
q=P*[Q;ones(1,size(Q,2))];
q(1,:)=q(1,:)./q(3,:);
q(2,:)=q(2,:)./q(3,:);
q(3,:)=q(3,:)./q(3,:);
plot(q(1,:),q(2,:),'.');
axis equal
axis([0 640 0 480])