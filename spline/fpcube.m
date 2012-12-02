function yp = fpcube ( x )

%*****************************************************************************80
%
%% FPCUBE sets the derivative of the cubic function.
%
%  Discussion:
%
%    Y(X) = ( ( X + 2 ) * X + 3 ) * X + 4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real YP, the value of the derivative of the cubic function.
%
  yp = ( 3.0E+00 * x + 4.0E+00 ) * x + 3.0E+00;

  return
end
