function [r,q] = mgs(C)
[m,n] = size(C);
for k = 1:n
for j=1:m
x(j) = C(j,k);
end
xn = 0;
for j=1:m,
xn = xn + x(j)*x(j);
end
r(k,k) = sqrt(xn);
for j=1:m,
q(j,k) = C(j,k)/r(k,k);
end
for j = k+1:n
r(k,j) = 0;
for p=1:m
r(k,j) = r(k,j) + q(p,k)'*C(p,j);
end
for p=1:m
C(p,j) = C(p,j) - q(p,k)*r(k,j);
end
end
end

