function P = pascal(n, k)
%PASCAL  Pascal matrix.
%        P = PASCAL(N) is the Pascal matrix of order N: a symmetric positive
%        definite matrix with integer entries taken from Pascal's
%        triangle.
%        The Pascal matrix is totally positive and its inverse has
%        integer entries.  Its eigenvalues occur in reciprocal pairs.
%        COND(P) is approximately 16^N/(N*PI) for large N.
%        PASCAL(N,1) is the lower triangular Cholesky factor (up to signs
%        of columns) of the Pascal matrix.   It is involutary (is its own
%        inverse).
%        PASCAL(N,2) is a transposed and permuted version of PASCAL(N,1)
%        which is a cube root of the identity.

%        References:
%        R. Brawer and M. Pirovino, The linear algebra of the Pascal matrix,
%           Linear Algebra and Appl., 174 (1992), pp. 13-23 (this paper
%           gives a factorization of L = PASCAL(N,1) and a formula for the
%           elements of L^k).
%        N.J. Higham, Accuracy and Stability of Numerical Algorithms,
%           Society for Industrial and Applied Mathematics, Philadelphia, PA,
%           USA, 1996; sec. 26.4.
%        S. Karlin, Total Positivity, Volume 1, Stanford University Press,
%           1968.  (Page 137: shows i+j-1 choose j is TP (i,j=0,1,...).
%                   PASCAL(N) is a submatrix of this matrix.)
%        M. Newman and J. Todd, The evaluation of matrix inversion programs,
%           J. Soc. Indust. Appl. Math., 6(4):466--476, 1958.
%        H. Rutishauser, On test matrices, Programmation en Mathematiques
%           Numeriques, Editions Centre Nat. Recherche Sci., Paris, 165,
%           1966, pp. 349-365.  (Gives an integral formula for the
%           elements of PASCAL(N).)
%        J. Todd, Basic Numerical Mathematics, Vol. 2: Numerical Algebra,
%           Birkhauser, Basel, and Academic Press, New York, 1977, p. 172.
%        H.W. Turnbull, The Theory of Determinants, Matrices, and Invariants,
%           Blackie, London and Glasgow, 1929.  (PASCAL(N,2) on page 332.)

if nargin == 1, k = 0; end

P = diag( (-1).^[0:n-1] );
P(:, 1) = ones(n,1);

%  Generate the Pascal Cholesky factor (up to signs).
for j=2:n-1
    for i=j+1:n
        P(i,j) = P(i-1,j) - P(i-1,j-1);
    end
end

if k == 0

   P = P*P';

elseif k == 2

   P = rot90(P,3);
   if n/2 == round(n/2), P = -P; end

end
