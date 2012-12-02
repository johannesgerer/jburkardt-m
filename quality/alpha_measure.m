function alpha = alpha_measure ( n, z, triangle_order, triangle_num, ...
  triangle_node )

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
%    08 November 2005
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
%    Output, real ALPHA_MEASURE, the ALPHA quality measure.
%
  alpha = r8_huge ( );

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
        a_angle = arc_cosine ( ( ca_len^2 + ab_len^2 - bc_len^2 ) ...
          / ( 2.0 * ca_len * ab_len ) );
      end

      if ( ab_len == 0.0 | bc_len == 0.0 )
        b_angle = pi;
      else
        b_angle = arc_cosine ( ( ab_len^2 + bc_len^2 - ca_len^2 ) ...
          / ( 2.0 * ab_len * bc_len ) );
      end

      if ( bc_len == 0.0 | ca_len == 0.0 )
        c_angle = pi;
      else
        c_angle = arc_cosine ( ( bc_len^2 + ca_len^2 - ab_len^2 ) ...
          / ( 2.0 * bc_len * ca_len ) );
      end

    end

    alpha = min ( alpha, a_angle );
    alpha = min ( alpha, b_angle );
    alpha = min ( alpha, c_angle );

  end
%
%  Convert to a quality measure in [0,1].
%
  alpha = alpha * 3.0 / pi;

  return
end
