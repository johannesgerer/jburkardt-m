function segment_length = p04_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P04_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 04.
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
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, integer SEGMENT_INDEX, the index of one of the boundary segments.
%
%    Input, real H, the suggested spacing between points.
%
%    Output, integer SEGMENT_LENGTH, the number of points in the segment.
%
  r1 = 1.0;
  r2 = 0.5;

  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P04_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P04_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  if ( segment_index == 1 )

    n = round ( 6.0 * r1 / h );
    n = max ( n, 7 );
    segment_length = n + mod ( 6 - mod ( n - 1, 6 ), 6 );

  elseif ( segment_index == 2 )

    n = round ( 6.0 * r2 / h );
    n = max ( n, 7 );
    segment_length = n + mod ( 6 - mod ( n - 1, 6 ), 6 );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P04_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P04_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );

  end

  return
end
