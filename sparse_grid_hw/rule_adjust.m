function [ x, w ] = rule_adjust ( a, b, c, d, n, x, w )

%*****************************************************************************80
%
%% RULE_ADJUST adjusts a 1D quadrature rule from [A,B] to [C,D].
%
%  Discussion:
%
%    This function is only appropriate for cases involving finite intervals
%    and a uniform weighting function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the left and right endpoints of the
%    original interval.
%
%    Input, real C, D, the left and right endpoints of the
%    new interval.
%
%    Input, integer N, the order of the rule.
%    1 <= N.
%
%    Input/output, real X(N), the abscissas.
%
%    Input/output, real W(N), the weights.
%
  for i = 1 : n
    x(i) = ( ( b - x(i)     ) * c ...
           + (     x(i) - a ) * d )...
           / ( b        - a );
  end

  s = ( d - c ) / ( b - a );

  w(1:n) = s * w(1:n);

  return;
end
