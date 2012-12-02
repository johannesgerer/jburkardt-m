function p00_poly_write ( test, file_name )

%*****************************************************************************80
%
%% P00_POLY_WRITE collects data and writes it to a POLY file.
%
%  Discussion:
%
%    This routine collects information about the boundary for a given
%    problem, and writes that data to a POLY file that can be read by
%    TRIANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Input, string FILE_NAME, the name of the file to create.
%
  dim_num = 2;
%
%  Get a length scale.
%
  [ lo, hi ] = p00_box ( test, dim_num );

  scale = max ( abs ( hi(1:dim_num) - lo(1:dim_num) ) );
%
%  How many boundary segments are there?
%
  boundary_segment_num = p00_boundary_segment_num ( test );
%
%  Choose H so that we would expect to get about 100 boundary points if our
%  region were a square of any size.
%
  h = 0.04 * scale;

  node_num = 0;
  for segment_index = 1 : boundary_segment_num
    segment_length = p00_boundary_segment_length ( test, segment_index, h );
    node_num = node_num + segment_length;
  end
%
%  Now collect all the boundary nodes into one array.
%
  next = 1;

  for segment_index = 1 : boundary_segment_num

    segment_length = p00_boundary_segment_length ( test, segment_index, h );

    segment(1:dim_num,next:next+segment_length-1) = p00_boundary_segment ( ...
      test, segment_index, dim_num, segment_length );

    next = next + segment_length;

  end
%
%  How many edges are there?
%
  edge_num = 0;

  for segment_index = 1 : boundary_segment_num

    segment_length = p00_boundary_segment_length ( test, segment_index, h );

    edge_num = edge_num + segment_length - 1;

  end
%
%  Now collect the edges.
%
  e = 0;
  next = 1;

  for segment_index = 1 : boundary_segment_num

    segment_length = p00_boundary_segment_length ( test, segment_index, h );

    for j = 1 : segment_length - 1
      edge_nodes(1,e+j) = next + j - 1;
      edge_nodes(2,e+j) = next + j;
    end

    next = next + segment_length;
    e = e + segment_length - 1;

  end
%
%  Handle the holes.
%
  hole_num = p00_hole_num ( test );
  hole = zeros ( dim_num, hole_num );
  
  for hole_index = 1 : hole_num
    hole(1:dim_num,hole_index) = ( p00_hole_point ( test, hole_index, dim_num ) )';
  end
%
%  Write the POLY file.
%
  poly_write ( file_name, node_num, segment, edge_num, ...
    edge_nodes, hole_num, hole );

  return
end
