function result = torus_14s ( func, r1, r2 )

%*****************************************************************************80
%
%% TORUS_14S approximates an integral inside a torus in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      ( SQRT ( X**2 + Y**2 ) - R1 )**2 + Z**2 <= R2**2.
%
%  Discussion:
%
%    A 960 point 14-th degree formula is used.
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
  norder = 4;
  
  r = [ 0.263499230, 0.574464514, 0.818529487, 0.964659606 ];
  
  weight = [ 0.086963711, 0.163036289, 0.163036289, ...
    0.086963711 ];

  quad = 0.0;

  for n = 1 : 15

    angle = 2.0E+00 * pi * n / 15.0;
    cth = cos ( angle );
    sth = sin ( angle );

    for i = 1 : 16

      angle = pi * i / 8.0;
      ct = cos ( angle );
      st = sin ( angle );

      for j = 1 : norder
        u = r1 + r(j) * ct * r2;
        x = u * cth;
        y = u * sth;
        z = r(j) * st * r2;
        quad = quad + u * weight(j) * feval ( func, x, y, z ) / ( 120.0 * r1 );
      end

    end

  end

  volume = torus_volume_3d ( r1, r2 );
  result = quad * volume;

  return
end
