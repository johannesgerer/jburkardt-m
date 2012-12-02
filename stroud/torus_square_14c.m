function result = torus_square_14c ( func, r1, r2 )

%*****************************************************************************80
%
%% TORUS_SQUARE_14C approximates an integral in a "square" torus in 3D.
%
%  Discussion:
%
%    A 14-th degree 960 point formula is used.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      R1 - R2 <= SQRT ( X**2 + Y**2 ) <= R1 + R2,
%       -R2 <= Z <= R2.
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
%    function of three variables which is to be integrated, of the form:
%      function value = func ( x, y, z )
%
%    Input, real R1, R2, the radii that define the torus.
%
%    Output, real RESULT, the approximate integral of the function.
%
  norder = 8;

  [ rtab, weight ] = legendre_set ( norder );

  w = 1.0E+00 / ( 60.0E+00 * r1 );
  quad = 0.0E+00;

  for n = 1 : 15

    angle = 2.0E+00 * pi * n / 15.0E+00;
    cth = cos ( angle );
    sth = sin ( angle );

    for i = 1 : norder

      u = r1 + rtab(i) * r2;
      x = u * cth;
      y = u * sth;

      for j = 1 : norder
        z = rtab(j) * r2;
        quad = quad + u * w * weight(i) * weight(j) * feval ( func, x, y, z );
      end

    end

  end

  volume = torus_square_volume_3d ( r1, r2 );
  result = quad * volume;

  return
end
