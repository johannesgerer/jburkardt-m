function x = poisson_solution ( nrow, ncol, rhs_num )

%*****************************************************************************80
%
%% POISSON_SOLUTION returns the solution of a Poisson linear system.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2015
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
%    Output, real X(NROW*NCOL,RHS_NUM), the solution.
%
  n = nrow * ncol;

  x = zeros ( n, rhs_num );

  k = 0;
  for j = 1 : nrow
    for i = 1 : ncol
      k = k + 1;
      x(k,1) = i + j;
    end
  end

  return
end
