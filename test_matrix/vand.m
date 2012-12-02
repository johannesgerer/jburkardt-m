function V = vand(m, p)
%VAND   Vandermonde matrix.
%       V = VAND(P), where P is a vector, produces the (primal)
%       Vandermonde matrix based on the points P, i.e. V(i,j) = P(j)^(i-1).
%       VAND(M,P) is a rectangular version of VAND(P) with M rows.
%       Special case: If P is a scalar then P equally spaced points on [0,1]
%                     are used.

%       Reference:
%       N.J. Higham, Stability analysis of algorithms for solving
%       confluent Vandermonde-like systems, SIAM J. Matrix Anal. Appl.,
%       11 (1990), pp. 23-41.

if nargin == 1, p = m; end
n = max(size(p));

%  Handle scalar p.
if n == 1
   n = p;
   p = seqa(0,1,n);
end

if nargin == 1, m = n; end

p = p(:).';                    % Ensure p is a row vector.
V = ones(m,n);
for i=2:m
    V(i,:) = p.*V(i-1,:);
end
