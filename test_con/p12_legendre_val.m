function [ pl, pld ] = p12_legendre_val ( t, dtdx, npolys )

%*****************************************************************************80
%
%% P12_LEGENDRE_VAL evaluates the Legendre polynomials and derivatives.
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
%    Input, real T, the argument of the Legendre polynomials, in
%    the normalized interval [-1,1].
%
%    Input, real DTDX, the value of the quantity dTdX at the point
%    X.  In the most common case, this is simply the relationship
%    between the width of the normalized T interval (2), and the
%    width of the X interval to which the Legendre polynomial
%    arguments have been mapped.  DTDX is needed so that the
%    computed values PLD can be converted from dPL/dT to dPL/dX.
%
%    Input, integer NPOLYS, the number of Legendre polynomials to
%    evaluate.  If NPOLYS is 1, then only the constant polynomial
%    is evaluated,  NPOLYS = 2 means the constant and linear, and so on.
%
%    Output, real PL(NPOLYS), PLD(NPOLYS), the values of PL(X)
%    and dPL(X)/dX at the point X which has normalized coordinate T.
%
  if ( 1 <= npolys )
    pl(1) = 1.0;
    pld(1) = 0.0;
  end

  if ( 2 <= npolys )
    pl(2) = t;
    pld(2) = 1.0;
  end

  a = 0.0;
  for i = 3 : npolys

    a = a + 1.0;

    pl(i) = ( ( 2.0 * a + 1.0 ) * t * pl(i-1) - a * pl(i-2) ) / ( a + 1.0 );

    pld(i) = ( ( 2.0 * a + 1.0 ) * ( t * pld(i-1) + pl(i-1) ) ...
           - a * pld(i-2) ) / ( a + 1.0 );

  end

  pld(1:npolys) = dtdx * pld(1:npolys);

  return
end
