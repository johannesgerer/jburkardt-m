function r = r8sd_resid ( m, n, ndiag, offset, a, x, b )

%*****************************************************************************80
%
%% R8SD_RESID computes the residual R = B-A*X for R8SD matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer NDIAG, the number of diagonals that are stored.
%    NDIAG must be at least 1 and no more than N.
%
%    Input, integer OFFSET(NDIAG), the offsets for the diagonal
%    storage.
%
%    Input, real A(N,NDIAG), the R8SD matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Input, real B(M), the desired result A * x.
%
%    Output, real R(M), the residual R = B - A * X.
%
  r = r8sd_mv ( m, n, ndiag, offset, a, x );

  r(1:m,1) = b(1:m,1) - r(1:m,1);

  return
end

