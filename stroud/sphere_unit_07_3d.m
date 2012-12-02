function result = sphere_unit_07_3d ( func )

%*****************************************************************************80
%
%% SPHERE_UNIT_07_3D approximates surface integrals on the unit sphere in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 = 1.
%
%  Discussion:
%
%    A 32 point 7-th degree formula is used.
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
  norder1 = 2;
  norder2 = 4;
  norder3 = 4;
%
%  Set XTAB1 and WATE1.
%
  xtab1(1) = -1.0E+00;
  xtab1(2) =  1.0E+00;
  weight1(1) = 1.0E+00;
  weight1(2) = 1.0E+00;
%
%  Set XTAB2 and WATE2.
%
  for j = 1 : norder2
    angle = pi * ( 2 * j - 1 ) / ( 2 * norder2 );
    xtab2(j) = cos ( angle );
  end

  weight2(1:norder2) = 1.0E+00 / ( 4 * norder2 );
%
%  Set XTAB3 and WATE3.
%
  [ xtab3, weight3 ] = legendre_set ( norder3 );

  quad = 0.0E+00;
  for i = 1 : norder1
    for j = 1 : norder2
      for k = 1 : norder3

        x = xtab1(i) * sqrt ( 1.0E+00 - xtab2(j)^2 ) ...
                     * sqrt ( 1.0E+00 - xtab3(k)^2 );
        y = xtab1(i) * xtab2(j) * sqrt ( 1.0E+00 - xtab3(k)^2 );
        z = xtab1(i) * xtab3(k);

        quad = quad + weight1(i) * weight2(j) * weight3(k) ...
          * feval ( func, x, y, z );

      end
    end
  end

  volume = sphere_unit_area_3d ( );
  result = quad * volume;

  return
end
