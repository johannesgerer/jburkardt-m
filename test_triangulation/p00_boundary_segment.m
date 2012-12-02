function segment = p00_boundary_segment ( test, segment_index, m, segment_length )

%*****************************************************************************80
%
%% P00_BOUNDARY_SEGMENT returns a boundary segment in a problem.
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
%    Input, integer SEGMENT_INDEX, the index of the segment.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer SEGMENT_LENGTH, the number of points in the segment.
%
%    Output, real SEGMENT(M,SEGMENT_LENGTH), points on the boundary segment.
%
  if ( test == 1 )
    segment = p01_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 2 )
    segment = p02_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 3 )
    segment = p03_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 4 )
    segment = p04_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 5 )
    segment = p05_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 6 )
    segment = p06_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 7 )
    segment = p07_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 8 )
    segment = p08_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 9 )
    segment = p09_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 10 )
    segment = p10_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 11 )
    segment = p11_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 12 )
    segment = p12_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 13 )
    segment = p13_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 14 )
    segment = p14_boundary_segment ( segment_index, m, segment_length );
  elseif ( test == 15 )
    segment = p15_boundary_segment ( segment_index, m, segment_length );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_BOUNDARY_SEGMENT - Fatal error!' );
  end

  return
end
