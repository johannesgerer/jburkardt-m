function segment_length = p03_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P03_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 03.
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
  r2 = 0.4;

  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P03_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P03_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  if ( segment_index == 1 )

    n = round ( 8.0 / h );
    n = max ( n, 5 );
    segment_length = n + mod ( 4 - mod ( n - 1, 4 ), 4 );

  elseif ( segment_index == 2 )

    n = round ( 2.0 * pi * r2 / h );
    n = max ( n, 5 );
    segment_length = n;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P03_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P03_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );

  end

  return
end
