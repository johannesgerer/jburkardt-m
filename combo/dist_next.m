function [ q, more ] = dist_next ( k, m, q, more )

%*****************************************************************************80
%
%% DIST_NEXT returns the next distribution of indistinguishable objects.
%
%  Discussion:
%
%    A distribution of M objects into K parts is an ordered sequence
%    of K nonnegative integers which sum to M.  This is similar to
%    a partition of a set into K subsets, except that here the order
%    matters.  That is, (1,1,2) and (1,2,1) are considered to be
%    different distributions.
%
%    On the first call to this routine, the user should set MORE = FALSE,
%    to signal that this is a startup for the given computation.  The routine
%    will return the first distribution, and set MORE = TRUE.
%
%    If the user calls again, with MORE = TRUE, the next distribution
%    is being requested.  If the routine returns with MORE = TRUE, then
%    that distribution was found and returned.  However, if the routine
%    returns with MORE = FALSE, then no more distributions were found;
%    the enumeration of distributions has terminated.
%
%    A "distribution of M indistinguishable objects into K slots" is
%    sometimes called a "composition of the integer M into K parts".
%
%  Example:
%
%    K = 3, M = 5
%
%    0           0           5
%    0           1           4
%    0           2           3
%    0           3           2
%    0           4           1
%    0           5           0
%    1           0           4
%    1           1           3
%    1           2           2
%    1           3           1
%    1           4           0
%    2           0           3
%    2           1           2
%    2           2           1
%    2           3           0
%    3           0           2
%    3           1           1
%    3           2           0
%    4           0           1
%    4           1           0
%    5           0           0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Fenichel,
%    Algorithm 329:
%    Distribution of Indistinguishable Objects into
%    Distinguishable Slots,
%    Communications of the ACM,
%    Volume 11, Number 6, June 1968, page 430.
%
%  Parameters:
%
%    Input, integer K, the number of distinguishable "slots".
%
%    Input, integer M, the number of indistinguishable objects.
%
%    Input/output, integer Q(K), the number of objects in each
%    slot.
%
%    Input/output, logical MORE, used by the user to start the computation,
%    and by the routine to stop the computation.
%
  persistent leftmost;
%
%  The startup call.
%
  if ( ~more )

    more = 1;

    q(1:k-1) = 0;
    q(k) = m;

    leftmost = k + 1;
%
%  There are no more distributions.
%  Reset Q to the first distribution in the sequence.
%
  elseif ( q(1) == m )

    more = 0;

    q(1:k-1) = 0;
    q(k) = m;

    leftmost = k + 1;

  elseif ( leftmost < k + 1 )

    leftmost = leftmost - 1;
    q(k) = q(leftmost) - 1;
    q(leftmost) = 0;
    q(leftmost-1) = q(leftmost-1) + 1;
    if ( q(k) ~= 0 )
      leftmost = k + 1;
    end

  else

    if ( q(k) == 1 )
      leftmost = k;
    end

    q(k) = q(k) - 1;
    q(k-1) = q(k-1) + 1;

  end

  return
end
