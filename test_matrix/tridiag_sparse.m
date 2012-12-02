function T = tridiag_sparse ( n, x, y, z )

%%TRIDIAG_SPARSE  Tridiagonal matrix (sparse).
%
%         TRIDIAG_SPARSE(X, Y, Z) is the tridiagonal matrix with subdiagonal X,
%         diagonal Y, and superdiagonal Z.
%         X and Z must be vectors of dimension one less than Y.
%
%         Alternatively TRIDIAG_SPARSE(N, C, D, E), where C, D, and E are all
%         scalars, yields the Toeplitz tridiagonal matrix of order N
%         with subdiagonal elements C, diagonal elements D, and superdiagonal
%         elements E.   This matrix has eigenvalues (Todd 1977)
%                  D + 2*SQRT(C*E)*COS(k*PI/(N+1)), k=1:N.
%
%         TRIDIAG_SPARSE(N) is the same as TRIDIAG_SPARSE(N,-1,2,-1), which is
%         a symmetric positive definite M-matrix (the negative of the
%         second difference matrix).
%
%  References:
%
%    J. Todd, 
%    Basic Numerical Mathematics, 
%    Volume 2: Numerical Algebra,
%    Birkhauser, Basel, and Academic Press, 
%    New York, 1977, page 155.
%
%    D. E. Rutherford, 
%    Some continuant determinants arising in physics and chemistry---II, 
%    Proceedings of the Royal Society of Edinburgh, 
%    Volume 63, A (1952), pages 232-241.
%
if ( nargin == 1 )
  x = -1; 
  y = 2; 
  z = -1; 
end

if ( nargin == 3 ) 
  z = y; 
  y = x; 
  x = n; 
end
%
%  Force column vectors.
%
x = x(:); 
y = y(:); 
z = z(:);   

if max( [ size(x) size(y) size(z) ] ) == 1
   x = x*ones(n-1,1);
   z = z*ones(n-1,1);
   y = y*ones(n,1);
else
   [nx, m] = size(x);
   [ny, m] = size(y);
   [nz, m] = size(z);
   if ( ny - nx - 1) | ( ny - nz -1 )
      error('TRIDIAG_SPARSE: Dimensions of vector arguments are incorrect.')
   end
end

n = max(size(y));
T = spdiags([ [x;0] y [0;z] ], -1:1, n, n);
