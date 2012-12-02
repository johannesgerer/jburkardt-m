function A = wathen ( nx, ny, k )

%% WATHEN returns the Wathen matrix.
%
%  Discussion:
%
%    The Wathen matrix is a finite element matrix which is sparse.
%
%    The entries of the matrix depend in part on a physical quantity
%    related to density.  That density is here assigned random values between
%    0 and 100.
%
%    A = WATHEN ( NX, NY ) is a sparse random N-by-N finite element matrix
%    where N = 3*NX*NY + 2*NX + 2*NY + 1.
%
%    A is the consistent mass matrix for a regular NX-by-NY
%    grid of 8-node (serendipity) elements in 2 space dimensions.
%
%    Here is an illustration for NX = 3, NX = 2:
%
%     23-24-25-26-27-28-29
%      |     |     |     |
%     19    20    21    22
%      |     |     |     |
%     12-13-14-15-16-17-18
%      |     |     |     |
%      8     9    10    11
%      |     |     |     |
%      1--2--3--4--5--6--7
%
%    For this example, the total number of nodes is, as expected,
%
%      N = 3 * 3 * 2 + 2 * 2 + 2 * 3 + 1 = 29.
%
%    A is symmetric positive definite for any (positive) values of
%    the density, RHO(NX,NY), which is chosen randomly in this routine.
%
%    In particular, if D = DIAG(DIAG(A)), then
%      0.25 <= EIG(INV(D)*A) <= 4.5
%    for any positive integers NX and NY and any densities RHO(NX,NY).
%
%    A = WATHEN ( NX, NY, 1 ) returns the diagonally scaled matrix.
%
%  Modified:
%
%    17 September 2007
%
%  Author:
%
%    Nicholas Higham
%
%  Reference:
%
%    Nicholas Higham,
%    Algorithm 694: A Collection of Test Matrices in MATLAB,
%    ACM Transactions on Mathematical Software,
%    Volume 17, Number 3, September 1991, pages 289-305.
%
%    Andrew Wathen, 
%    Realistic eigenvalue bounds for the Galerkin mass matrix, 
%    IMA Journal of Numerical Analysis, 
%    Volume 7, 1987, pages 449-457.
%
%  Parameters:
%
%    Input, integer NX, NY, the number of elements in the X and Y directions
%    of the finite element grid.  NX and NY must each be at least 1.
%
%    Optional input, integer K, is used to request that the diagonally scaled
%    version of the matrix be returned.  This happens if K is specified with
%    the value 1.
%
%    Output, sparse real A(N,N), the matrix.  The dimension N is determined by
%    NX and NY, as described above.  A is stored in the MATLAB sparse matrix
%    format.  
%
  if ( nargin < 2 )
    error ( 'Two dimensioning arguments must be specified.' )
  end
  
  if ( nargin < 3 )
    k = 0; 
  end

  e1 = [ 6  -6   2 -8; ...
        -6  32  -6 20; ...
		 2  -6   6 -6; ...
        -8  20  -6 32 ];
		
  e2 = [ 3  -8   2  -6; ... 
        -8  16  -8  20; ...
		 2  -8   3  -8; ...
	    -6  20  -8  16 ];
		
  e = [ e1  e2; ...
        e2' e1] / 45.0;
  
  n = 3 * nx * ny + 2 * nx + 2 * ny + 1;
  
  A = sparse ( n, n );

  rho = 100.0 * rand ( nx, ny );

  for j = 1 : ny
	for i = 1 : nx
%
%  For the element (I,J), determine the indices of the 8 nodes.
%
      nn(1) = 3 * j * nx + 2 * i + 2 * j + 1;
      nn(2) = nn(1) - 1;
      nn(3) = nn(2) - 1;
      nn(4) = ( 3 * j - 1 ) * nx + 2 * j + i - 1;
      nn(5) = 3 * ( j - 1 ) * nx + 2 * i + 2 * j - 3;
      nn(6) = nn(5) + 1;
      nn(7) = nn(6) + 1;
      nn(8) = nn(4) + 1;

      em = e * rho(i,j);

	  for krow = 1 : 8
	    for kcol = 1 : 8
		  A(nn(krow),nn(kcol)) = A(nn(krow),nn(kcol)) + em(krow,kcol);
		end
	  end

	end
  end
%
%  If requested, return A with diagonal scaling.
%
  if ( k == 1 )
    A = diag ( diag ( A ) ) \ A;
  end
