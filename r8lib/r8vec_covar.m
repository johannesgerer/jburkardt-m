function value = r8vec_covar ( n, x, y )

%*****************************************************************************80
%
%% R8VEC_COVAR computes the covariance of two vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2013
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the dimension of the two vectors.
%
%    Input, real X(N), Y(N), the two vectors.
%
%    Output, real VALUE, the covariance of the two vectors.
%
  x_average = sum ( x(1:n) ) / n;
  y_average = sum ( y(1:n) ) / n;
  
  value = 0.0;
  for i = 1 : n
    value = value + ( x(i) - x_average ) * ( y(i) - y_average );
  end

  value = value / ( n - 1 );

  return
end
