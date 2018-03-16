function X_norm = normArray(X)
    X_norm(1,:) = X(1,:)./X(3,:);
    X_norm(2,:) = X(2,:)./X(3,:);
    X_norm(3,:) = X(3,:)./X(3,:);
end

