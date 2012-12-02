function missing = perm_check2 ( n, p, base )

%*****************************************************************************80
%
%% PERM_CHECK2 checks that a vector represents a permutation.
%
%  Discussion:
%
%    The routine verifies that each of the integers from BASE
%    to BASE+N-1 occurs among the N entries of the permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, integer P(N), the array to check.
%
%    Input, integer BASE, the base of the permutation;
%    0: permutation of 0:N-1.
%    1: permuation of 1:N.
%
%    Output, integer MISSING, error flag.
%    0, the array represents a permutation.
%    nonzero, the array does not represent a permutation.  The smallest
%    missing value is equal to MISSING.
%
  missing = 0;

  for seek = base : base + n - 1

    missing = seek;

    for find = 1 : n
      if ( p(find) == seek )
        missing = 0;
        break;
      end
    end

    if ( missing ~= 0 )
      return;
    end

  end

  return
end
