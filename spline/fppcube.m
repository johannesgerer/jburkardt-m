function ypp = fppcube ( x )

%*****************************************************************************80
%
%% FPPCUBE sets the value of the second derivative of the cubic function.
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
%    Output, real YPP, the value of the second derivative of the cubic function.
%
  ypp = 6.0E+00 * x + 4.0E+00;

  return
end
