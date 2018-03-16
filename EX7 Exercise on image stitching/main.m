%% Q1
q1 = rand(3,10);
Htrue = [10 0 -1; 1 10 20; 0.01 0 3];
q2 = Htrue*q1;

H_est = Hest(q1, q2) %estimate homography

est_q1 = H_est*q2;
q1 = q1./q1(3,:);
est_q1 = est_q1./est_q1(3,:);

est_q1 - q1