function result = qmult_2d ( func, a, b, fup, flo )

%*****************************************************************************80
%
%% QMULT_2D approximates an integral with varying Y dimension in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      A <= X <= B,
%      FLO(X) <= Y <= FHI(X).
%
%  Discussion:
%
%    A 256 point product of two 16 point 31-st degree Gauss-Legendre
%    quadrature formulas is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    NATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X,Y), of the form
%      function value = func ( x, y )
%
%    Input, real A, B, the lower and upper limits of X integration.
%
%    Input, external FUP, FLO, the names of the user
%    supplied functions which evaluate the upper and lower
%    limits of the Y integration, of the form
%      function value = fup(x)
%      function value = flo(x)
%
%    Output, real QMULT_2D, the approximate integral of
%    the function.
%
  norder = 16
  [ xtab, weight ] = legendre_set ( norder );

  quad = 0.0E+00;

  for i = 1 : norder

    w1 = 0.5E+00 * ( b - a ) * weight(i);
    x = 0.5E+00 * ( b - a ) * xtab(i) + 0.5E+00 * ( b + a );
    c = feval ( flo, x );
    d = feval ( fup, x );

    for j = 1 : norder

      w2 = 0.5E+00 * ( d - c ) * weight(j);
      y = 0.5E+00 * ( d - c ) * xtab(j) + 0.5E+00 * ( d + c );
      quad = quad + w1 * w2 * feval ( func, x, y );

    end

  end

  result = quad;

  return
end
