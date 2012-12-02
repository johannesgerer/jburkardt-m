function segment_length = p05_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P05_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 05.
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
  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 = 1.00;
  r2 = 0.55;

  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P05_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P05_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );
  end
  
  if ( segment_index == 1 )

    n = round ( ( pi * ( r1  + r2 ) ...
      + ( ( center2(1) - r2 ) - ( center1(1) - r1 ) ) ...
      + ( ( center1(1) + r1 ) - ( center2(1) + r2 ) ) ) / h );
    n = max ( n, 21 );
    segment_length = n;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P05_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P05_BOUNDARY_SEGMENT_LENGTH - Fatal error!' );

  end

  return
end
