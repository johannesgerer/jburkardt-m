function area = sphere_polygon_area_3d ( n, lat, lon )

%*****************************************************************************80
%
%% SPHERE_POLYGON_AREA_3D returns the area of a spherical polygon in 3d.
%
%  Discussion:
%
%    The area of the spherical polygon is returned in spherical degrees.
%
%    For a spherical polygon with N sides, the "spherical excess" is
%
%      E = sum ( interior angles ) - ( n - 2 ) * pi / 2.
%
%    The (normalized) area of a spherical polygon is equal to
%    the spherical excess E.  The standard area is E * r**2.
%
%    The code was revised in accordance with suggestions in Carvalho and
%    Cavalcanti.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2010
%
%  Author:
%
%    Robert Miller
%
%  Reference:
%
%    Paulo Cezar Pinto Carvalho and Paulo Roma Cavalcanti,
%    Point in Polyhedron Testing Using Spherical Polygons,
%    Graphics Gems, Volume V,
%    Edited by Alan Paeth,
%    Academic Press, 1995, T385.G6975.
%
%    Robert Miller,
%    Computing the Area of a Spherical Polygon,
%    Graphics Gems, Volume IV, pages 132-138,
%    Edited by Paul Heckbert,
%    Academic Press, 1994, T385.G6974.
%
%    Eric Weisstein,
%    "Spherical Polygon",
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 1999.
%
%  Parameters:
%
%    Input, integer N, the number of vertices.
%
%    Input, real LAT[N], LON[N], the latitudes and longitudes
%    of the vertices of the spherical polygon.
%
%    Output, real AREA, the area of the spherical polygon, measured in 
%    spherical radians.
%
  pi_half = 1.5707963267948966192313;

  area = 0.0;

  for j = 1 : n + 1

    if ( j == 1 )
      lam1 = lon(j);
      beta1 = lat(j);
      lam2 = lon(j+1);
      beta2 = lat(j+1);
      cos_b1 = cos ( beta1 );
      cos_b2 = cos ( beta2 );
    else
      k = mod ( j + 1, n + 1 )
      lam1 = lam2;
      beta1 = beta2;
      lam2 = lon(k);
      beta2 = lat(k);
      cos_b1 = cos_b2;
      cos_b2 = cos ( beta2 );
    end

    if ( lam1 ~= lam2 )

      hav_a = haversine ( beta2 - beta1 ) ...
        + cos_b1 * cos_b2 * haversine ( lam2 - lam1 );

      a = 2.0 * asin ( sqrt ( hav_a ) );

      b = pi_half - beta2;
      c = pi_half - beta1;
      s = 0.5 * ( a + b + c );
%
%  Given the three sides of a spherical triangle, we can use a formula
%  to find the spherical excess.
%
      t = tan ( s / 2.0 ) * tan ( ( s - a ) / 2.0 ) 
        * tan ( ( s - b ) / 2.0 ) * tan ( ( s - c ) / 2.0 );

      excess = abs ( 4.0 * atan ( sqrt ( abs ( t ) ) ) );

      if ( lam1 < lam2 )
        lam = lam2 - lam1;
      else
        lam = lam2 - lam1 + 4.0 * pi_half;
      end

      if ( 2.0 * pi_half < lam )
        excess = -excess;
      end

      area = area + excess;

    end

  end

  area = abs ( area );

  return
end
