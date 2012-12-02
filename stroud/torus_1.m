function result = torus_1 ( func, r1, r2, n )

%*****************************************************************************80
%
%% TORUS_1 approximates an integral on the surface of a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X**2 + Y**2 ) - R1 )**2 + Z**2 = R2**2.
%
%  Discussion:
%
%    An (N+1)*(N+2) point N-th degree formula is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
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
%    Input, integer N, defines the degree of the formula
%    used to approximate the integral.
%
%    Output, real RESULT, the approximate integral of the function.
%
  w = 1.0E+00 / ( r1 * ( ( n + 1 ) * ( n + 2 ) ) );
  quad = 0.0E+00;

  for i = 1 : n+1

    angle = 2.0E+00 * pi * i / ( n + 1 );
    ct1 = cos ( angle );
    st1 = sin ( angle );

    for j = 1 : n+2

      angle = 2.0E+00 * pi * j / ( n + 2 );
      u = r1 + r2 * cos ( angle );
      x = u * ct1;
      y = u * st1;
      z = r2 * sin ( angle );

      quad = quad + w * u * feval ( func, x, y, z );

    end

  end

  volume = torus_area_3d ( r1, r2 );
  result = quad * volume;

  return
end
