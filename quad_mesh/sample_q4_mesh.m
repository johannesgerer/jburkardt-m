function [ sample_xy, sample_element, seed ] = sample_q4_mesh ( node_num, ...
  node_xy, element_num, element_node, sample_num, seed )

%*****************************************************************************80
%
%% SAMPLE_Q4_MESH returns random points in a Q4 mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), the nodes
%    that form the elements.
%
%    Input, integer SAMPLE_NUM, the number of points to sample.
%
%    Input, integer SEED, a seed for the random
%     number generator.
%
%    Output, real SAMPLE_XY(2,SAMPLE_NUM), the sample points.
%
%    Output, integer SAMPLE_ELEMENT(SAMPLE_NUM), the elements from
%    which each point was drawn.
%
%    Output, integer SEED, a seed for the random
%     number generator.
%

%
%  Compute the areas of the quadrilaterals.
%
  area_cum(0+1) = 0.0;

  for element = 1 : element_num

    i1 = element_node(1,element);
    i2 = element_node(2,element);
    i3 = element_node(3,element);
    i4 = element_node(4,element);

    quad_xy(1:2,1) = node_xy(1:2,i1);
    quad_xy(1:2,2) = node_xy(1:2,i2);
    quad_xy(1:2,3) = node_xy(1:2,i3);
    quad_xy(1:2,4) = node_xy(1:2,i4);

    area = area_quad ( quad_xy );

    area_cum(element+1) = area_cum(element-1+1) + area;

  end

  area_total = area_cum(element_num+1);

  area_cum(0+1:element_num+1) = area_cum(0+1:element_num+1) / area_total;
%
%  A random value R indicates the corresponding quadrilateral whose
%  cumulative relative area first includes the number R.
%
  for sample = 1 : sample_num

    [ r, seed ] = r8_uniform_01 ( seed );

    [ left, right ] = r8vec_bracket ( element_num + 1, area_cum, r );

    element = right - 1;

    i1 = element_node(1,element);
    i2 = element_node(2,element);
    i3 = element_node(3,element);
    i4 = element_node(4,element);

    quad_xy(1:2,1) = node_xy(1:2,i1);
    quad_xy(1:2,2) = node_xy(1:2,i2);
    quad_xy(1:2,3) = node_xy(1:2,i3);
    quad_xy(1:2,4) = node_xy(1:2,i4);

    [ sample_xy(1:2,sample), seed ] = sample_quad ( quad_xy, 1, seed );

    sample_element(sample) = element;

  end

  return
end
