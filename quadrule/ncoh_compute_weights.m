function w = ncoh_compute_weights ( n )

%*****************************************************************************80
%
%% NCOH_COMPUTE_WEIGHTS computes weights for a Newton-Cotes "open half" quadrature rule.
%
%  Discussion:
%
%    The input value N is used to define N equal subintervals of [-1,+1].
%    The I-th abscissa is the center of the I-th subinterval.
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
%    Output, real W(N), the weights.
%
  x = ncoh_compute_points ( n );

  w = nc_compute ( n, x_min, x_max, x );

  return
end
