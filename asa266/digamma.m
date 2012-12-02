function [ value, ifault ] = digamma ( x )

%*****************************************************************************80
%
%% DIGAMMA calculates DIGAMMA ( X ) = d ( LOG ( GAMMA ( X ) ) ) / dX
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Jose Bernardo.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jose Bernardo,
%    Algorithm AS 103:
%    Psi ( Digamma ) Function,
%    Applied Statistics,
%    Volume 25, Number 3, 1976, pages 315-317.
%
%  Parameters:
%
%    Input, real X, the argument of the digamma function.
%    0 < X.
%
%    Output, real DIGAMMA, the value of the digamma function at X.
%
%    Output, integer IFAULT, error flag.
%    0, no error.
%    1, X <= 0.
%
  c = 8.5;
  d1 = -0.5772156649;
  s = 0.00001;
  s3 = 0.08333333333;
  s4 = 0.0083333333333;
  s5 = 0.003968253968;
%
%  Check the input.
%
  if ( x <= 0.0 )
    value = 0.0;
    ifault = 1;
    return
  end
%
%  Initialize.
%
  ifault = 0;
  y = x;
  value = 0.0;
%
%  Use approximation if argument <= S.
%
  if ( y <= s )
    value = d1 - 1.0 / y;
    return
  end
%
%  Reduce to DIGAMA(X + N) where (X + N) >= C.
%
  while ( y < c )
    value = value - 1.0 / y;
    y = y + 1.0;
  end
%
%  Use Stirling's (actually de Moivre's) expansion if argument > C.
%
  r = 1.0 / y;
  value = value + log ( y ) - 0.5 * r;
  r = r * r;
  value = value - r * ( s3 - r * ( s4 - r * s5 ) );

  return
end
