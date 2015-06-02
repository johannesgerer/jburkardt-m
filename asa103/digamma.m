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
%    03 June 2013
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
  value = 0.0;
%
%  Use approximation for small argument.
%
  if ( x <= 0.00001 )
    euler_mascheroni = 0.57721566490153286060;
    value = - euler_mascheroni - 1.0 / x;
    return
  end
%
%  Reduce to DIGAMA(X + N).
%
  while ( x < 8.5 )
    value = value - 1.0 / x;
    x = x + 1.0;
  end
%
%  Use Stirling's (actually de Moivre's) expansion.
%
  r = 1.0 / x;
  value = value + log ( x ) - 0.5 * r;
  r = r * r;
  value = value ...
    - r * ( 1.0 / 12.0 ...
    - r * ( 1.0 / 120.0 ...
    - r *   1.0 / 252.0 ) );

  return
end
