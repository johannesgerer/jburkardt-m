function segment_length = p12_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P12_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEGMENT_INDEX, the index of one of the boundary segments.
%
%    Input, real H, the suggested spacing between points.
%
%    Output, integer SEGMENT_LENGTH, the number of points in the segment.
%
  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P12_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P12_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  if ( segment_index == 1 )

    n = round ( 5.75 / h );
    n = max ( n, 5 );
    segment_length = n + mod ( 4 - mod ( n - 1, 4 ), 4 );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P12_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P12_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );

  end

  return
end
