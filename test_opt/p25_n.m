function n = p25_n ( )

%*****************************************************************************80
%
%% P25_N returns the number of variables for problem 25.
%
%  Discussion:
%
%    The function is actually well defined for any positive value of N.
%    The value given here is that specified in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer N.  If N is positive, N represents the
%    only legal value for N for this problem.  If N is
%    negative, the absolute value of N is the least legal
%    value of N, but other values are allowable.
%
  n = 30;

  return
end
