function A = forsythe(n, alpha, lambda)
%FORSYTHE  Forsythe matrix - a perturbed Jordan block.
%          FORSYTHE(N, ALPHA, LAMBDA) is the N-by-N matrix equal to
%          JORDBLOC(N, LAMBDA) except it has an ALPHA in the (N,1) position.
%          It has the characteristic polynomial
%                  DET(A-t*EYE) = (LAMBDA-t)^N - (-1)^N ALPHA.
%          ALPHA defaults to SQRT(EPS) and LAMBDA to 0.

if nargin < 2, alpha = sqrt(eps); end
if nargin < 3, lambda = 0; end

A = jordbloc(n, lambda);
A(n,1) = alpha;
