function ierror = perm1_check ( n, p )

%*****************************************************************************80
%
%% PERM1_CHECK checks a permutation of (1,...,N).
%
%  Discussion:
%
%    The routine verifies that each of the integers from 1 to
%    to N occurs among the N entries of the permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 May 2015
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
%    Output, integer IERROR:
%    0, P is a legal permutation of (1,...,N).
%    1, P is not a legal permutation of (1,...,N).
%
  ierror = 0;

  for value = 1 : n

    ierror = 1;

    for location = 1 : n
      if ( p(location) == value )
        ierror = 0;
        break;
      end
    end

    if ( ierror ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PERM1_CHECK - Warning!\n' );
      fprintf ( 1, '  Permutation is missing the value %d.\n', value );
      break;
    end

  end

  return
end
