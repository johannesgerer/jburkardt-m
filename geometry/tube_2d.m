function [ p1, p2 ] = tube_2d ( dist, n, p )

%*****************************************************************************80
%
%% TUBE_2D constructs a "tube" of given width around a path in 2D.
%
%  Discussion:
%
%    The routine is given a sequence of N points, and a distance DIST.
%
%    It returns the coordinates of the corners of the top and bottom
%    of a tube of width 2*DIST, which envelopes the line connecting
%    the points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DIST, the radius of the tube.
%
%    Input, integer N, the number of points defining the line.
%    N must be at least 2.
%
%    Input, real P(2,N), the points which comprise the broken
%    line which is to be surrounded by the tube.  Points should
%    not be immediately repeated, that is, it should never be
%    the case that
%      P(1,I) = P(1,I+1) and P(2,I) = P(2,I+1).
%
%    Output, real P1(2,N), P2(2,N), the points P1 form
%    one side of the tube, and P2 the other.
%
  dim_num = 2;
%
%  Check that N is at least 3.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TUBE_2D - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 3.\n' );
    fprintf ( 1, '  but your input value was N = %d\n', n );
    error ( 'TUBE_2D - Fatal error!' );
  end
%
%  Check that consecutive points are distinct.
%
  for i = 1 : n-1
    if ( all ( p(1:2,i) == p(1:2,i+1) ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TUBE_2D - Fatal error!\n' );
      fprintf ( 1, '  P(1:2,I) = P(1:2,I+1) for I = %d\n', i );
      r8vec_print ( 2, p(1:2,i), '  P(1:2,I):' );
      error ( 'TUBE_2D - Fatal error!' );
    end
  end

  for i = 1 : n

    im1 = i4_wrap ( i-1, 1, n );
    ip1 = i4_wrap ( i+1, 1, n );
%
%  This business with A and B is just to handle MATLAB's
%  finicky handling of row and column vectors, and I can't
%  be bothered to cater to it nicely today.
%
    [ a(1:2), b(1:2) ] = angle_box_2d ( ...
      dist, p(1:2,im1)', p(1:2,i)', p(1:2,ip1)' );
  
    p1(1:2,i) = a(1:2)';
    p2(1:2,i) = b(1:2)';
%
%  On the first and last steps, translate the corner points DIST units
%  along the line, to make an extra buffer.
%
    if ( i == 1 )

      temp = sqrt ( ( p(1,2) - p(1,1) ).^2 + ( p(2,2) - p(2,1) ).^2 );
      p1(1:2,1) = p1(1:2,1) - dist * ( p(1:2,2) - p(1:2,1) ) / temp;
      p2(1:2,1) = p2(1:2,1) - dist * ( p(1:2,2) - p(1:2,1) ) / temp;

    elseif ( i == n )

      temp = sqrt ( ( p(1,n) - p(1,n-1) ).^2 + ( p(2,n) - p(2,n-1) ).^2 );
      p1(1:2,n) = p1(1:2,n) + dist * ( p(1:2,n) - p(1:2,n-1) ) / temp;
      p2(1:2,n) = p2(1:2,n) + dist * ( p(1:2,n) - p(1:2,n-1) ) / temp;

    end
%
%  The new points P1 and P2 may need to be swapped.
%
%  Compute the signed distance from the points to the line.
%
    if ( 1 < i )

      a = p(2,i-1) - p(2,i);
      b = p(1,i) - p(1,i-1);
      c = p(1,i-1) * p(2,i) - p(1,i) * p(2,i-1);

      dis1 = ( a * p1(1,i-1) + b * p1(2,i-1) + c ) / sqrt ( a * a + b * b );

      dis2 = ( a * p1(1,i) + b * p1(2,i) + c ) / sqrt ( a * a + b * b );

      if ( r8_sign ( dis1 ) ~= r8_sign ( dis2 ) )

        temp = p1(1:2,i);
        p1(1:2,i) = p2(1:2,i);
        p2(1:2,i) = temp;

      end

    end

  end

  return
end

