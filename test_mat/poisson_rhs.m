function b = poisson_rhs ( nrow, ncol, rhs_num )

%*****************************************************************************80
%
%% POISSON_RHS returns the right hand side of a Poisson linear system.
%
%  Discussion:
%
%    The Poisson matrix is associated with an NROW by NCOL rectangular
%    grid of points.
%
%    Assume that the points are numbered from left to right, bottom to top.
%
%    If the K-th point is in row I and column J, set X = I + J.
%
%    This will be the solution to the linear system.
%
%    The right hand side is easily determined from X.  It is 0 for every
%    interior point.
%
%  Example:
%
%    NROW = 3, NCOL = 3
%
%    ^
%    |  7  8  9
%    J  4  5  6
%    |  1  2  3
%    |
%    +-----I---->
%
%    Solution vector X = ( 2, 3, 4, 3, 4, 5, 4, 5, 6 )
%
%    Right hand side B = ( 2, 2, 8, 2, 0, 6, 8, 6, 14 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations, second edition,
%    Johns Hopkins University Press, Baltimore, Maryland, 1989
%    (Section 4.5.4).
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns
%    in the grid.
%
%    Input, integer RHS_NUM, the number of right hand sides.
%
%    Output, real B(NROW*NCOL,RHS_NUM), the right hand side.
%
  n = nrow * ncol;

  b = zeros ( n, rhs_num );

  k = 0;
  for j = 1 : nrow
    for i = 1 : ncol
      k = k + 1;
      b(k,1) = 0.0;
      if ( i == 1 )
        b(k,1) = b(k,1) + i + j - 1;
      end
      if ( j == 1 )
        b(k,1) = b(k,1) + i + j - 1;
      end
      if ( i == ncol )
        b(k,1) = b(k,1) + i + j + 1;
      end
      if ( j == nrow )
        b(k,1) = b(k,1) + i + j + 1;
      end
    end
  end

  return
end
