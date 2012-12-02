function f2_dif = p00_f2_dif ( problem, x )

%*****************************************************************************80
%
%% P00_F2_DIF approximates the second derivative via finite differences.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, real X, the value of the variable.
%
%    Output, real F2_DIF, the approximate second derivative.
%

%
%  Choose the stepsize.
%
  epsilon = eps^0.33;

  s = epsilon * ( abs ( x ) + 1.0 );

  xi = x;

  f00 = p00_f ( problem, x );

  x = xi + s;
  fpp = p00_f ( problem, x );

  x = xi - s;
  fmm = p00_f ( problem, x );

  f2_dif = ( ( fpp - f00 ) + ( fmm - f00 ) ) / s / s;

  x = xi;

  return
end
