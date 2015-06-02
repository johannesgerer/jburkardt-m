function n = wathen_order ( nx, ny )

%*****************************************************************************80
%
%% WATHEN_ORDER returns the order of the WATHEN matrix.
%
%  Discussion:
%
%    N = 3 * 3 * 2 + 2 * 2 + 2 * 3 + 1 = 29
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2013
%
%  Author:
%
%    John Burkardt
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
%    Input, integer NX, NY, values which determine the size of A.
%
%    Output, integer N, the order of the matrix,
%    as determined by NX and NY.
%
  n = 3 * nx * ny + 2 * nx + 2 * ny + 1;

  return
end
