function [ l, d, u ] = wathen_bandwidth ( nx, ny )

%*****************************************************************************80
%
%% WATHEN_BANDWIDTH returns the bandwidth of the WATHEN matrix.
%
%  Discussion:
%
%    The bandwidth measures the minimal number of contiguous diagonals,
%    including the central diagonal, which contain all the nonzero elements
%    of a matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2014
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
%    Output, integer L, D, U, the lower, diagonal, and upper bandwidths 
%    of the matrix,
%
  l = 3 * nx + 4;
  d = 1;
  u = 3 * nx + 4;

  return
end
