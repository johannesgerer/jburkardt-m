function a_cr = r83_cr_fa ( n, a )

%*****************************************************************************80
%
%% R83_CR_FA decomposes a real tridiagonal matrix using cyclic reduction.
%
%  Discussion:
%
%    The R83 storage format is used for a real tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%    Once R83_CR_FA has decomposed a matrix A, then R83_CR_SL may be used to solve
%    linear systems A * x = b.
%
%    R83_CR_FA does not employ pivoting.  Hence, the results can be more
%    sensitive to ill-conditioning than standard Gauss elimination.  In
%    particular, R83_CR_FA will fail if any diagonal element of the matrix
%    is zero.  Other matrices may also cause R83_CR_FA to fail.
%
%    R83_CR_FA can be guaranteed to work properly if the matrix is strictly
%    diagonally dominant, that is, if the absolute value of the diagonal
%    element is strictly greater than the sum of the absolute values of
%    the offdiagonal elements, for each equation.
%
%    The algorithm may be illustrated by the following figures:
%
%    The initial matrix is given by:
%
%          D1 U1
%          L1 D2 U2
%             L2 R83 U3
%                L3 D4 U4
%                   L4 D5 U5
%                      L5 D6
%
%    Rows and columns are permuted in an odd/even way to yield:
%
%          D1       U1
%             R83    L2 U3
%                D5    L4 U5
%          L1 U2    D2
%             L3 U4    D4
%                L5       D6
%
%    A block LU decomposition is performed to yield:
%
%          D1      |U1
%             R83   |L2 U3
%                D5|   L4 U5
%          --------+--------
%                  |D2'F3
%                  |F1 D4'F4
%                  |   F2 D6'
%
%    For large systems, this reduction is repeated on the lower right hand
%    tridiagonal subsystem until a completely upper triangular system
%    is obtained.  The system has now been factored into the product of a
%    lower triangular system and an upper triangular one, and the information
%    defining this factorization may be used by R83_CR_SL to solve linear
%    systems.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Hockney,
%    A fast direct solution of Poisson's equation using Fourier Analysis,
%    Journal of the ACM,
%    Volume 12, Number 1, pages 95-113, January 1965.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(3,N), the R83 matrix.
%
%    Output, real A_CR(3,2*N+1), factorization information.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R83_CR_FA - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive N = %d\n', n );
    return
  end

  a_cr = zeros ( 3, 2 * n + 1 );

  if ( n == 1 )
    a_cr(1,1:3) = 0.0;
    a_cr(2,1) = 0.0;
    a_cr(2,2) = 1.0 / a(2,1);
    a_cr(2,3) = 0.0;
    a_cr(3,1:3) = 0.0;
    return
  end
%
%  Zero out the workspace entries.
%
  a_cr(1,1) = 0.0;
  a_cr(1,2:n) = a(1,2:n);
  a_cr(1,n+1:2*n+1) = 0.0;

  a_cr(2,1) = 0.0;
  a_cr(2,2:n+1) = a(2,1:n);
  a_cr(2,n+2:2*n+1) = 0.0;

  a_cr(3,1) = 0.0;
  a_cr(3,2:n) = a(3,1:n-1);
  a_cr(3,n+1:2*n+1) = 0.0;

  il = n;
  ipntp = 0;

  while ( 1 < il )

    ipnt = ipntp;
    ipntp = ipntp + il;
    if ( mod ( il, 2 ) == 1 )
      inc = il + 1;
    else
      inc = il;
    end

    incr = floor ( inc / 2 );
    il = floor ( il / 2 );
    ihaf = ipntp + incr + 1;
    ifulp = ipnt + inc + 2;

    for ilp = incr : -1 : 1
      ifulp = ifulp - 2;
      iful = ifulp - 1;
      ihaf = ihaf - 1;
      a_cr(2,iful+1) = 1.0 / a_cr(2,iful+1);
      a_cr(3,iful+1)  = a_cr(3,iful+1)  * a_cr(2,iful+1);
      a_cr(1,ifulp+1) = a_cr(1,ifulp+1) * a_cr(2,ifulp+2);
      a_cr(2,ihaf+1)  = a_cr(2,ifulp+1) - a_cr(1,iful+1)  * a_cr(3,iful+1) ...
                                  - a_cr(1,ifulp+1) * a_cr(3,ifulp+1);
      a_cr(3,ihaf+1) = -a_cr(3,ifulp+1) * a_cr(3,ifulp+2);
      a_cr(1,ihaf+1) = -a_cr(1,ifulp+1) * a_cr(1,ifulp+2);
    end

  end

  a_cr(2,ipntp+2) = 1.0 / a_cr(2,ipntp+2);

  return
end
