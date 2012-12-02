function perm_check ( n, p )

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
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PERM_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The value %d is missing.\n', seek );
      error ( 'PERM_CHECK - Fatal error!' );
    end

  end

  return
end
