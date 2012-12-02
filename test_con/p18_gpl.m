function value = p18_gpl ( t, u, lambda )

%*****************************************************************************80
%
%% P18_GPL evaluates d G ( T, U, LAMBDA ) / d LAMBDA.
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
%    Input, real T, U, LAMBDA, the arguments of the function.
%
%    Output, real VALUE, the derivative of the function with
%    respect to LAMBDA.
%
  beta = 20.0;
  ca = 1.0E+06;
  cb = 1.0E+07;
  ua = 0.0;
  ub = 25.0;

  if ( t <= 0.0 )
    ht = - ca;
  else
    ht = cb;
  end

  e1 = exp ( lambda * beta * ( lambda * ua - u ) );
  e2 = exp ( lambda * beta * ( u - lambda * ub ) );

  value = ht + ca * e1 - cb * e2 + lambda * ...
       ( ca * beta * ( 2.0 * lambda * ua - u ) * e1 ...
       - cb * beta * ( u - 2.0 * lambda * ub ) * e2 );

  return
end
