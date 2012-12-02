function P = pentoep(n, a, b, c, d, e)
%PENTOEP   Pentadiagonal Toeplitz matrix (sparse).
%          P = PENTOEP(N, A, B, C, D, E) is the N-by-N pentadiagonal
%          Toeplitz matrix with diagonals composed of the numbers
%          A =: P(3,1), B =: P(2,1), C =: P(1,1), D =: P(1,2), E =: P(1,3).
%          Default: (A,B,C,D,E) = (1,-10,0,10,1) (a matrix of Rutishauser).
%                    This matrix has eigenvalues lying approximately on
%                    the line segment 2*cos(2*t) + 20*i*sin(t).
%
%          Interesting plots are
%          PS(FULL(PENTOEP(32,0,1,0,0,1/4)))  - `triangle'
%          PS(FULL(PENTOEP(32,0,1/2,0,0,1)))  - `propeller'
%          PS(FULL(PENTOEP(32,0,1/2,1,1,1)))  - `fish'

%          References:
%          R.M. Beam and R.F. Warming, The asymptotic spectra of
%             banded Toeplitz and quasi-Toeplitz matrices, SIAM J. Sci.
%             Comput. 14 (4), 1993, pp. 971-1006.
%          H. Rutishauser, On test matrices, Programmation en Mathematiques
%             Numeriques, Editions Centre Nat. Recherche Sci., Paris, 165,
%             1966, pp. 349-365.

if nargin == 1, a = 1; b = -10; c = 0; d = 10; e = 1; end

P = spdiags([ a*ones(n,1) b*ones(n,1) c*ones(n,1) d*ones(n,1) ....
              e*ones(n,1) ], -2:2, n, n);
