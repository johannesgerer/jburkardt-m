function [ xtab, weight ] = legendre_compute ( norder )

%*****************************************************************************80
%
%% LEGENDRE_COMPUTE computes a Gauss-Legendre quadrature rule.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function is w(x) = 1.0.
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= NORDER ) WEIGHT(I) * F ( XTAB(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2005
%
%  Author:
%
%    Original FORTRAN77 version by Philip Davis, Philip Rabinowitz.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer NORDER, the order of the rule.
%    NORDER must be greater than 0.
%
%    Output, real XTAB(NORDER), the abscissas of the rule.
%
%    Output, real WEIGHT(NORDER), the weights of the rule.
%    The weights are positive, symmetric, and should sum to 2.
%
  if ( norder < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of NORDER = %d\n', norder );
    error ( 'LEGENDRE_COM - Fatal error!' );
  end

  e1 = norder * ( norder + 1 );

  m = floor ( ( norder + 1 ) / 2 );

  for i = 1 : floor ( ( norder + 1 ) / 2 )

    mp1mi = m + 1 - i;

    t = ( 4 * i - 1 ) * pi / ( 4 * norder + 2 );

    x0 = cos(t) * ( 1.0 - ( 1.0 - 1.0 / ( norder ) ) / ( 8 * norder * norder ) );

    pkm1 = 1.0;
    pk = x0;

    for k = 2 : norder
      pkp1 = 2.0 * x0 * pk - pkm1 - ( x0 * pk - pkm1 ) / k;
      pkm1 = pk;
      pk = pkp1;
    end

    d1 = norder * ( pkm1 - x0 * pk );

    dpn = d1 / ( 1.0 - x0 * x0 );

    d2pn = ( 2.0 * x0 * dpn - e1 * pk ) / ( 1.0 - x0 * x0 );

    d3pn = ( 4.0 * x0 * d2pn + ( 2.0 - e1 ) * dpn ) / ( 1.0 - x0 * x0 );

    d4pn = ( 6.0 * x0 * d3pn + ( 6.0 - e1 ) * d2pn ) / ( 1.0 - x0 * x0 );

    u = pk / dpn;
    v = d2pn / dpn;
%
%  Initial approximation H:
%
    h = - u * ( 1.0 + 0.5 * u * ( v + u * ( v * v - d3pn / ( 3.0 * dpn ) ) ) );
%
%  Refine H using one step of Newton's method:
%
    p = pk + h * ( dpn + 0.5 * h * ( d2pn + h / 3.0 ...
      * ( d3pn + 0.25 * h * d4pn ) ) );

    dp = dpn + h * ( d2pn + 0.5 * h * ( d3pn + h * d4pn / 3.0 ) );

    h = h - p / dp;

    xtemp = x0 + h;

    xtab(mp1mi) = xtemp;

    fx = d1 - h * e1 * ( pk + 0.5 * h * ( dpn + h / 3.0 ...
      * ( d2pn + 0.25 * h * ( d3pn + 0.2 * h * d4pn ) ) ) );

    weight(mp1mi) = 2.0 * ( 1.0 - xtemp * xtemp ) / fx / fx;

  end

  if ( mod ( norder, 2 ) == 1 )
    xtab(1) = 0.0;
  end
%
%  Shift the data up.
%
  nmove = floor ( ( norder + 1 ) / 2 );
  ncopy = norder - nmove;

  for i = 1 : nmove
    iback = norder + 1 - i;
    xtab(iback) = xtab(iback-ncopy);
    weight(iback) = weight(iback-ncopy);
  end
%
%  Reflect values for the negative abscissas.
%
  for i = 1 : norder - nmove
    xtab(i) = - xtab(norder+1-i);
    weight(i) = weight(norder+1-i);
  end

  return
end
