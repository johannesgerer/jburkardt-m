function A = fiedler(c)
%FIEDLER  Fiedler matrix - symmetric.
%         A = FIEDLER(C), where C is an n-vector, is the n-by-n symmetric
%         matrix with elements ABS(C(i)-C(j)).
%         Special case: if C is a scalar, then A = FIEDLER(1:C)
%                       (i.e. A(i,j) = ABS(i-j)).
%         Properties:
%           FIEDLER(N) has a dominant positive eigenvalue and all the other
%                      eigenvalues are negative (Szego, 1936).
%           Explicit formulas for INV(A) and DET(A) are given by Todd (1977)
%           and attributed to Fiedler.  These indicate that INV(A) is
%           tridiagonal except for nonzero (1,n) and (n,1) elements.
%           [I think these formulas are valid only if the elements of
%           C are in increasing or decreasing order---NJH.]

%           References:
%           G. Szego, Solution to problem 3705, Amer. Math. Monthly,
%              43 (1936), pp. 246-259.
%           J. Todd, Basic Numerical Mathematics, Vol. 2: Numerical Algebra,
%              Birkhauser, Basel, and Academic Press, New York, 1977, p. 159.

n = max(size(c));

%  Handle scalar c.
if n == 1
   n = c;
   c = 1:n;
end

c = c(:).';                    % Ensure c is a row vector.

A = ones(n,1)*c;
A = abs(A - A.');              % NB. array transpose.
