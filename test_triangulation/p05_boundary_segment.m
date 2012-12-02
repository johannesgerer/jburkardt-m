function segment = p05_boundary_segment ( segment_index, m, segment_length )

%*****************************************************************************80
%
%% P05_BOUNDARY_SEGMENT returns a boundary segment in problem 05.
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
  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 = 1.0;
  r2 = 0.55;

  if ( segment_index == 1 )
%
%  Work out the appropriate segment lengths, and then
%  adjust N4, if necessary, to account for roundoff.
%
    n4 = round ( ( segment_length - 1 ) / ( 1.0 + r2 + 0.90 / pi )  );

    n1 = round ( 0.05 * ( n4 ) / pi );
    n2 = round (   r2 * ( n4 ) );
    n3 = round ( 0.85 * ( n4 ) / pi );

    n4 = segment_length - 1 - n1 - n2 - n3;

    j = 0;
%
%  Piece #1, the short straight piece.
%
    for i = 1 : n1
      j = j + 1;
      segment(1:2,j) = ...
        ( ( n1 - i + 1 ) * [ center1(1) - r1, center1(2) ]   ... 
        + (      i - 1 ) * [ center2(1) - r2, center2(2) ] )' ...
        / ( n1         );
    end
%
%  Piece #2, the smaller semicircle.
%
    for i = 1 : n2
      angle = ( n2 - i + 1 ) * pi ...
            / ( n2         );
      j = j + 1;
%
%  A special ninny feature of MATLAB means I can't write this as one vector
%  operation...Oh, and thanks for the automatic RETURN on my comment, -
%  I guess you know better.
%
      segment(1,j) = center2(1) + r2 * cos ( angle );
      segment(2,j) = center2(2) + r2 * sin ( angle );
    end
%
%  Piece #3, the long straight piece.
%
    for i = 1 : n3
      j = j + 1;
      segment(1:2,j) = ...
        ( ( n3 - i + 1 ) * [ center2(1) + r2, center2(2) ]   ... 
        + (      i - 1 ) * [ center1(1) + r1, center1(1) ] )' ...
        / ( n3         );
    end
%
%  Piece #4, the larger semicircle.
%
    for i = 1 : n4
      angle = ( i - 1 ) * pi / ( n4 );
      j = j + 1;
%
%  MATLAB ninny error.
%
      segment(1,j) = center1(1) + r1 * cos ( angle );
      segment(2,j) = center1(2) + r1 * sin ( angle );
    end

    j = j + 1;
    segment(1:2,j) = [ center1(1) - r1, center1(2) ]';

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P05_BOUNDARY_SEGMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal SEGMENT_INDEX = %d\n', segment_index );
    error ( 'P05_BOUNDARY_SEGMENT - Fatal error!' );

  end

  return
end
