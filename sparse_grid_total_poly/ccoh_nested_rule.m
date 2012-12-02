function [ x, w ] = ccoh_nested_rule ( n )

%*****************************************************************************80
%
%% CCOH_NESTED_RULE computes the nested Clenshaw Curtis Open Half rule.
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
%  Apply the Chebyshev transformation from [0,1] to [-1,+1].
%
  x = cos ( x * pi );
%
%  Get the weights.
%
  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end

