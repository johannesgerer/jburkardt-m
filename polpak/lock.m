function a = lock ( n )

%*****************************************************************************80
%
%% LOCK returns the number of codes for a lock with N buttons.
%
%  Discussion:
%
%    A button lock has N numbered buttons.  To open the lock, groups
%    of buttons must be pressed in the correct order.  Each button
%    may be pushed no more than once.  Thus, a code for the lock is
%    an ordered list of the groups of buttons to be pushed.
%
%    For this discussion, we will assume that EVERY button is pushed
%    at some time, as part of the code.  To count the total number
%    of codes, including those which don't use all the buttons, then
%    the number is 2 * A(N), or 2 * A(N) - 1 if we don't consider the
%    empty code to be valid.
%
%  Examples:
%
%    If there are 3 buttons, then there are 13 possible "full button" codes:
%
%      (123)
%      (12) (3)
%      (13) (2)
%      (23) (1)
%      (1) (23)
%      (2) (13)
%      (3) (12)
%      (1) (2) (3)
%      (1) (3) (2)
%      (2) (1) (3)
%      (2) (3) (1)
%      (3) (1) (2)
%      (3) (2) (1)
%
%    and, if we don't need to push all the buttons, every "full button" code above
%    yields a distinct "partial button" code by dropping the last set of buttons:
%
%      ()
%      (12)
%      (13)
%      (23)
%      (1)
%      (2)
%      (3)
%      (1) (2)
%      (1) (3)
%      (2) (1)
%      (2) (3)
%      (3) (1)
%      (3) (2)
%
%  First values:
%
%     N         A(N)
%     0           1
%     1           1
%     2           3
%     3          13
%     4          75
%     5         541
%     6        4683
%     7       47293
%     8      545835
%     9     7087261
%    10   102247563
%
%  Recursion:
%
%    A(I) = sum ( 0 <= J < I ) Binomial ( I, N-J ) * A(J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Velleman, Gregory Call,
%    Permutations and Combination Locks,
%    Mathematics Magazine,
%    Volume 68, Number 4, October 1995, pages 243-253.
%
%  Parameters:
%
%    Input, integer N, the maximum number of lock buttons.
%
%    Output, integer A(1:N+1), the number of lock codes.
%
  if ( n < 0 )
    a = [];
    return
  end

  a(1) = 1;

  for i = 1 : n
    a(i+1) = 0;
    for j = 0 : i-1
      a(i+1) = a(i+1) + i4_choose ( i, i-j ) * a(j+1);
    end
  end

  return
end
