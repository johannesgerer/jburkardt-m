function ierror = perm_check ( n, p, base )

%*****************************************************************************80
%
%% PERM_CHECK checks that a vector represents a permutation.
%
%  Discussion:
%
%    The routine verifies that each of the integers from BASE to
%    to BASE+N-1 occurs among the N entries of the permutation.
%
%    Set the input quantity BASE to 0, if P is a 0-based permutation,
%    or to 1 if P is a 1-based permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 October 2008
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
%    Input, integer BASE, the index base.
%
%    Output, integer IERROR, error flag.
%    0, the array represents a permutation.
%    nonzero, the array does not represent a permutation.  
%
  ierror = 0;

  for seek = base : base + n - 1

    ierror = 1;

    for find = 1 : n
      if ( p(find) == seek )
        ierror = 0;
        break;
      end
    end

    if ( ierror ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PERM_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The input array does not represent\n' );
      fprintf ( 1, '  a proper permutation.\n' );
      error ( 'PERM_CHECK - Fatal error!' );
      return
    end

  end

  return
end
