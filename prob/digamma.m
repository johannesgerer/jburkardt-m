function value = digamma ( x )

%*****************************************************************************80
%
%% DIGAMMA calculates the digamma or Psi function = d ( LOG ( GAMMA ( X ) ) ) / dX
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    J Bernardo,
%    Psi ( Digamma ) Function,
%    Algorithm AS 103,
%    Applied Statistics,
%    Volume 25, Number 3, pages 315-317, 1976.
%
%  Parameters:
%
%    Input, real X, the argument of the digamma function.
%    0 < X.
%
%    Output, real VALUE, the value of the digamma function at X.
%
  c = 8.5;
  d1 = -0.5772156649;
  s = 0.00001;
  s3 = 0.08333333333;
  s4 = 0.0083333333333;
  s5 = 0.003968253968;
%
%  The argument must be positive.
%
  if ( x <= 0.0 )

    value = 0.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIGAMMA - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'DIGAMMA - Fatal error!' );
%
%  Use approximation if argument <= S.
%
  elseif ( x <= s )

    value = d1 - 1.0 / x;
%
%  Reduce the argument to DIGAMMA(X + N) where C <= (X + N).
%
  else

    value = 0.0;
    y = x;

    while ( y < c )
      value = value - 1.0 / y;
      y = y + 1.0;
    end
%
%  Use Stirling's (actually de Moivre's) expansion if C < argument.
%
    r = 1.0 / ( y * y );
    value = value + log ( y ) - 0.5 / y - r * ( s3 - r * ( s4 - r * s5 ) );

  end

  return
end
