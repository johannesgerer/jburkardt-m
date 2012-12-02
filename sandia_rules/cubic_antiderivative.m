function g = cubic_antiderivative ( x )

%*****************************************************************************80
%
%% CUBIC_ANTIDERIVATIVE evaluates the antiderivative function of a cubic.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2011.
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real G, the value.
%
  g = x .* x .* ( 5.0 + x .* ( - 7.0 / 3.0 + x .* 1.0 / 4.0 ) );

  return
end
