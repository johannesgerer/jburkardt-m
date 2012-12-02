function q = cdelay2 ( m, q )

%*****************************************************************************80
%
%% CDELAY2 is a circular buffer implementation of M-fold delay.
%
%  Example:
%
%    Suppose we call CDELAY2 12 times, always with M = 3, and with
%    Q having the input value 3 on the first call.  Q will go through
%    the following sequence of values over the 12 calls:
%
%    I   M  Qin  Qout
%
%    1   3   3   2
%    2   3   2   1
%    3   3   1   0
%    4   3   0   3
%    5   3   3   2
%    6   3   2   1
%    7   3   1   0
%    8   3   0   3
%    9   3   3   2
%   10   3   2   1
%   11   3   1   0
%   12   3   0   3
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
%    Input, integer M, the maximum value that Q can have.
%
%    Input, integer Q, a counter to be decremented.  
%
%    Output, integer Q, the decremented counter.  The value "after" 0 is M.  
%

%
%  Decrement the offset.
%
  q = q - 1;
%
%  Q = - 1 wraps to Q = M.
%
  q = wrap2 ( m, q );

  return
end
