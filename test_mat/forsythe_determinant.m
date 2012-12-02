function determ = forsythe_determinant ( alpha, beta, n )

%*****************************************************************************80
%
%% FORSYTHE_DETERMINANT returns the determinant of the FORSYTHE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, define the matrix.  A typical 
%    value of ALPHA is the square root of the machine precision; a typical
%    value of BETA is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  d = ( abs ( alpha ) )^( 1.0 / n );

  determ = 1.0;

  if ( mod ( n, 2 ) == 1 )

    for i = 1 : floor ( ( n - 1 ) / 2 )

      angle = 2 * i * pi / n;
      c = cos ( angle );
      s = sin ( angle );

      determ = determ * ( ( beta + d * c )^2 + ( d * s )^2 );

    end

    determ = determ * ( beta + d );

  elseif ( mod ( n, 2 ) == 0 )

    for i = 1 : floor ( ( n / 2 ) - 1 )

      angle = 2 * i * pi / n;
      c = cos ( angle );
      s = sin ( angle );

      determ = determ * ( ( beta + d * c )^2 + ( d * s )^2 );

    end

    determ = determ * ( beta^2 - d^2 );

  end

  return
end
