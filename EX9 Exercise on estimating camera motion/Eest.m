function [E, R, t, nIn] = Eest(K,q1,q2,Sigma);
% EEST estimate essential matrix from image correspondences.
% [E,R,t,nIn] = Eest(K,q1,q2,Sigma);
% Note that the computer vision toolbox is necessary for this function to work.
% January 2017, jnje@dtu.dk
