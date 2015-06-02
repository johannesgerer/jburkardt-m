function nz_num = wathen_st_size ( nx, ny )

%*****************************************************************************80
%
%% WATHEN_ST_SIZE: Size of Wathen matrix stored in sparse triplet format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2014
%
%  Author:
%
%    John Burkardt.
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
%    Volume 7, Number 4, October 1987, pages 449-457.
%
%  Parameters:
%
%    Input, integer NX, NY, values which determine the size of the matrix.
%
%    Output, integer NZ_NUM, the number of items of data used to describe
%    the matrix.
%
  nz_num = nx * ny * 64;

  return
end

