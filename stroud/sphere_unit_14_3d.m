function result = sphere_unit_14_3d ( func )

%*****************************************************************************80
%
%% SPHERE_UNIT_14_3D approximates an integral on the surface of the unit sphere in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 = 1.
%
%  Discussion:
%
%    A 72 point 14-th degree formula is used, Stroud number U3:14-1.
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
%    A D McLaren,
%    Mathematics of Computation,
%    Volume 17, pages 361-383, 1963.
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
  xtab = [ ...
    -0.151108275E+00, 0.315838353E+00, 0.346307112E+00, -0.101808787E+00, ...
    -0.409228403E+00 ];
  ytab = [ ...
    0.155240600E+00, 0.257049387E+00, 0.666277790E+00,  0.817386065E+00, ...
    0.501547712E+00 ];
  ztab = [ ...
    0.976251323E+00, 0.913330032E+00, 0.660412970E+00,  0.567022920E+00, ...
    0.762221757E+00 ];

  quad = 0.0;

  w1 = 125.0E+00 / 10080.0E+00;
  x = 0.525731112E+00;
  y = 0.850650808E+00;
  z = 0.0E+00;

  for i = 1 : 2
    x = -x;
    for j = 1 : 2
      y = -y;
      for k = 1 : 3
        [ x, y, z ] = r8_swap3 ( x, y, z );
        quad = quad + w1 * feval ( func, x, y, z );
      end
    end
  end

  w2 = 143.0E+00 / 10080.0E+00;

  for i = 1 : 5

    x = xtab(i);
    y = ytab(i);
    z = ztab(i);

    for j = 1 : 3

      temp = x;
      x = z;
      z = -y;
      y = -temp;

      for k = 1 : 3
        [ x, y, z ] = r8_swap3 ( x, y, z );
        quad = quad + w2 * feval ( func, x, y, z );
      end

      y = -y;
      z = -z;
      quad = quad + w2 * feval ( func, x, y, z );

    end

  end

  volume = sphere_unit_area_3d ( );
  result = quad * volume;

  return
end
