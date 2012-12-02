function value = u_integral ( e )

%*****************************************************************************80
%
%% U_INTEGRAL: integral ( -1 <= x <= +1 ) x^e sqrt ( 1 - x^2 ) dx.
%
%  Discussion:
%
%     E    U_INTEGRAL
%    --    --------------  
%     0         pi /    2 
%     2         pi /    8
%     4         pi /   16
%     6     5 * pi /  128
%     8     7 * pi /  256
%    10    21 * pi / 1024
%    12    33 * pi / 2048
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer E, the exponent of X.
%    0 <= E.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( e, 2 ) == 1 )

    value = 0.0;

  else

    arg1 = 0.5 * ( 1 + e );
    arg2 = 2.0 + 0.5 * e;
    value = 0.5 * sqrt ( pi ) * gamma ( arg1 ) / gamma ( arg2 );

  end

  return
end
