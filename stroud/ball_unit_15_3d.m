function result = ball_unit_15_3d ( func )

%*****************************************************************************80
%
%% BALL_UNIT_15_3D approximates an integral inside the unit ball in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 <= 1.
%
%  Discussion:
%
%    A 512 point 15-th degree formula is used.
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
  norder1 = 4;
  norder2 = 8;

  weight1 = [ ...
    0.0328402599E+00, 0.0980481327E+00, 0.1262636728E+00, 0.0761812678E+00 ];
  xtab1 = [ ...
    0.3242534234E+00, 0.6133714327E+00, 0.8360311073E+00, 0.9681602395E+00 ];

  [ xtab2, weight2 ] = legendre_set ( norder2 );

  w = 3.0E+00 / 32.0E+00;

  quad = 0.0E+00;

  for i = 1 : norder1

    for j = 1 : norder2

      sj = xtab2(j);
      cj = sqrt ( 1.0E+00 - sj^2 );

      for k = 1 : 16
        sk = sin ( k * pi / 8.0E+00 );
        ck = cos ( k * pi / 8.0E+00 );
        x = xtab1(i) * cj * ck;
        y = xtab1(i) * cj * sk;
        z = xtab1(i) * sj;
        quad = quad + w * weight1(i) * weight2(j) * feval ( func, x, y, z );
      end

    end

  end

  volume = ball_unit_volume_3d ( );
  result = quad * volume;

  return
end
