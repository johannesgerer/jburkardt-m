function value = sin_power_int ( a, b, n )

%*****************************************************************************80
%
%% SIN_POWER_INT evaluates the sine power integral.
%
%  Discussion:
%
%    The function is defined by
%
%      SIN_POWER_INT(A,B,N) = Integral ( A <= T <= B ) ( sin ( t ))^n dt
%
%    The algorithm uses the following fact:
%
%      Integral sin^n ( t ) = (1/n) * (
%        sin^(n-1)(t) * cos(t) + ( n-1 ) * Integral sin^(n-2) ( t ) dt )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, real A, B, the limits of integration.
%
%    Input, integer N, the power of the sine function.
%
%    Output, real SIN_POWER_INT, the value of the integral.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SIN_POWER_INT - Fatal error!\n' );
    fprintf ( 1, '  Power N < 0.\n' );
    value = 0.0;
    error ( 'SIN_POWER_INT - Fatal error!' );
  end

  sa = sin ( a );
  sb = sin ( b );
  ca = cos ( a );
  cb = cos ( b );

  if ( mod ( n, 2 ) == 0 )
    value = b - a;
    mlo = 2;
  else
    value = ca - cb;
    mlo = 3;
  end

  for m = mlo : 2 : n
    value = ( ( m - 1 ) * value + sa^(m-1) * ca - sb^(m-1) * cb ) / m;
  end

  return
end
