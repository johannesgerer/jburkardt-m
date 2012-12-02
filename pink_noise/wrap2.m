function q = wrap2 ( m, q )

%*****************************************************************************80
%
%% WRAP2 is a circular wrap of the pointer offset Q.
%
%  Discussion:
%
%    Input values of Q between 0 and M are 'legal'.
%    Values of Q below 0 are incremented by M + 1 until they are legal.
%    Values of Q above M are decremented by M + 1 until they become legal.
%    The legal value is the output value of the function.
%
%  Example:
%
%    M  Qin  Qout
%
%    3  -5   3
%    3  -4   0
%    3  -3   1
%    3  -2   2
%    3  -1   3
%    3   0   0
%    3   1   1
%    3   2   2
%    3   3   3
%    3   4   0
%    3   5   1
%    3   6   2
%    3   7   3
%    3   8   0
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
%    Input, integer M, the maximum acceptable value for outputs.
%    M must be at least 0.
%
%    Input, integer Q, the value to be wrapped.
%
%    Output, integer Q, the wrapped value.
%
  if ( m < 0 )
    fprintf ( 2, '\n' );
    fprintf ( 2, 'WRAP2 - Fatal error!\n' );
    fprintf ( 2, '  M < 0.\n' );
    error ( 'WRAP2 - Fatal error!' );
  end
%
%  When Q = M + 1, it wraps to Q = 0.
%
  while ( m < q )
    q = q - m - 1;
  end
%
%  When Q = - 1, it wraps to Q = M.
%
  while ( q < 0 )
    q = q + m + 1;
  end

  return
end
