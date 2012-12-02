function B = qmult(A)
%QMULT  Pre-multiply by random orthogonal matrix.
%       QMULT(A) is Q*A where Q is a random real orthogonal matrix from
%       the Haar distribution, of dimension the number of rows in A.
%       Special case: if A is a scalar then QMULT(A) is the same as
%                     QMULT(EYE(A)).

%       Called by RANDSVD.
%
%       Reference:
%       G.W. Stewart, The efficient generation of random
%       orthogonal matrices with an application to condition estimators,
%       SIAM J. Numer. Anal., 17 (1980), 403-409.

[n, m] = size(A);

%  Handle scalar A.
if max(n,m) == 1
   n = A;
   A = eye(n);
end

d = zeros(n);

for k = n-1:-1:1

    % Generate random Householder transformation.
    x = randn(n-k+1,1);
    s = norm(x);
    sgn = sign(x(1)) + (x(1)==0);    % Modification for sign(1)=1.
    s = sgn*s;
    d(k) = -sgn;
    x(1) = x(1) + s;
    beta = s*x(1);

    % Apply the transformation to A.
    y = x'*A(k:n,:);
    A(k:n,:) = A(k:n,:) - x*(y/beta);

end

% Tidy up signs.
for i=1:n-1
    A(i,:) = d(i)*A(i,:);
end
A(n,:) = A(n,:)*sign(randn);
B = A;
