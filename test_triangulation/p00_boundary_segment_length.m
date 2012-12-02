function segment_length = p00_boundary_segment_length ( test, segment_index, h )

%*****************************************************************************80
%
%% P00_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in a problem.
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
%    Input, integer SEGMENT_INDEX, the index of one of the boundary segments.
%
%    Input, real H, the suggested spacing between points.
%
%    Output, integer SEGMENT_LENGTH, the number of points in the segment.
%
  if ( test == 1 )
    segment_length = p01_boundary_segment_length ( segment_index, h );
  elseif ( test == 2 )
    segment_length = p02_boundary_segment_length ( segment_index, h );
  elseif ( test == 3 )
    segment_length = p03_boundary_segment_length ( segment_index, h );
  elseif ( test == 4 )
    segment_length = p04_boundary_segment_length ( segment_index, h );
  elseif ( test == 5 )
    segment_length = p05_boundary_segment_length ( segment_index, h );
  elseif ( test == 6 )
    segment_length = p06_boundary_segment_length ( segment_index, h );
  elseif ( test == 7 )
    segment_length = p07_boundary_segment_length ( segment_index, h );
  elseif ( test == 8 )
    segment_length = p08_boundary_segment_length ( segment_index, h );
  elseif ( test == 9 )
    segment_length = p09_boundary_segment_length ( segment_index, h );
  elseif ( test == 10 )
    segment_length = p10_boundary_segment_length ( segment_index, h );
  elseif ( test == 11 )
    segment_length = p11_boundary_segment_length ( segment_index, h );
  elseif ( test == 12 )
    segment_length = p12_boundary_segment_length ( segment_index, h );
  elseif ( test == 13 )
    segment_length = p13_boundary_segment_length ( segment_index, h );
  elseif ( test == 14 )
    segment_length = p14_boundary_segment_length ( segment_index, h );
  elseif ( test == 15 )
    segment_length = p15_boundary_segment_length ( segment_index, h );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  return
end
