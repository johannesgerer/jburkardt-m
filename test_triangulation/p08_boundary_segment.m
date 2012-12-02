function segment = p08_boundary_segment ( segment_index, m, segment_length )

%*****************************************************************************80
%
%% P08_BOUNDARY_SEGMENT returns a boundary segment in problem 08.
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
%    Output, real SEGMENT(M,SEGMENT_LENGTH), the 
%    points that make up the boundary segment.
%
  c1 = [ 0.0, 0.0 ];
  c2 = [ 0.6, 0.0 ];
  r1 = 1.0;
  r2 = 0.1;
  theta1 = pi / 12.0;
%
%  Segment 1: the outer boundary.
%
  if ( segment_index == 1 )

    a = ( sqrt ( 119.0 ) - 9.0 ) / 20.0;
    theta2 = atan2 ( a, a + 0.9 );
%
%  Work out the appropriate segment lengths, and then
%  adjust N6, if necessary, to account for roundoff.
%
    n1 = round ( ( segment_length - 1 ) / ( 2.0 + 2.0 * ( theta1 - theta2 ) ...
              + 2.0 * a * sqrt ( 2.0 ) ) );
    n2 = round ( ( theta1 - theta2 ) * n1 );
    n3 = round (    a * sqrt ( 2.0 ) * n1 );

    n2 = max ( n2, 1 );
    n3 = max ( n3, 1 );

    n4 = n3;
    n5 = n2;
    n6 = round ( ( segment_length - 1 - n2 - n3 - n4 - n5 ) / 2 );
    n1 = segment_length - 1 - n2 - n3 - n4 - n5 - n6;

    j = 0;

    s(1:2) = [ 0.0, 0.0 ];
 %
 %  A special ninny feature of MATLAB means I can't write this
 %  as a vector assignment.  Why?
 %
    t(1) =  cos ( theta1 );
    t(2) = -sin ( theta1 );

    for i = 1 : n1
      j = j + 1;
      segment(1:2,j) = ( ( n1 - i + 1 ) * s(1:2)   ...
                       + (      i - 1 ) * t(1:2) )' ...
                       / ( n1         );
    end

    for i = 1 : n2

      theta = ( - ( n2 - i + 1 ) * theta1   ...
                - (      i - 1 ) * theta2 ) ...
              /   ( n2         );

      j = j + 1;
%
%  Ninny MATLAB error strikes again.
%
      segment(1,j) = cos ( theta );
      segment(2,j) = sin ( theta );
    end
%
%  Ninny MATLAB at it again.
%
    s(1) = cos ( theta2 );
    s(2) = -sin ( theta2 );
    t(1:2) = [ 0.9, 0.0 ];

    for i = 1 : n3
      j = j + 1;
      segment(1:2,j) = ( ( n3 - i + 1 ) * s(1:2)   ...
                       + (      i - 1 ) * t(1:2) )' ...
                       / ( n3         );
    end

    s(1:2) = [ 0.9, 0.0 ];
  %
  %  Ninny MATLAB.
  %
    t(1) = cos ( theta2 );
    t(2) = sin ( theta2 );

    for i = 1 : n4
      j = j + 1;
      segment(1:2,j) = ( ( n4 - i + 1 ) * s(1:2)   ...
                       + (      i - 1 ) * t(1:2) )' ...
                       / ( n4         );
    end

    for i = 1 : n5

      theta = ( ( n5 - i + 1 ) * theta2   ...
              + (      i - 1 ) * theta1 ) ...
              / ( n5         );

      j = j + 1;
%
%  Ninny MATLAB.
%
      segment(1,j) = cos ( theta );
      segment(2,j) = sin ( theta );
    end
%
%  Ninny MATLAB.
%
    s(1) = cos ( theta1 );
    s(2) = sin ( theta1 );
    t(1:2) = [ 0.0, 0.0 ];

    for i = 1 : n6
      j = j + 1;
      segment(1:2,j) = ( ( n6 - i + 1 ) * s(1:2)   ...
                       + (      i - 1 ) * t(1:2) )' ...
                       / ( n6         );
    end

    j = j + 1;
    segment(1:2,j) = [ 0.0, 0.0 ]';
%
%  Segment 2: the circular hole.
%
  elseif ( segment_index == 2 )

    for j = 1 : segment_length
      theta = ( segment_length - j ) * 2.0 * pi / ( segment_length - 1 );
      segment(1,j) = c2(1) + r2 * cos ( theta );
      segment(2,j) = c2(2) + r2 * sin ( theta );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P08_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P08_BOUNDARY_SEGMENT - Fatal error!' );

  end

  return
end
