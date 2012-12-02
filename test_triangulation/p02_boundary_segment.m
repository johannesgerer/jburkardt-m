function segment = p02_boundary_segment ( segment_index, m, segment_length )

%*****************************************************************************80
%
%% P02_BOUNDARY_SEGMENT returns a boundary segment in problem 02.
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
%    Input, integer SEGMENT_INDEX, the index of the boundary segment.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer SEGMENT_LENGTH, the number of points in the segment.
%
%    Output, real SEGMENT(M,SEGMENT_LENGTH), points on the boundary segment.
%
  center = [ 0.0, 0.0 ];
  r1 = 1.0;
  r2 = 0.4;

  if ( segment_index == 1 )

    for j = 1 : segment_length
      angle = 2.0 * pi * ( j - 1 ) / ( segment_length - 1 );
      segment(1,j) = center(1) + r1 * cos ( angle );
      segment(2,j) = center(2) + r1 * sin ( angle );
    end

  elseif ( segment_index == 2 )

    for j = 1 : segment_length
      angle = 2.0 * pi * ( segment_length - j ) / ( segment_length - 1 );
      segment(1,j) = center(1) + r2 * cos ( angle );
      segment(2,j) = center(2) + r2 * sin ( angle );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P02_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P02_BOUNDARY_SEGMENT - Fatal error!' );

  end

  return
end
