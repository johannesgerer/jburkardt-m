function segment_length = p07_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P07_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 07.
%
%  Discussion:
%
%    No attempt has been made here to accurately compute a value of N
%    which would guarantee that the boundary would be divided into pieces
%    of length no more than H.  The curve is a little too complicated
%    to make this easy to do.
%
%    Moreover, the points that will be generated will only be equally
%    spaced in their X argument, not in their arc length.
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
  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P07_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P07_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end

  if ( segment_index == 1 )

    n = round ( 10.0 * pi / h );
    n = max ( n, 13 );
    segment_length = n;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P07_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P07_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );

  end

  return
end
