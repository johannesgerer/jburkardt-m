function pdf = buffon_pdf ( a, l )

%*****************************************************************************80
%
%% BUFFON_PDF evaluates the Buffon PDF.
%
%  Discussion:
%
%    In the Buffon needle experiment, we suppose that the plane has been
%    ruled by vertical lines with a spacing of A units, and that a
%    needle of length L is dropped "at random" onto this grid.
%
%    Because of the various symmetries, we may assume that this eye of
%    this needle lands in the first infinite strip, and we may further
%    assume that its Y coordinate is 0.  Thus, we have
%    the eye as (X1,Y1) with 0 <= X1 <= A and Y1 = 0.
%
%    ANGLE, the angle that the needle makes is taken to be uniformly random.
%    The point of the needle, (X2,Y2), therefore lies at
%
%      (X2,Y2) = ( X1+L*cos(ANGLE), Y1+L*sin(ANGLE) )
%
%    The needle will have crossed at least one grid line if any of the
%    following are true:
%
%      X2 <= 0, A <= X2.
%
%    The probability of a crossing on a single trial is
%
%      P(A,L) = ( 2 * L ) / ( PI * A )
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
%    01 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the horizontal spacing between the
%    vertical grid lines.  0 <= A.
%
%    Input, real L, the length of the needle.
%
%    Output, real PDF, the Buffon PDF.
%
  if ( a < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input A < 0.\n' );
    error ( 'BUFFON_PDF - Fatal error!' );
  elseif ( a == 0.0 )
    pdf = 1.0;
    return
  end

  if ( l < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BUFFON_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input L < 0.\n' );
    error ( 'BUFFON_PDF - Fatal error!' );
  elseif ( l == 0.0 )
    pdf = 0.0;
    return
  end

  pdf = ( 2.0 * l ) / ( pi * a );

  return
end
