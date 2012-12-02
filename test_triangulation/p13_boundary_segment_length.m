function segment_length = p13_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P13_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 13.
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
    fprintf ( 1, 'P13_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P13_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  angle = acos ( 5.0 / 40.0 );

  arc_length = ...
      30.0 * pi ...
    + 10.0 ...
    + 40.0 * angle ...
    + 90.0 - 40.0 * sin ( angle ) ...
    + 10.0 ...
    + 90.0 - 40.0 * sin ( angle ) ...
    + 40.0 * angle ...
    + 10.0;

  n = round ( arc_length / h );
  n = max ( n, 8 );

  segment_length = n;

  return
end
