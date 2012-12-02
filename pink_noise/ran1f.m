function [ z, u, q ] = ran1f ( b, u, q )

%*****************************************************************************80
%
%% RAN1F is a 1/F random number generator.
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
%    Input, integer B, the number of signals to combine.
%    For this algorithm, B cannot be more than 31!
%
%    Input, real U(B), the signals to combine.  It is expected
%    that each of the initial values of U will be drawn from a distribution
%    with zero mean.
%
%    Input, int Q(B), a set of counters that determine when each
%    entry of U is to be updated.
%
%    Output, real Z, the value.
%
%    Output, real U(B), the signals, some of which may have been updated.
%
%    Output, integer Q(B), the counters, which have been updated.
%
  if ( 31 < b )
    fprintf ( 2, '\n' );
    fprintf ( 2, 'RAN1F - Fatal error!\n' );
    fprintf ( 2, '  32 <= B, too many signals.\n' );
    error ( 'RAN1F - Fatal error!' );
  end

  z = 0.0;

  j = 1;
  for i = 1 : b
    [ y, u(i), q(i) ] = ranh ( j, u(i), q(i) );
    z = z + y;
    j = j * 2;
  end

  if ( 0 < b )
    z = z / b;
  end

  return;
end
