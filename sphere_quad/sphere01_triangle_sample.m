function [ x, seed ] = sphere01_triangle_sample ( n, v1, v2, v3, seed )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_SAMPLE: sample points from triangle on unit sphere.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%    A spherical triangle on the surface of the unit sphere contains those
%    points with radius R = 1, bounded by the vertices V1, V2, V3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Arvo,
%    Stratified sampling of spherical triangles,
%    Computer Graphics Proceedings, Annual Conference Series,
%    ACM SIGGRAPH '95, pages 437-438, 1995.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real V1(3,1), V2(3,1), V3(3,1), the XYZ coordinates of
%    the vertices of the spherical triangle.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(3,N), the XYZ coordinates of the
%    sample points.
%
  [ a, b, c ] = sphere01_triangle_vertices_to_sides ( v1, v2, v3 );

  [ alpha, beta, gamma ] = sphere01_triangle_sides_to_angles ( a, b, c );

  area = sphere01_triangle_angles_to_area ( alpha, beta, gamma );

  for j = 1 : n
%
%  Select the new area.
%
    [ xsi1, seed ] = r8_uniform_01 ( seed );
    area_hat = xsi1 * area;
%
%  Compute the sine and cosine of the angle phi.
%
    s = sin ( area_hat - alpha );
    t = cos ( area_hat - alpha );
%
%  Compute the pair that determines beta_hat.
%
    u = t - cos ( alpha );
    v = s + sin ( alpha ) * cos ( c );
%
%  Q is the cosine of the new edge length b_hat.
%
    q = ( ( v * t - u * s ) * cos ( alpha ) - v ) ...
      / ( ( v * s + u * t ) * sin ( alpha ) );
%
%  We very occasionally get a Q value out of bounds.
%
    q = max ( q, - 1.0 );
    q = min ( q, + 1.0 );
%
%  V31 = normalized ( V3 - ( V3 dot V1 ) * V1 )
%
    w = v3' * v1;
    v31(1:3) = v3(1:3) - w * v1(1:3);
    v31(1:3) = v31(1:3) / norm ( v31 );
%
%  V4 is the third vertex of the subtriangle V1, V2, V4.
%
    v4(1:3) = q * v1(1:3) + sqrt ( 1.0 - q * q ) * v31(1:3);
%
%  Select cos theta, which will sample along the edge from V2 to V4.
%
    [ xsi2, seed ] = r8_uniform_01 ( seed );
    z = 1.0 - xsi2 * ( 1.0 - v4' * v2 );
%
%  V42 = normalized ( V4 - ( V4 dot V2 ) * V2 )
%
    w = v4 ' v2;
    v42(1:3) = v4(1:3) - w * v2(1:3)
    v42(1:3) = v42(1:3) / norm ( v42 );
%
%  Construct the point.
%
    x(1:3,j) = z * v2(1:3) + sqrt ( 1.0 - z * z ) * v42(1:3);

  end

  return
end
