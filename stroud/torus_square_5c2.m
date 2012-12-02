function result = torus_square_5c2 ( func, r1, r2 )

%*****************************************************************************80
%
%% TORUS_SQUARE_5C2 approximates an integral in a "square" torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      R1 - R2 <= SQRT ( X**2 + Y**2 ) <= R1 + R2,
%      -R2 <= Z <= R2.
%
%  Discussion:
%
%    A 24 point 5-th degree formula is used, Stroud number TOR3-C2:5-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
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
%    function of three variables which is to be integrated,
%    of the form:
%      function value = func ( x, y, z )
%
%    Input, real R1, the primary radius of the torus.
%
%    Input, real R2, one-half the length of a side of the
%    square cross-section.
%
%    Output, real RESULT, the approximate integral of the function.
%
  b1 = 5.0 / 108.0;
  b2 = 4.0 / 108.0;
  quad = 0.0;

  u1 = sqrt ( r1 * r1 + r2 * r2 );

  v = r2 * sqrt ( 0.6 );

  u2 = sqrt ( r1 * r1 - sqrt ( 3.0 ) * r1 * r2 + r2 * r2 );

  u3 = sqrt ( r1 * r1 + sqrt ( 3.0 ) * r1 * r2 + r2 * r2 );

  for i = 1 : 6

    cs = cos ( i * pi / 3.0 );
    sn = sin ( i * pi / 3.0 );

    x = u1 * cs;
    y = u1 * sn;
    z = v;
    quad = quad + b1 * feval ( func, x, y, z );

    z = -v;
    quad = quad + b1 * feval ( func, x, y, z );

    x = u2 * cs;
    y = u2 * sn;
    z = 0.0;
    quad = quad + b2 * feval ( func, x, y, z );

    x = u3 * cs;
    y = u3 * sn;
    z = 0.0;
    quad = quad + b2 * feval ( func, x, y, z );

  end

  volume = torus_square_volume_3d ( r1, r2 );
  result = quad * volume;

  return
end
