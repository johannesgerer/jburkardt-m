function a = dif2 ( n )

%*****************************************************************************80
%
%% DIF2 returns the -1/2/-1 tridiagonal matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = - 1.0 * diag ( ones ( n - 1, 1 ), - 1 ) ...
      + 2.0 * diag ( ones ( n,     1 ),   0 ) ...
      - 1.0 * diag ( ones ( n - 1, 1 ), + 1 );

  return
end
