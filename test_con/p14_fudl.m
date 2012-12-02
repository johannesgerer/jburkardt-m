function value = p14_fudl ( u )

%*****************************************************************************80
%
%% P14_FUDL computes d F(LAMBDA,U) / d LAMBDA.
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
%    Input, real U, the argument of the function.
%
%    Output, real VALUE, the value of the derivative of the function
%    with respect to LAMBDA.
%
  alpha = 0.1;

  value = 1.0 / ( u + alpha )^2;

  return
end
