function value = p18_gpu ( u, lambda )

%*****************************************************************************80
%
%% P18_GPU evaluates d G ( T, U, LAMBDA ) / dU.
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
%    Input, real U, LAMBDA, the arguments of the function.
%
%    Output, real VALUE, the derivative of the function with
%    respect to U.
%
  beta = 20.0;
  ca = 1.0E+06;
  cb = 1.0E+07;
  ua = 0.0;
  ub = 25.0;

  value = lambda * lambda * beta * ( ...
     - ca * exp ( lambda * beta * ( lambda * ua - u ) ) ...
     - cb * exp ( lambda * beta * ( u - lambda * ub ) ) );

  return
end
