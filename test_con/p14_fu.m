function value = p14_fu ( lambda, u )

%*****************************************************************************80
%
%% P14_FU computes the auxilliary function F(LAMBDA,U).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LAMBDA, U, the arguments of the function.
%
%    Output, real VAULE, the value of the function.
%
  alpha = 0.1;

  value = 1.0 + lambda / ( u + alpha )^2;

  return
end
