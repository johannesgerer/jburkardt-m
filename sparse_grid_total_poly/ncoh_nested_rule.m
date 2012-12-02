function [ x, w ] = ncoh_nested_rule ( n )

%*****************************************************************************80
%
%% NCOH_NESTED_RULE computes the nested Newton Cotes Open Half rule.
%
%  Discussion:
%
%    Nested version of Newton Cotes Open Half rule on [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
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

%
%  Get N equally spaced points that do not include [ 0, 1];
%
  num = vdc_numerator_sequence ( n );
  num = 2 * num - 1;

  den = 2 ^ ( i4_log_2 ( n ) + 2 ) - 2;

  x = num / den;
%
%  Linear transformation from [0,1] to [-1,+1].
%
  x = 2.0 * x - 1.0;
%
%  Compute the weights.
%
  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end

