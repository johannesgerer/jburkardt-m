function [ alpha_min, alpha_ave, alpha_area ] = alpha_measure ( n, z, ...
  triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% ALPHA_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discusion:
%
%    The ALPHA measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    This measure is naturally extended to higher dimensions, but the
%    given program can only handle DIM_NUM = 2.
%
%    We measure the minimum angle among all the triangles in the triangulated dataset.  
%    In degrees, the maximum possible value is 60.  We divide the achieved value by
%    the maximum possible value to get a quality measure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the triangulation.
%
%    Output, real ALPHA_MIN, the minimum value of ALPHA over all
%    triangles.
%
%    Output, real ALPHA_AVE, the value of ALPHA averaged over
%    all triangles.
%
%    Output, real ALPHA_AREA, the value of ALPHA averaged over
%    all triangles and weighted by area.
%
  alpha_min = r8_huge ( );
  alpha_ave = 0.0;
  alpha_area = 0.0;
  area_total = 0.0;

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    a_x = z(1,a_index);
    a_y = z(2,a_index);
    b_x = z(1,b_index);
    b_y = z(2,b_index);
    c_x = z(1,c_index);
    c_y = z(2,c_index);

    area = 0.5 * abs ( a_x * ( b_y - c_y ) ...
                     + b_x * ( c_y - a_y ) ...
                     + c_x * ( a_y - b_y ) );

    ab_len = sqrt ( ( a_x - b_x )^2 + ( a_y - b_y )^2 );
    bc_len = sqrt ( ( b_x - c_x )^2 + ( b_y - c_y )^2 );
    ca_len = sqrt ( ( c_x - a_x )^2 + ( c_y - a_y )^2 );
%
%  Take care of a ridiculous special case.
%
    if ( ab_len == 0.0 & bc_len == 0.0 & ca_len == 0.0 )
      a_angle = 2.0 * pi / 3.0;
      b_angle = 2.0 * pi / 3.0;
      c_angle = 2.0 * pi / 3.0;
    else

      if ( ca_len == 0.0 | ab_len == 0.0 )
        a_angle = pi;
      else
        a_angle = r8_acos ( ( ca_len^2 + ab_len^2 - bc_len^2 ) ...
          / ( 2.0 * ca_len * ab_len ) );
      end

      if ( ab_len == 0.0 | bc_len == 0.0 )
        b_angle = pi;
      else
        b_angle = r8_acos ( ( ab_len^2 + bc_len^2 - ca_len^2 ) ...
          / ( 2.0 * ab_len * bc_len ) );
      end

      if ( bc_len == 0.0 | ca_len == 0.0 )
        c_angle = pi;
      else
        c_angle = r8_acos ( ( bc_len^2 + ca_len^2 - ab_len^2 ) ...
          / ( 2.0 * bc_len * ca_len ) );
      end

    end

    alpha_min = min ( alpha_min, a_angle );
    alpha_min = min ( alpha_min, b_angle );
    alpha_min = min ( alpha_min, c_angle );

    alpha_ave = alpha_ave + alpha_min;

    alpha_area = alpha_area + area * alpha_min;

    area_total = area_total + area;

  end

  alpha_ave = alpha_ave / triangle_num;
  alpha_area = alpha_area / area_total;
%
%  Normalize angles from [0,pi/3] radians into qualities in [0,1].
%
  alpha_min = alpha_min * 3.0 / pi;
  alpha_ave = alpha_ave * 3.0 / pi;
  alpha_area = alpha_area * 3.0 / pi;

  return
end
