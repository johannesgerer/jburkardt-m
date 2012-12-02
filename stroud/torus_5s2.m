function result = torus_5s2 ( func, r1, r2 )

%*****************************************************************************80
%
%% TORUS_5S2 approximates an integral inside a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X**2 + Y**2 ) - R1 )**2 + Z**2 <= R2**2.
%
%  Discussion:
%
%    A 24 point, 5-th degree formula is used, Stroud number TOR3-S2:5-1.
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
%    Arthur H Stroud,
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
  w = 1.0 / 24.0;

  quad = 0.0;

  u1 = sqrt ( r1 * r1 + 0.5 * r2 * r2 );
  u2 = sqrt ( r1 * r1 + sqrt ( 2.0 ) * r1 * r2 + r2 * r2 );
  u3 = sqrt ( r1 * r1 - sqrt ( 2.0 ) * r1 * r2 + r2 * r2 );

  for i = 1 : 6

    angle = pi * i / 3.0;
    cs = cos ( angle );
    sn = sin ( angle );

    x = u1 * cs;
    y = u1 * sn;
    z = r2 / sqrt ( 2.0 );
    quad = quad + w * feval ( func, x, y, z );

    x = u1 * cs;
    y = u1 * sn;
    z = -r2 / sqrt ( 2.0 );
    quad = quad + w * feval ( func, x, y, z );

    x = u2 * cs;
    y = u2 * sn;
    z = 0.0;
    quad = quad + w * feval ( func, x, y, z );

    x = u3 * cs;
    y = u3 * sn;
    z = 0.0;
    quad = quad + w * feval ( func, x, y, z );

  end

  volume = torus_volume_3d ( r1, r2 );
  result = quad * volume;

  return
end
