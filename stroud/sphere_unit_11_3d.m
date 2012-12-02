function result = sphere_unit_11_3d ( func )

%*****************************************************************************80
%
%% SPHERE_UNIT_11_3D approximates surface integrals on the unit sphere in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 = 1.
%
%  Discussion:
%
%    A 50 point 11-th degree formula is used, Stroud number U3:11-1.
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
  quad = 0.0E+00;

  w1 = 9216.0E+00 / 725760.0E+00;
  x = 1.0E+00;
  y = 0.0E+00;
  z = 0.0;
  for i = 1 : 2
    x = -x;
    for j = 1 : 3
      [ x, y, z ] = r8_swap3 ( x, y, z );
      quad = quad + w1 * feval ( func, x, y, z );
    end
  end

  w2 = 16384.0E+00 / 725760.0E+00;
  x = sqrt ( 0.5E+00 );
  y = sqrt ( 0.5E+00 );
  z = 0.0E+00;
  for i = 1 : 2
    x = -x;
    for j = 1 : 2
      y = -y;
      for k = 1 : 3
        [ x, y, z ] = r8_swap3 ( x, y, z );
        quad = quad + w2 * feval ( func, x, y, z );
      end
    end
  end

  w3 = 15309.0E+00 / 725760.0E+00;
  x = sqrt ( 1.0E+00 / 3.0E+00 );
  y = sqrt ( 1.0E+00 / 3.0E+00 );
  z = sqrt ( 1.0E+00 / 3.0E+00 );
  for i = 1 : 2
    x = -x;
    for j = 1 : 2
      y = -y;
      for k = 1 : 2
        z = -z;
        quad = quad + w3 * feval ( func, x, y, z );
      end
    end
  end

  w4 = 14641.0E+00 / 725760.0E+00;
  x = sqrt ( 1.0E+00 / 11.0E+00 );
  y = sqrt ( 1.0E+00 / 11.0E+00 );
  z = 3.0E+00 * sqrt ( 1.0E+00 / 11.0E+00 );
  for i = 1 : 2
    x = -x;
    for j = 1 : 2
      y = -y;
      for k = 1 : 2
        z = -z;
        for l = 1 : 3
          [ x, y, z ] = r8_swap3 ( x, y, z );
          quad = quad + w4 * feval ( func, x, y, z );
        end
      end
    end
  end

  volume = sphere_unit_area_3d ( );
  result = quad * volume;

  return
end
