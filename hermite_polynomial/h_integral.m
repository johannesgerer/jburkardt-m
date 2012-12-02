function value = h_integral ( n )

%*****************************************************************************80
%
%% H_INTEGRAL evaluates a monomial physicist's Hermite integral for H(n,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the integral.
%    0 <= N.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( n, 2 ) == 1 )

    value = 0.0;

  else

    value = r8_factorial2 ( n - 1 ) * sqrt ( pi ) / 2.0^( n / 2 );

  end

  return
end
