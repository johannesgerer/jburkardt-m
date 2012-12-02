function [ f, d, s, t ] = cubic_value ( x )

%*****************************************************************************80
%
%% CUBIC_VALUE evaluates a cubic function.
%
%  Discussion:
%
%    f(x) =   x^3 -  7 x^2 + 10 x
%    d(x) = 3 x^2 - 14 x   + 10
%    s(x) = 6 x   - 14
%    t(x) = 6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real F, D, S, T, the value and first three derivatives of
%    the cubic function.
%

%
%  If X is a vector, force it to be a column vector.
%
  x = x ( : );

  f = 0.0 + x .* ( 10.0 + x .* (  - 7.0 + x * 1.0 ) );
  d =              10.0 + x .* ( - 14.0 + x * 3.0 );
  s =                            - 14.0 + x * 6.0;
  t =                                         6.0;

  return
end
