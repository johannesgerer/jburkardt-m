function [ row, col, a, seed ] = wathen_st ( nx, ny, nz_num, seed )

%*****************************************************************************80
%
%% WATHEN_ST: Wathen matrix stored in sparse triplet format.
%
%  Discussion:
%
%    When dealing with sparse matrices in MATLAB, it can be much more efficient
%    to work first with a triple of I, J, and X vectors, and only once
%    they are complete, convert to MATLAB's sparse format.
%
%    The Wathen matrix is a finite element matrix which is sparse.
%
%    The entries of the matrix depend in part on a physical quantity
%    related to density.  That density is here assigned random values between
%    0 and 100.
%
%    The matrix order N is determined by the input quantities NX and NY,
%    which would usually be the number of elements in the X and Y directions.
%
%    The value of N is
%
%      N = 3*NX*NY + 2*NX + 2*NY + 1,
%
%    The matrix is the consistent mass matrix for a regular NX by NY grid
%    of 8 node serendipity elements.
%
%    The local element numbering is
%
%      3--2--1
%      |     |
%      4     8
%      |     |
%      5--6--7
%
%    Here is an illustration for NX = 3, NY = 2:
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
%      N = 3 * 3 * 2 + 2 * 2 + 2 * 3 + 1 = 29
%
%    The matrix is symmetric positive definite for any positive values of the
%    density RHO(X,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2014
%
%  Author:
%
%    Original MATLAB version by Nicholas Higham.
%    Modifications by Tim Davis.
%    Modifications by John Burkardt.
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
%    Input, integer NZ_NUM, the number of values used to describe the matrix.
%
%    Input/output, integer SEED, the random number seed.
%
%    Output, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices 
%    of the nonzero entries.
%
%    Output, real A(NZ_NUM), the nonzero values.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WATHEN_ST - Fatal error!\n' );
    fprintf ( 1, '  Not enough input.\n' );
    error ( 'WATHEN_ST - Fatal error!' );
  end

  if ( nargin < 2 )
    ny = nx;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  NY was not supplied.  Setting NY = NX = %d.\n', ny );
  end

  if ( nargin < 3 )
    nz_num = wathen_st_size ( nx, ny );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  NZ_NUM was not supplied.  NZ_NUM = %d\n', nz_num );
  end

  if ( nargin < 4 )
    seed = 123456789;
  end

  em = [
     6.0, -6.0,  2.0, -8.0,  3.0, -8.0,  2.0, -6.0;
    -6.0, 32.0, -6.0, 20.0, -8.0, 16.0, -8.0, 20.0;
     2.0, -6.0,  6.0, -6.0,  2.0, -8.0,  3.0, -8.0;
    -8.0, 20.0, -6.0, 32.0, -6.0, 20.0, -8.0, 16.0;
     3.0, -8.0,  2.0, -6.0,  6.0, -6.0,  2.0, -8.0;
    -8.0, 16.0, -8.0, 20.0, -6.0, 32.0, -6.0, 20.0;
     2.0, -8.0,  3.0, -8.0,  2.0, -6.0,  6.0, -6.0;
    -6.0, 20.0, -8.0, 16.0, -8.0, 20.0, -6.0, 32.0 ]';

  row = zeros(nz_num,1);
  col = zeros(nz_num,1);
  a = zeros(nz_num,1);

  node = zeros(8,1);

  k = 0;

  for j = 1 : ny
    for i = 1 : nx

      node(1) = 3 * j * nx + 2 * i + 2 * j + 1;
      node(2) = node(1) - 1;
      node(3) = node(2) - 1;
      node(4) = ( 3 * j - 1 ) * nx + 2 * j + i - 1;
      node(5) = 3 * ( j - 1 ) * nx + 2 * i + 2 * j - 3;
      node(6) = node(5) + 1;
      node(7) = node(6) + 1;
      node(8) = node(4) + 1;

      [ rho, seed ] = r8_uniform_01 ( seed );
      rho = 100.0 * rho;

      for krow = 1 : 8
        for kcol = 1 : 8
          k = k + 1;
          row(k) = node(krow);
          col(k) = node(kcol);
          a(k) = rho * em(krow,kcol);
        end
      end

    end
  end

  return
end

