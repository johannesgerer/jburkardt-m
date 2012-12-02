function ierror = cycle_check ( n, ncycle, t, index )

%*****************************************************************************80
%
%% CYCLE_CHECK checks a permutation in cycle form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of items permuted.
%    N must be positive.
%
%    Input, integer NCYCLE, the number of cycles.
%    1 <= NCYCLE <= N.
%
%    Input, integer T(N), INDEX(NCYCLE), describes the permutation
%    as a collection of NCYCLE cycles.  The first cycle is
%    T(1) -> T(2) -> ... -> T(INDEX(1)) -> T(1).
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, N is less than 1.
%    -2, NCYCLE is less than 1 or greater than N.
%    -3, an entry of INDEX is illegal.
%    -4, the entries of INDEX do not add up to N.
%    I, entry I of T is illegal.
%
  ierror = 0;
%
%  N must be at least 1.
%
  if ( n < 1 )
    ierror = -1;
    return
  end
%
%  1 <= NCYCLE <= N.
%
  if ( ncycle < 1 || n < ncycle )
    ierror = -2;
    return
  end
%
%  1 <= INDEX(I) <= N.
%
  for i = 1 : ncycle
    if ( index(i) < 1 || n < index(i) )
      ierror = -3;
      return
    end
  end
%
%  The INDEX(I)'s sum to N.
%
  if ( sum ( index(1:ncycle) ) ~= n )
    ierror = -4;
  end
%
%  1 <= T(I) <= N.
%
  for i = 1 : n
    if ( t(i) < 1 || n < t(i) )
      ierror = i;
      return
    end
  end
%
%  Verify that every value from 1 to N occurs in T.
%
  for iseek = 1 : n

    ifind = 0;

    for i = 1 : n
      if ( t(i) == iseek )
        ifind = i;
        break;
      end
    end

    if ( ifind == 0 )
      ierror = iseek;
      return
    end

  end

  return
end
