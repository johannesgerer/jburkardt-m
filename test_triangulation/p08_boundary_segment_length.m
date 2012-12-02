function segment_length = p08_boundary_segment_length ( segment_index, h )

%*****************************************************************************80
%
%% P08_BOUNDARY_SEGMENT_LENGTH returns boundary segment lengths in problem 08.
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
  r2 = 0.1;
  theta1 = pi / 12.0;

  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P08_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive H = %f\n', h );
    error ( 'P08_BOUNDARY_SEGMENT_LENGTH - Fatal error!' )
  end
  
  if ( segment_index == 1 )

    a = ( sqrt ( 119.0 ) - 9.0 ) / 20.0;
    theta2 = atan2 ( a, a + 0.9 );

    n = round ( ( 2.0 + 2.0 * ( theta1 - theta2 ) ...
      + 2.0 * a * sqrt ( 2.0 ) ) / h );

    n = max ( n, 21 );
    segment_length = n;

  elseif ( segment_index == 2 )

    n = round ( 2.0 * pi * r2 / h );
    n = max ( n, 5 );
    segment_length = n;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P08_BOUNDARY_SEGMENT_LENGTH - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P08_BOUNDARY_SEGMENT_LENGTH - Fatal error!' )
  end

  return
end
