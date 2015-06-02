function x = rodman_eigen_right ( n, alpha )

%*****************************************************************************80
%
%% RODMAN_EIGEN_RIGHT returns the right eigenvectors of the RODMAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real X(N,N), the right eigenvectors.
%
  x = zeros ( n, n );

  for j = 1 : n - 1
    x(  1,j) = +1.0;
    x(j+1,j) = -1.0;
  end

  j = n;
  x(1:n,j) = 1.0;

  return
end
