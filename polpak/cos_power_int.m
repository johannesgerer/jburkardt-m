function value = cos_power_int ( a, b, n )

%*****************************************************************************80
%
%% COS_POWER_INT evaluates the cosine power integral.
%
%  Discussion:
%
%    The function is defined by
%
%      COS_POWER_INT(A,B,N) = Integral ( A <= T <= B ) ( cos ( t ))^n dt
%
%    The algorithm uses the following fact:
%
%      Integral cos^n ( t ) = -(1/n) * (
%        cos^(n-1)(t) * sin(t) + ( n-1 ) * Integral cos^(n-2) ( t ) dt )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2012
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
    fprintf ( 1, 'COS_POWER_INT - Fatal error!\n' );
    fprintf ( 1, '  Power N < 0.\n' );
    value = 0.0;
    error ( 'COS_POWER_INT - Fatal error!' );
  end

  sa = sin ( a );
  sb = sin ( b );
  ca = cos ( a );
  cb = cos ( b );

  if ( mod ( n, 2 ) == 0 )
    value = b - a;
    mlo = 2;
  else
    value = sb - sa;
    mlo = 3;
  end

  for m = mlo : 2 : n
    value = ( ( m - 1 ) * value - ca^(m-1) * sa + cb^(m-1) * sb ) / m;
  end

  return
end
