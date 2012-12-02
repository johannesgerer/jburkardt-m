function A = condex(n, k, theta)
%CONDEX   `Counterexamples' to matrix condition number estimators.
%         CONDEX(N, K, THETA) is a `counterexample' matrix to a condition
%         estimator.  It has order N and scalar parameter THETA (default 100).
%         If N is not equal to the `natural' size of the matrix then
%         the matrix is padded out with an identity matrix to order N.
%         The matrix, its natural size, and the estimator to which it applies
%         are specified by K (default K = 4) as follows:
%             K = 1:   4-by-4,     LINPACK (RCOND)
%             K = 2:   3-by-3,     LINPACK (RCOND)
%             K = 3:   arbitrary,  LINPACK (RCOND) (independent of THETA)
%             K = 4:   N >= 4,     SONEST (Higham 1988)
%         (Note that in practice the K = 4 matrix is not usually a
%          counterexample because of the rounding errors in forming it.)

%         References:
%         A.K. Cline and R.K. Rew, A set of counter-examples to three
%            condition number estimators, SIAM J. Sci. Stat. Comput.,
%            4 (1983), pp. 602-611.
%         N.J. Higham, FORTRAN codes for estimating the one-norm of a real or
%            complex matrix, with applications to condition estimation
%            (Algorithm 674), ACM Trans. Math. Soft., 14 (1988), pp. 381-396.

if nargin < 3, theta = 100; end
if nargin < 2, k = 4; end

if k == 1    % Cline and Rew (1983), Example B.

   A = [1  -1  -2*theta     0
        0   1     theta  -theta
        0   1   1+theta  -(theta+1)
        0   0   0         theta];

elseif k == 2   % Cline and Rew (1983), Example C.

   A = [1   1-2/theta^2  -2
        0   1/theta      -1/theta
        0   0             1];

elseif k == 3    % Cline and Rew (1983), Example D.

    A = triw(n,-1)';
    A(n,n) = -1;

elseif k == 4    % Higham (1988), p. 390.

    x = ones(n,3);            %  First col is e
    x(2:n,2) = zeros(n-1,1);  %  Second col is e(1)

    % Third col is special vector b in SONEST
    x(:, 3) = (-1).^[0:n-1]' .* ( 1 + [0:n-1]'/(n-1) );

    Q = orth(x);  %  Q*Q' is now the orthogonal projector onto span(e(1),e,b)).
    P = eye(n) - Q*Q';
    A = eye(n) + theta*P;

end

% Pad out with identity as necessary.
[m, m] = size(A);
if m < n
   for i=n:-1:m+1, A(i,i) = 1; end
end
