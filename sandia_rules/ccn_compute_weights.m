function w = ccn_compute_weights ( n )

%*****************************************************************************80
%
%% CCN_COMPUTE_WEIGHTS: weights for nested Clenshaw Curtis rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
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
  x = ccn_compute_points ( n );
%
%  Get the weights.
%
  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end
