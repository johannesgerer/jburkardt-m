function [ x, w ] = ncc_nested_rule ( n, x_min, x_max )

%*****************************************************************************80
%
%% NCC_NESTED_RULE computes the nested Newton Cotes Closed rule.
%
%  Discussion:
%
%    Nested version of Newton Cotes Closed rule on [-1,+1].
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
%  Get N equally spaced points that, in general, include [ 0, 1];
%
  if ( n == 1 )
    x = 0.5;
  elseif ( n == 2 )
    x = [ 0.5, 0.0 ];
  elseif ( n == 3 )
    x = [ 0.5, 0.0, 1.0 ];
  else
    x = vdc_sequence ( n - 2 );
    x(4:n) = x(2:n-2);
    x(2) = 0.0;
    x(3) = 1.0;
  end
%
%  Linear transformation from [0,1] to [-1,+1].
%
  x = 2.0 * x - 1.0;
%
%  Compute weights.
%
  x_min = -1.0;
  x_max = +1.0;

  w = nc_compute ( n, x_min, x_max, x );

  return
end
