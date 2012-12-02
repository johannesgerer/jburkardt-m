function y = cond(A, p)
%COND   Matrix condition number in 1, 2, Frobenius, or infinity norm.
%       For p = 1, 2, 'fro', inf,  COND(A,p) = NORM(A,p) * NORM(INV(A),p).
%       If p is omitted then p = 2 is used.
%       A may be a rectangular matrix if p = 2; in this case COND(A)
%       is the ratio of the largest singular value of A to the smallest
%       (and hence is infinite if A is rank deficient).

%	See also RCOND, NORM, CONDEST, NORMEST.
%       Generalises and incorporates MATFUN/COND.M from Matlab 4.

if length(A) == 0  % Handle null matrix.
    y = NaN;
    return
end
if issparse(A)
    error('Matrix must be non-sparse.')
end

if nargin == 1, p = 2; end

[m, n] = size(A);
if m ~= n & p ~= 2
   error('A is rectangular.  Use the 2 norm.')
end

if p == 2
   s = svd(A);
   if any(s == 0)   % Handle singular matrix
        disp('Condition is infinite')
        y = Inf;
        return
   end
   y = max(s)./min(s);
else
%  We'll let NORM pick up any invalid p argument.
   y = norm(A, p) * norm(inv(A), p);
end
