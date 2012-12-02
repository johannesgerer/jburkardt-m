function value = p18_gx ( t, u, lambda )

%*****************************************************************************80
%
%% P18_GX evaluates the auxilliary function G ( T, U, LAMBDA ).
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
%    Output, real VALUE, the value of the function.
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

  value = lambda * ( ht + ca * exp ( lambda * beta * ( lambda * ua - u ) ) ...
                        - cb * exp ( lambda * beta * ( u - lambda * ub ) ) );

  return
end
