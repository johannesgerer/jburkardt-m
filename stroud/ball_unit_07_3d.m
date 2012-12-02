function result = ball_unit_07_3d ( func )

%*****************************************************************************80
%
%% BALL_UNIT_07_3D approximates an integral inside the unit ball in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 <= 1.
%
%  Discussion:
%
%    A 64 point 7-th degree formula is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
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
%    Output, real RESULT, the approximate integral of the function.
%
  norder = 4;
%
%  This is the 5 point Gauss-Legendre rule,
%  but with the midpoint deleted, and with different weights.
%
  xtab1(1:4) = [...
    -0.906179845938663992797626878299E+00, ...
    -0.538469310105683091036314420700E+00, ...
     0.538469310105683091036314420700E+00, ...
     0.906179845938663992797626878299E+00 ];

  weight1(1:4) = [ ...
    0.19455533421780251826E+00, ...
    0.13877799911553081506E+00, ...
    0.13877799911553081506E+00, ...
    0.19455533421780251826E+00 ];
%
%  Set XTAB2 and WEIGHT2.
%
  for j = 1 : norder
    angle = pi * ( 2 * j - 1 ) / ( 2 * norder );
    xtab2(j) = cos ( angle );
  end

  weight2(1:norder) = 1.0E+00;
%
%  Set XTAB3 and WEIGHT3 for the interval [-1,1].
%
  [ xtab3, weight3 ] = legendre_set ( norder );

  w = 3.0E+00 / 16.0E+00;

  quad = 0.0E+00;

  for i = 1 : norder
    for j = 1 : norder
      for k = 1 : norder

        x = xtab1(i) * sqrt ( 1.0E+00 - xtab2(j)^2 ) ...
                     * sqrt ( 1.0E+00 - xtab3(k)^2 );
        y = xtab1(i) * xtab2(j) * sqrt ( 1.0E+00 - xtab3(k)^2 );
        z = xtab1(i) * xtab3(k);

        quad = quad + w * weight1(i) * weight2(j) * weight3(k) ...
          * feval ( func, x, y, z );

      end
    end
  end

  volume = ball_unit_volume_3d ( );
  result = quad * volume;

  return
end
