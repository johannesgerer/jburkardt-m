function result = torus_6s2 ( func, r1, r2, result )

%*****************************************************************************80
%
%% TORUS_6S2 approximates an integral inside a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X**2 + Y**2 ) - R1 )**2 + Z**2 <= R2**2.
%
%  Discussion:
%
%    An 84 point 6-th degree formula is used, Stroud number TOR3-S2:6-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function of three variables which is to be integrated,
%    of the form:
%      function value = func ( x, y, z )
%
%    Input, real R1, R2, the two radii that define the torus.
%
%    Output, real RESULT, the approximate integral of the function.
%
  norder = 2;
  s = [ 0.322914992E+00, 0.644171310E+00 ];
  weight = [ 0.387077796E+00, 0.165609800E+00 ];

  w = 1.0E+00 / ( 7.0E+00 * r1 * pi );

  quad = 0.0E+00;

  for n = 1 : 7

    u = 0.5E+00 * sqrt ( 3.0E+00 ) * r2;
    cth = cos ( 2.0E+00 * pi * n / 7.0E+00 );
    sth = sin ( 2.0E+00 * pi * n / 7.0E+00 );

    for i = 1 : 2

      u = -u;

      x = ( r1 + u ) * cth;
      y = ( r1 + u ) * sth;
      z = 0.0E+00;
      quad = quad + 0.232710567E+00 * w * ( r1 + u ) * feval ( func, x, y, z );

      x = r1 * cth;
      y = r1 * sth;
      z = u;
      quad = quad + 0.232710567E+00 * w * r1 * feval ( func, x, y, z );

    end

    for k = 1 : norder

      u = s(k) * r2;
      v = u;

      for i = 1 : 2

        u = -u;

        for j = 1 : 2

          v = -v;

          x = ( r1 + u ) * cth;
          y = ( r1 + u ) * sth;
          z = v;
          quad = quad + weight(k) * w * ( r1 + u ) * feval ( func, x, y, z );

        end
      end
    end
  end

  volume = torus_volume_3d ( r1, r2 );
  result = quad * volume;

  return
end
