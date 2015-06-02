function h = r8mat_hess_exact ( n, x )

%*****************************************************************************80
%
%% R8MAT_HESS_EXACT is the exact Hessian of R8MAT_HESS_F.
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
%    Output, real H(N,N), the Hessian values.
%
  h(1,1) = 2.0;
  h(1,2) = 1.0;
  h(1,3) = 0.0;

  h(2,1) = 1.0;
  h(2,2) = 0.0;
  h(2,3) = - 10.0 * sin ( 10.0 * x(3) );

  h(3,1) = 0.0;
  h(3,2) = - 10.0 * sin ( 10.0 * x(3) );
  h(3,3) = - 100.0 * x(2) * cos ( 10.0 * x(3) );

  return
end
