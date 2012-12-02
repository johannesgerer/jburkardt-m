function A = randsvd(n, kappa, mode, kl, ku)
%RANDSVD  Random matrix with pre-assigned singular values.
%      RANDSVD(N, KAPPA, MODE, KL, KU) is a (banded) random matrix of order N
%      with COND(A) = KAPPA and singular values from the distribution MODE.
%      N may be a 2-vector, in which case the matrix is N(1)-by-N(2).
%      Available types:
%             MODE = 1:   one large singular value,
%             MODE = 2:   one small singular value,
%             MODE = 3:   geometrically distributed singular values,
%             MODE = 4:   arithmetically distributed singular values,
%             MODE = 5:   random singular values with unif. dist. logarithm.
%      If omitted, MODE defaults to 3, and KAPPA defaults to SQRT(1/EPS).
%      If MODE < 0 then the effect is as for ABS(MODE) except that in the
%      original matrix of singular values the order of the diagonal entries
%      is reversed: small to large instead of large to small.
%      KL and KU are the lower and upper bandwidths respectively; if they
%      are omitted a full matrix is produced.
%      If only KL is present, KU defaults to KL.
%      Special case: if KAPPA < 0 then a random full symmetric positive
%                    definite matrix is produced with COND(A) = -KAPPA and
%                    eigenvalues distributed according to MODE.
%                    KL and KU, if present, are ignored.

%      Reference:
%      N.J. Higham, Accuracy and Stability of Numerical Algorithms,
%         Society for Industrial and Applied Mathematics, Philadelphia, PA,
%         USA, 1996; sec. 26.3.

%      This routine is similar to the more comprehensive Fortran routine xLATMS
%      in the following reference:
%      J.W. Demmel and A. McKenney, A test matrix generation suite,
%      LAPACK Working Note #9, Courant Institute of Mathematical Sciences,
%      New York, 1989.

if nargin < 2, kappa = sqrt(1/eps); end
if nargin < 3, mode = 3; end
if nargin < 4, kl = n-1; end  % Full matrix.
if nargin < 5, ku = kl; end   % Same upper and lower bandwidths.

if abs(kappa) < 1, error('Condition number must be at least 1!'), end
posdef = 0; if kappa < 0, posdef = 1; kappa = -kappa; end  % Special case.

p = min(n);
m = n(1);              % Parameter n specifies dimension: m-by-n.
n = n(max(size(n)));

if p == 1              % Handle case where A is a vector.
   A = randn(m, n);
   A = A/norm(A);
   return
end

j = abs(mode);

% Set up vector sigma of singular values.
if j == 3
   factor = kappa^(-1/(p-1));
   sigma = factor.^[0:p-1];

elseif j == 4
   sigma = ones(p,1) - (0:p-1)'/(p-1)*(1-1/kappa);

elseif j == 5    % In this case cond(A) <= kappa.
   rand('uniform')
   sigma = exp( -rand(p,1)*log(kappa) );

elseif j == 2
   sigma = ones(p,1);
   sigma(p) = 1/kappa;

elseif j == 1
   sigma = ones(p,1)./kappa;
   sigma(1) = 1;
end

% Convert to diagonal matrix of singular values.
if mode < 0
  sigma = sigma(p:-1:1);
end
sigma = diag(sigma);

if posdef                % Handle special case.
   Q = qmult(p);
   A = Q'*sigma*Q;
   A = (A + A')/2;       % Ensure matrix is symmetric.
   return
end

if m ~= n
   sigma(m, n) = 0;      % Expand to m-by-n diagonal matrix.
end

if kl == 0 & ku == 0     % Diagonal matrix requested - nothing more to do.
   A = sigma;
   return
end

% A = U*sigma*V, where U, V are random orthogonal matrices from the
% Haar distribution.
A = qmult(sigma');
A = qmult(A');

if kl < n-1 | ku < n-1   % Bandwidth reduction.
   A = bandred(A, kl, ku);
end
