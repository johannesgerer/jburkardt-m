function result = sphere_unit_15_3d ( func )

%*****************************************************************************80
%
%% SPHERE_UNIT_15_3D approximates surface integrals on the unit sphere in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      X**2 + Y**2 + Z**2 = 1.
%
%  Discussion:
%
%    A 128 point 15-th degree spherical product Gauss formula is used.
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
  norder = 8;

  [ xtab, weight ] = legendre_set ( norder );

  weight(1:norder) = weight(1:norder) / 32.0E+00;

  quad = 0.0E+00;

  for j = 1 : norder

    for k = 1 : 16

      angle = k * pi / 8.0E+00;
      x = sqrt ( 1.0E+00 - xtab(j)^2 ) * cos ( angle );
      y = sqrt ( 1.0E+00 - xtab(j)^2 ) * sin ( angle );
      z = xtab(j);

      quad = quad + weight(j) * feval ( func, x, y, z );

    end
  end

  volume = sphere_unit_area_3d ( );
  result = quad * volume;

  return
end
