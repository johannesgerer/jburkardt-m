function [ n2, choice ] = backbin_rc ( n, reject, n2, choice )

%*****************************************************************************80
%
%% BACKBIN_RC uses reverse communication for binary backtracking.
%
%  Discussion:
%
%    If this procedure returns a solution with N2 = N, which is acceptable
%    to the user, then a full solution has been found.
%
%    If this procedure returns N2 = -1, no more potential solutions are
%    available to consider.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the full solution.
%
%    Input, logical REJECT, is TRUE if the proposed partial solution
%    in the first N2 entries of CHOICE must be rejected.  On first call,
%    this value is ignored.
%
%    Input/output, integer the length of the current
%    partial solution.  On first call for a given problem, the user
%    should set N2 to -1.  If the program has exhausted the search space,
%    the value of N2 will be returned as -1.
%
%    Input/output, integer CHOICE(N), indicates the current
%    partial solution in entries 1 through N2, which will contain 0 or 1.
%    On first call, set CHOICE to [];
%

%
%  N2 = -1 means an initialization call.
%
  if ( n2 == -1 )

    choice(1:n) = -1;
    n2 = 1;
    choice(n2) = 1;
%
%  1 <= FOCUS means we asked the user to evaluate CHOICE(1:N2).
%
%  N2 = N means we returned a full prospective solution
%  so in any case we must increment CHOICE.
%
%  Returning REJECT = 1 means no solution begins this way
%  so we must increment CHOICE.
%
  elseif ( n2 == n || reject )

    while ( 1 < n2 )
      if ( choice(n2) == 1 )
        choice(n2) = 0;
        break
      end
      choice(n2) = -1;
      n2 = n2 - 1;
    end
%
%  Have we exhausted the solution space?
%
    if ( n2 == 1 )
      if ( choice(n2) == 1 )
        choice(n2) = 0;
      else
        choice(n2) = -1;
        n2 = -1;
      end
    end
%
%  N2 < N and not REJECT means we can increment N2.
%
  else

    n2 = n2 + 1;
    choice(n2) = 1;

  end

  return
end

