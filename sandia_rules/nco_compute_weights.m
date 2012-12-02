function w = nco_compute_weights ( n )

%*****************************************************************************80
%
%% NCO_COMPUTE_WEIGHTS: weights for a Newton-Cotes Open quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real W(N), the weights.
%
  w = zeros ( n, 1 );

  x_min = -1.0;
  x_max = +1.0;

  x = nco_compute_points ( n );

  w = nc_compute ( n, x_min, x_max, x );

  return
end
