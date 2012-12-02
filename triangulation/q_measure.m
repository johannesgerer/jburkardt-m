function [ q_min, q_max, q_ave, q_area ] = q_measure ( n, z, triangle_order, ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% Q_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discussion:
%
%    The Q measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    For a single triangle T, the value of Q(T) is defined as follows:
%
%      TAU_IN = radius of the inscribed circle,
%      TAU_OUT = radius of the circumscribed circle,
%
%      Q(T) = 2 * TAU_IN / TAU_OUT
%        = ( B + C - A ) * ( C + A - B ) * ( A + B - C ) / ( A * B * C )
%
%    where A, B and C are the lengths of the sides of the triangle T.
%
%    The Q measure computes the value of Q(T) for every triangle T in the
%    triangulation, and then computes the standard deviation of this
%    set of values:
%
%      Q_MEASURE = min ( all T in triangulation ) Q(T)
%
%    In an ideally regular mesh, all triangles would have the same
%    equilateral shape, for which Q = 1.  In a good mesh, 0.5 < Q.
%
%    Given the 2D coordinates of a set of N nodes, stored as Z(1:2,1:N),
%    a triangulation is a list of NT triples of node indices that form
%    triangles.  Generally, a maximal triangulation is expected, namely,
%    a triangulation whose image is a planar graph, but for which the
%    addition of any new triangle would mean the graph was no longer planar.
%    A Delaunay triangulation is a maximal triangulation which maximizes
%    the minimum angle that occurs in any triangle.
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
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, pages 329-345, June 2004.
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
%    Output, real ( kind = 8 ) Q_MIN, Q_MAX, the minimum and maximum values
%    of Q over all triangles.
%
%    Output, real ( kind = 8 ) Q_AVE, the average value of Q.
%
%    Output, real ( kind = 8 ) Q_AREA, the average value of Q, weighted by
%    the area of each triangle.
%
  q_min = r8_huge ( );
  q_max = - r8_huge ( );
  q_ave = 0.0;
  q_area = 0.0;
  area_total = 0.0;

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    ab_length = sqrt ( ...
        ( z(1,a_index) - z(1,b_index) )^2 ...
      + ( z(2,a_index) - z(2,b_index) )^2 );

    bc_length = sqrt ( ...
        ( z(1,b_index) - z(1,c_index) )^2 ...
      + ( z(2,b_index) - z(2,c_index) )^2 );

    ca_length = sqrt ( ...
        ( z(1,c_index) - z(1,a_index) )^2 ...
      + ( z(2,c_index) - z(2,a_index) )^2 );

    q = ( bc_length + ca_length - ab_length ) ...
      * ( ca_length + ab_length - bc_length ) ...
      * ( ab_length + bc_length - ca_length ) ...
      / ( ab_length * bc_length * ca_length );

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                     + x2 * ( y3 - y1 ) ...
                     + x3 * ( y1 - y2 ) );

    q_min = min ( q_min, q );
    q_max = max ( q_max, q );
    q_ave = q_ave + q;
    q_area = q_area + q * area;

    area_total = area_total + area;

  end

  q_ave = q_ave / triangle_num;

  if ( 0.0 < area_total )
    q_area = q_area / area_total;
  else
    q_area = 0.0;
  end

  return
end
