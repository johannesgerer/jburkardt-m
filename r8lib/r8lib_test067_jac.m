function fprime = subpak_test067_jac ( m, n, x )

%*****************************************************************************80
%
%% SUBPAK_TEST067_JAC is the exact jacobian of SUBPAK_TEST067_F.
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
%    Output, real FPRIME(M,N), the jacobian values.
%
  fprime(1,1) = cos ( x(1) * x(2) ) * x(2);
  fprime(1,2) = cos ( x(1) * x(2) ) * x(1);
  fprime(1,3) = 0.0;
  fprime(1,4) = 0.0;

  fprime(2,1) = x(1) / sqrt ( 1.0 + x(1) * x(1) );
  fprime(2,2) = 0.0;
  fprime(2,3) = 1.0;
  fprime(2,4) = 0.0;

  fprime(3,1) = 1.0;
  fprime(3,2) = 2.0;
  fprime(3,3) = 3.0;
  fprime(3,4) = 4.0;

  return
end
