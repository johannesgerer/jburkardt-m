function segment = p03_boundary_segment ( segment_index, m, segment_length )

%*****************************************************************************80
%
%% P03_BOUNDARY_SEGMENT returns a boundary segment in problem 03.
%
%  Discussion:
%
%    For boundary segment #1, the value of SEGMENT_LENGTH should be
%    at least 5.  Values of 4*N+1 will result in an "even" mesh.
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
%    Output, SEGMENT(M,SEGMENT_LENGTH), points on the boundary segment.
%
  center = [ 0.0, 0.0 ];
  r2 = 0.4;

  if ( segment_index == 1 ) 

    n1 = round ( ( segment_length - 1 ) / 4 );
    n2 = round ( ( 2 * ( segment_length - 1 ) ) / 4 ) - n1;
    n3 = round ( ( 3 * ( segment_length - 1 ) ) / 4 ) - n1 - n2;
    n4 = segment_length - 1 - n1 - n2 - n3;

    s(1:2,1) = [ -1.0, -1.0 ]';
    s(1:2,2) = [  1.0, -1.0 ]';
    s(1:2,3) = [  1.0,  1.0 ]';
    s(1:2,4) = [ -1.0,  1.0 ]';

    j = 0;

    for i = 1 : n1
      j = j + 1;
      segment(1:2,j) = ( ( n1 - i + 1 ) * s(1:2,1)   ...
                       + (      i - 1 ) * s(1:2,2) ) ...
                       / ( n1         );
    end

    for i = 1 : n2
      j = j + 1;
      segment(1:2,j) = ( ( n2 - i + 1 ) * s(1:2,2)   ...
                       + (      i - 1 ) * s(1:2,3) ) ...
                       / ( n2         );
    end

    for i = 1 : n3
      j = j + 1;
      segment(1:2,j) = ( ( n3 - i + 1 ) * s(1:2,3)   ...
                       + (      i - 1 ) * s(1:2,4) ) ...
                       / ( n3         );
    end

    for i = 1 : n4
      j = j + 1;
      segment(1:2,j) = ( ( n4 - i + 1 ) * s(1:2,4)   ...
                       + (      i - 1 ) * s(1:2,1) ) ...
                       / ( n4         );
    end

    j = j + 1;
    segment(1:2,j) = s(1:2,1);

  elseif ( segment_index == 2 )

    for i = 1 : segment_length
      angle = 2.0 * pi * ( segment_length - i ) / ( segment_length - 1 );
      segment(1,i) = center(1) + r2 * cos ( angle );
      segment(2,i) = center(2) + r2 * sin ( angle );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P03_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P03_BOUNDARY_SEGMENT - Fatal error!' );

  end

  return
end
