function [ y, u, q ] = ranh ( d, u, q )

%*****************************************************************************80
%
%% RANH is a hold random number generator of period D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2010
%
%  Author:
%
%    Original C version by Sophocles Orfanidis.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sophocles Orfanidis,
%    Introduction to Signal Processing,
%    Prentice-Hall, 1995,
%    ISBN: 0-13-209172-0,
%    LC: TK5102.5.O246.
%
%  Parameters:
%
%    Input, int D, the hold period.  D must be at least 1.
%
%    Input, real U, a value to be held until Q has decremented to 0.
%
%    Input, int *Q, a counter which is decremented by 1 on each call
%    until reaching 0.
%
%    Output, double Y, the input value of U.
%
%    Output, real U, a value which will have been randomly reset
%    if Q reached 0.
%
%    Output, integer Q, the decremented counter.
%
  if ( d < 1 )
    fprintf ( 2, '\n' );
    fprintf ( 2, 'RANH - Fatal error!\n' );
    fprintf ( 2, '  D < 1.\n' );
    error ( 'RANH - Fatal error!' );
  end
%
%  Hold this sample for D calls.
%
  y = u;
%
%  Decrement Q and wrap mod D.
%
  q = cdelay2 ( d - 1, q );
%
%  Every D calls, get a new U with zero mean.
%
  if ( q == 0 )
    u = 2.0 * rand ( ) - 1.0;
  end

  return
end
