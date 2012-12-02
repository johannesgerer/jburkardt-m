function value = p14_fudu ( lambda, u )

%*****************************************************************************80
%
%% P14_FUDU computes d F(LAMBDA,U) / d U
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
%    Output, real VALUE, the value of the derivative of the function
%    with respect to U.
%
  alpha = 0.1;

  value = - 2.0 * lambda / ( u + alpha )^3;

  return
end
