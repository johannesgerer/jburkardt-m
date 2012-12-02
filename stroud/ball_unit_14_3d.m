function result = ball_unit_14_3d ( func )

%*****************************************************************************80
%
%% BALL_UNIT_14_3D approximates an integral inside the unit ball in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 <= 1.
%
%  Discussion:
%
%    A 288 point 14-th degree formula is used, Stroud number S3:14-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 November 2004
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
  r = [ 0.968160240E+00, 0.836031107E+00, 0.613371433E+00, 0.324253423E+00 ];
  weight = [ 0.076181268E+00, 0.126263673E+00, 0.098048133E+00, 0.032840260E+00 ];
  xtab = [ ...
    -0.151108275E+00, 0.315838353E+00, 0.346307112E+00, ...
    -0.101808787E+00, -0.409228403E+00 ];
  ytab = [ ...
    0.155240600E+00, 0.257049387E+00, 0.666277790E+00, ...
    0.817386065E+00, 0.501547712E+00 ];
  ztab = [ ...
    0.976251323E+00, 0.913330032E+00, 0.660412970E+00, ...
    0.567022920E+00, 0.762221757E+00 ];

  quad = 0.0;

  for m = 1 : 4

    w1 = 125.0 * weight(m) / 3360.0;
    x = 0.525731112 * r(m);
    y = 0.850650808 * r(m);
    z = 0.0;

    for j = 1 : 2
      x = -x;
      for k = 1 : 2
        y = -y;
        for l = 1 : 3
          [ x, y, z ] = r8_swap3 ( x, y, z );
          quad = quad + w1 * feval ( func, x, y, z );
        end
      end
    end

    w2 = 143.0 * weight(m) / 3360.0;

    for n = 1 : 5

      x = xtab(n) * r(m);
      y = ytab(n) * r(m);
      z = ztab(n) * r(m);

      for i = 1 : 3

        temp = x;
        x = z;
        z = -y;
        y = -temp;

        for j = 1 : 3

          [ x, y, z ] = r8_swap3 ( x, y, z );

          quad = quad + w2 * feval ( func, x, y, z );

        end

        y = -y;
        z = -z;
        quad = quad + w2 * feval ( func, x, y, z );

      end

    end

  end

  volume = ball_unit_volume_3d  ( );
  result = quad * volume;

  return
end
