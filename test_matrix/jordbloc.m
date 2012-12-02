function J = jordbloc(n, lambda)
%JORDBLOC  Jordan block.
%          JORDBLOC(N, LAMBDA) is the N-by-N Jordan block with eigenvalue
%          LAMBDA.  LAMBDA = 1 is the default.

if nargin == 1, lambda = 1; end

J = lambda*eye(n) + diag(ones(n-1,1),1);
