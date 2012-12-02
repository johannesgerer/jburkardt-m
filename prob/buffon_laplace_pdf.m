function pdf = buffon_laplace_pdf ( a, b, l )

%*****************************************************************************80
%
%% BUFFON_LAPLACE_PDF evaluates the Buffon-Laplace PDF.
%
%  Discussion:
%
%    In the Buffon-Laplace needle experiment, we suppose that the plane has been
%    tiled into a grid of rectangles of width A and height B, and that a
%    needle of length L is dropped "at random" onto this grid.  
% 
%    We may assume that one end, the "eye" of the needle falls at the point
%    (X1,Y1), taken uniformly at random in the cell [0,A]x[0,B].
%
%    ANGLE, the angle that the needle makes is taken to be uniformly random.
%    The point of the needle, (X2,Y2), therefore lies at
%
%      (X2,Y2) = ( X1+L*cos(ANGLE), Y1+L*sin(ANGLE) )
%
%    The needle will have crossed at least one grid line if any of the 
%    following are true:
%
%      X2 <= 0, A <= X2, Y2 <= 0, B <= Y2.
%
%    If L is larger than sqrt ( A*A + B*B ), then the needle will
%    cross every time, and the computation is uninteresting.  However, if
%    L is smaller than this limit, then the probability of a crossing on
%    a single trial is
%
%      P(L,A,B) = ( 2 * L * ( A + B ) - L * L ) / ( PI * A * B )
%
%    and therefore, a record of the number of hits for a given number of
%    trials can be used as a very roundabout way of estimating PI.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Sudarshan Raghunathan,
%    Making a Supercomputer Do What You Want: High Level Tools for 
%    Parallel Programming,
%    Computing in Science and Engineering,
%    Volume 8, Number 5, September/October 2006, pages 70-80.
%
%  Parameters:
%
%    Input, real A, B, the horizontal and vertical dimensions
%    of each cell of the grid.  0 <= A, 0 <= B.
%
%    Input, real L, the length of the needle.
%    0 <= L <= min ( A, B ).
%
%    Output, real PDF, the Buffon-Laplace PDF.
%
  if ( a < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_LAPLACE_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input A < 0.\n' );
    error ( 'BUFFON_LAPLACE_PDF - Fatal error!' );
  elseif ( a == 0.0 )
    pdf = 1.0;
    return
  end

  if ( b < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_LAPLACE_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input B < 0.\n' );
    error ( 'BUFFON_LAPLACE_PDF - Fatal error!' );
  elseif ( b == 0.0 )
    pdf = 1.0;
    return
  end

  if ( l < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_LAPLACE_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input L < 0.\n' );
    error ( 'BUFFON_LAPLACE_PDF - Fatal error!' );
  elseif ( l == 0.0 )
    pdf = 0.0;
    return
  elseif ( min ( a, b ) < l )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_LAPLACE_PDF - Fatal error!\n' );
    fprintf ( 1, '  min ( A, B ) < L.\n' );
    error ( 'BUFFON_LAPLACE_PDF - Fatal error!' );
  end
    
  pdf = l * ( 2.0 * ( a + b ) - l ) / ( pi * a * b );

  return
end
