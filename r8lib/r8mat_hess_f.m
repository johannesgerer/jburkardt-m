function f = r8mat_hess_f ( n, x )

%*****************************************************************************80
%
%% R8MAT_HESS_F is a sample nonlinear function for treatment by R8MAT_HESS.
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
%    Input, integer N, the number of parameters.
%
%    Input, real X(N), the parameter values.
%
%    Output, real F, the function value.
%
  f = x(1) * x(1) + x(1) * x(2) + x(2) * cos ( 10.0 * x(3) );

  return
end
