function missing = perm_check ( n, p )

%*****************************************************************************80
%
%% PERM_CHECK checks that a vector represents a permutation.
%
%  Discussion:
%
%    The routine verifies that each of the integers from 1
%    to N occurs among the N entries of the permutation.
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
%    Output, integer MISSING, error flag.
%    0, the array represents a permutation.
%    nonzero, the array does not represent a permutation.  The smallest
%    missing value is equal to MISSING.
%
  missing = 0;

  for seek = 1 : n

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
