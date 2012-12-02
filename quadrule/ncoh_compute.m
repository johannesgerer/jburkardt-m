function [ x, w ] = ncoh_compute ( n )

%*****************************************************************************80
%
%% NCOH_COMPUTE computes a Newton-Cotes "open half" quadrature rule.
%
%  Discussion:
%
%    The input value N is used to define N equal subintervals of [-1,+1].
%    The I-th abscissa is the center of the I-th subinterval.
%
%    The integral:
%
%      Integral ( X_MIN <= X <= X_MAX ) F(X) dx
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
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
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );

  x_min = -1.0;
  x_max =  1.0;

  for i = 1 : n
    x(i) = ( ( 2 * n - 2 * i + 1 ) * x_min   ...
           + (         2 * i - 1 ) * x_max ) ...
           / ( 2 * n             );
  end

  w = nc_compute ( n, x_min, x_max, x );

  return
end
