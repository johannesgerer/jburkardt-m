function f = subpak_test067_f ( m, n, x )

%*****************************************************************************80
%
%% SUBPAK_TEST067_F is a sample nonlinear function for treatment by R8MAT_JAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of functions.
%
%    Input, integer N, the number of parameters.
%
%    Input, real X(N), the parameter values.
%
%    Output, real F(M), the function values.
%
  f(1) = sin ( x(1) * x(2) );
  f(2) = sqrt ( 1.0 + x(1) * x(1) ) + x(3);
  f(3) = x(1) + 2.0 * x(2) + 3.0 * x(3) + 4.0 * x(4);

  return
end
