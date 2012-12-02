function result = qmult_3d ( func, a, b, fup1, flo1, fup2, flo2 )

%*****************************************************************************80
%
%% QMULT_3D approximates an integral with varying Y and Z dimension in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      A         <= X <= B,
%      FLO(X)    <= Y <= FHI(X),
%      FLO2(X,Y) <= Z <= FHI2(X,Y).
%
%  Discussion:
%
%    A 4096 point product of three 16 point 31-st degree Gauss-Legendre
%    quadrature formulas is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
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
%    function which evaluates F(X,Y,Z), of the form
%      function value = func ( x, y, z )
%
%    Input, real A, B, the lower and upper limits of X integration.
%
%    Input, external FUP1, FLO1, the names of the user
%    supplied functions which evaluate the upper and lower
%    limits of the Y integration, of the form
%      function value = fup1 ( x )
%      function value = flo1 ( x )
%
%    Input, external FUP2, FLO2, the names of the user
%    supplied functions which evaluate the upper and lower
%    limits of the Z integration, of the form
%      function value = fup2 ( x, y )
%      function value = flo2 ( x, y )
%
%    Output, real QMULT_3D, the approximate integral of
%    the function.
%
  norder = 16;
  [ xtab, weight ] = legendre_set ( norder );

  quad = 0.0E+00;

  for i = 1 : norder

    x = 0.5E+00 * ( b - a ) * xtab(i) + 0.5E+00 * ( b + a );
    w1 = 0.5E+00 * weight(i);
    c = feval ( flo1, x );
    d = feval ( fup1, x );

    for j = 1 : norder

      w2 = 0.5E+00 * ( d - c ) * weight(j);
      y = 0.5E+00 * ( d - c ) * xtab(j) + 0.5E+00 * ( d + c );
      e = feval ( flo2, x, y );
      f = feval ( fup2, x, y );

      for k = 1 : norder

        w3 = 0.5E+00 * ( f - e ) * weight(k);
        z = 0.5E+00 * ( f - e ) * xtab(k) + 0.5E+00 * ( f + e );
        quad = quad + w1 * w2 * w3 * feval ( func, x, y, z );

      end

    end

  end

  volume = b - a;
  result = quad * volume;

  return
end
