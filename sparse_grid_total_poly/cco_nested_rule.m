function [ x, w ] = cco_nested_rule ( n )

%*****************************************************************************80
%
%% CCO_NESTED_RULE computes the nested Clenshaw Curtis Open rule.
%
%  Discussion:
%
%    Nested version of Clenshaw Curtis Open rule on [-1,+1].
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
%  Get nested, equally spaced values in [0,1].
%
  x = vdc_sequence ( n );
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

