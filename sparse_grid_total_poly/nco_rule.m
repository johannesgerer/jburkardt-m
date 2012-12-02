function [ x, w ] = nco_rule ( n )

%*****************************************************************************80
%
%% NCO_RULE computes the Newton Cotes Open rule.
%
%  Discussion:
%
%    Newton Cotes Open rule on [-1,+1];
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), W(N), the points and weights.
%
  x = ( 1 : n )' / ( n + 1 );
%
%  Rescale to [-1,+1];
%
  x = 2.0 * x - 1.0;
%
%  Compute the weights.
%
  x_min = -1.0;
  x_max = 1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end

