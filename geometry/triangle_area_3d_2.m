function area = triangle_area_3d_2 ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_3D_2 computes the area of a triangle in 3D.
%
%  Discussion:
%
%    This routine computes the area "the hard way".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  dim_num = 3;
%
%  Find the projection of (P3-P1) onto (P2-P1).
%
  dot = ( t(1,2) - t(1,1) ) * ( t(1,3) - t(1,1) ) ...
      + ( t(2,2) - t(2,1) ) * ( t(2,3) - t(2,1) ) ...
      + ( t(3,2) - t(3,1) ) * ( t(3,3) - t(3,1) );
%
%  Find the length of (P2-P1).
%
  base = sqrt ( ( t(1,2) - t(1,1) )^2 ...
              + ( t(2,2) - t(2,1) )^2 ...
              + ( t(3,2) - t(3,1) )^2 );
%
%  The height of the triangle is the length of (P3-P1) after its
%  projection onto (P2-P1) has been subtracted.
%
  if ( base == 0.0 )

    height = 0.0;

  else

    alpha = dot / ( base * base );

    height = sqrt ( ...
        ( t(1,1) + alpha * ( t(1,2) - t(1,1) ) - t(1,3) )^2 ...
      + ( t(2,1) + alpha * ( t(2,2) - t(2,1) ) - t(2,3) )^2 ...
      + ( t(3,1) + alpha * ( t(3,2) - t(3,1) ) - t(3,3) )^2 );

  end

  area = 0.5 * base * height;

  return
end
