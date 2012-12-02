function segment = p04_boundary_segment ( segment_index, m, segment_length )

%*****************************************************************************80
%
%% P04_BOUNDARY_SEGMENT returns a boundary segment in problem 04.
%
%  Discussion:
%
%    SEGMENT_LENGTH should be no less than 7, and good values will
%    have the form 6*N+1.
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
  r1 = 1.0;
  r2 = 0.5;

  if ( segment_index == 1 )

    n1 = round ( ( segment_length - 1 ) / 6 );
    n2 = round ( ( 2 * ( segment_length - 1 ) ) / 6 ) - n1;
    n3 = round ( ( 3 * ( segment_length - 1 ) ) / 6 ) - n1 - n2;
    n4 = round ( ( 4 * ( segment_length - 1 ) ) / 6 ) - n1 - n2 - n3;
    n5 = round ( ( 5 * ( segment_length - 1 ) ) / 6 ) - n1 - n2 - n3 - n4;
    n6 = segment_length - 1 - n1 - n2 - n3 - n4 - n5;

    for j = 1 : 6
      angle = ( 2 * ( j - 1 ) ) * pi / 6.0;
      s(1,j) = r1 * cos ( angle );
      s(2,j) = r1 * sin ( angle );
    end

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
                       + (      i - 1 ) * s(1:2,5) ) ...
                       / ( n4         );
    end

    for i = 1 : n5
      j = j + 1;
      segment(1:2,j) = ( ( n5 - i + 1 ) * s(1:2,5)   ...
                       + (      i - 1 ) * s(1:2,6) ) ...
                       / ( n5         );
    end

    for i = 1 : n6
      j = j + 1;
      segment(1:2,j) = ( ( n6 - i + 1 ) * s(1:2,6)   ...
                       + (      i - 1 ) * s(1:2,1) ) ...
                       / ( n6         );
    end

    j = j + 1;
    segment(1:2,j) = s(1:2,1);

  elseif ( segment_index == 2 )

    n1 = round ( ( segment_length - 1 ) / 6 );
    n2 = round ( ( 2 * ( segment_length - 1 ) ) / 6 ) - n1;
    n3 = round ( ( 3 * ( segment_length - 1 ) ) / 6 ) - n1 - n2;
    n4 = round ( ( 4 * ( segment_length - 1 ) ) / 6 ) - n1 - n2 - n3;
    n5 = round ( ( 5 * ( segment_length - 1 ) ) / 6 ) - n1 - n2 - n3 - n4;
    n6 = segment_length - 1 - n1 - n2 - n3 - n4 - n5;

    for j = 1 : 6
      angle = ( 2 * ( 6 - j ) + 1 ) * pi / 6.0;
      s(1,j) = r2 * cos ( angle );
      s(2,j) = r2 * sin ( angle );
    end

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
                       + (      i - 1 ) * s(1:2,5) ) ...
                       / ( n4         );
    end

    for i = 1 : n5
      j = j + 1;
      segment(1:2,j) = ( ( n5 - i + 1 ) * s(1:2,5)   ...
                       + (      i - 1 ) * s(1:2,6) ) ...
                       / ( n5         );
    end

    for i = 1 : n6
      j = j + 1;
      segment(1:2,j) = ( ( n6 - i + 1 ) * s(1:2,6)   ...
                       + (      i - 1 ) * s(1:2,1) ) ...
                       / ( n6         );
    end

    j = j + 1;
    segment(1:2,j) = s(1:2,1);

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P04_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P04_BOUNDARY_SEGMENT - Fatal error!' );

  end

  return
end
