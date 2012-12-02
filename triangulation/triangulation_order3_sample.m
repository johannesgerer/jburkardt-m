function [ seed, xd, td ] = triangulation_order3_sample ( node_num, node_xy, ...
  triangle_num, triangle_node, num_ran, seed )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_SAMPLE returns random points in a triangulation.
%
%  Discussion:
%
%    It is assumed that the triangulation consists of a set of non-overlapping
%    triangles.
%
%    The point is chosen uniformly in the area covered by the triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the node coordinates.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up the triangles.
%
%    Input, integer NUM_RAN, the number of points to sample.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer SEED, a seed for the random number generator.
%
%    Output, real XD(2,NUM_RAN), the sample points.
%
%    Output, integer TD(NUM_RAN), the triangle to which each sample point
%    belongs.
%
  dim_num = 2;
%
%  Compute the areas of the triangles.
%  Build a cumulative area vector.
%  Convert it to a relative cumulative area vector.
%
  area_cum(0+1) = 0.0;

  for i = 1 : triangle_num

    i1 = triangle_node(1,i);
    i2 = triangle_node(2,i);
    i3 = triangle_node(3,i);

    t(1:dim_num,1) = node_xy(1:dim_num,i1);
    t(1:dim_num,2) = node_xy(1:dim_num,i2);
    t(1:dim_num,3) = node_xy(1:dim_num,i3);

    area = triangle_area_2d ( t );

    area_cum(i+1) = area_cum(i-1+1) + area;

  end

  area_total = area_cum(triangle_num+1);

  area_cum(0+1:triangle_num+1) = area_cum(0+1:triangle_num+1) / area_total;
%
%  Pick random values.  A random value R indicates the corresponding triangle
%  whose cumulative relative area contains R.
%
%  Bracket the random value in the cumulative relative areas,
%  indicating a triangle.
%
%  Pick a random point in the triangle.
%
  for i = 1 : num_ran

    [ r, seed ] = r8_uniform_01 ( seed );

    [ left, right ] = r8vec_bracket ( triangle_num+1, area_cum, r );

    td(i) = right - 1;

    i1 = triangle_node(1,td(i));
    i2 = triangle_node(2,td(i));
    i3 = triangle_node(3,td(i));

    t(1:dim_num,1) = node_xy(1:dim_num,i1);
    t(1:dim_num,2) = node_xy(1:dim_num,i2);
    t(1:dim_num,3) = node_xy(1:dim_num,i3);

    [ xd(1:dim_num,i), seed ] = triangle_sample ( t, 1, seed );

  end

  return
end
