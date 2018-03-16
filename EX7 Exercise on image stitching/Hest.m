
function [ H ] = Hest(p1, p2)

p1 = p1./p1(3,:);
p2 = p2./p2(3,:);

K = [];
for i = 1 : length(p1)
    K = [K; kron(p2(:,i)', CrossOp(p1(:,i)))];
end


[U, S, V] = svd(K);
H = V(:,end);
H = reshape(H, [3,3]);

X1 = p1;
Mean1=mean(X1')';
X1(1,:)=X1(1,:)-Mean1(1);
X1(2,:)=X1(2,:)-Mean1(2);
S1=mean(sqrt(diag(X1'*X1)))/sqrt(2);
X1(1:2,:)=X1(1:2,:)/S1;
T1=[eye(2)/S1,-Mean1(1:2)/S1;0 0 1];

X2 = p2;
Mean2=mean(X2')';
X2(1,:)=X2(1,:)-Mean2(1);
X2(2,:)=X2(2,:)-Mean2(2);
S2=mean(sqrt(diag(X2'*X2)))/sqrt(2);
X2(1:2,:)=X2(1:2,:)/S2;
T2=[eye(2)/S1,-Mean2(1:2)/S2;0 0 1];

% H = inv(T1) * H * T2;
end

