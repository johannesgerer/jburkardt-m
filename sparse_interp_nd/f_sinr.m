function z = f_sinr ( m, n, x )

%*****************************************************************************80
%
%% F_SINR is a scalar function of an M-dimensional argument, to be interpolated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the points.
%
%    Output, real Z(N,1), the value of the function at each point.
%
  r = zeros ( n, 1 );
  for j = 1 : n
    r(j,1) = norm ( x(1:m,j) );
  end

  z = sin ( r );

  return
end
