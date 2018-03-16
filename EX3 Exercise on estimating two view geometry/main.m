
clear all;
clc;

R = eye(3);
t1 = [0;0;0];
t2 = [-5;0;2];
t3 = [0.1;0;0.1];

A = eye(3); %FROM: assumed that the images have been corrected for inner orientation
%A(end,end) = 0;
%A = A(1:3,1:4);
%% Q1.1
%1
%camera matrices
cameraMatrix1 = [R t1];
cameraMatrix2 = [R t2];
cameraMatrix3 = [R t3];

%%
%2
Q = [2;4;10;1]; 

q11 = [0.2;0.4;1];
q12 = [-0.25;1/3;1];
q13 = [0.2079;0.3960;1];

P1 = A * cameraMatrix1;
P2 = A * cameraMatrix2;
P3 = A * cameraMatrix3;

q11mine = P1*Q
q12mine = P2*Q
q13mine = P3*Q

q11 = q11mine/q11mine(end)
q12 = q12mine/q12mine(end)
q13 = q13mine/q13mine(end)

%%
%3
%Located in t, looking straight ahead (identity matrix)

%% Q1.2
Est3D(q11,P1,q12,P2)

%% Q1.2.1
q21 = [-0.1667;0.3333;1];
q22 = [-0.5;0.2857;1];

Q2 = Est3D(q21,P1,q22,P2)

%% Q1.2.2
q23 = P3*Q2;
q23 = q23/q23(end)

%% Q1.3.1
q_22 = q22;
q_22(1:2) =q_22(1:2)+ 0.1;
q_23 = q23;
q_23(1:2) =q_23(1:2)+ 0.1;

%% Q1.3.2
Q_2 = Est3D(q21,P1,q_22,P2);

%% Q1.3.3
Q_3 = Est3D(q21,P1,q_23,P3);

%% Q1.3.4
%the cameras 1 and 3 have much more error, because they are much closer
%together. The best would be a 45 angle triangular position with the 1/3>
%ratio>3 positions
clc 
Q
Q_2
Q_3

%% Q1.4
clc;
load('TwoImageData.mat')
points = GetTwoPointsFromImage(im1,im2)
q_1 = points(:,1);
q_2 = points(:,2);
P_1 = A * [R1 T1];
P_2 = A * [R2 T2];
Q_real = Est3D(q_1,P_1,q_2,P_2)
%Q_real = Q_real/Q_real(end)
%% Q2
clc

petergade = imread('petergade.png');
cdata = imread('cdata.png');
points_new = GetFourPointsFromImages(petergade, cdata);
actual_field_points = points_new(:,1:4);
court_points = points_new(:,5:end);
H = actual_field_points
