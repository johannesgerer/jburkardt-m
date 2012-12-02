function unicycle_check ( n, p )

%*****************************************************************************80
%
%% UNICYCLE_CHECK checks that a vector represents a unicycle.
%
%  Discussion:
%
%    A unicycle is a permutation with a single cycle.  This might be called
%    a cyclic permutation, except that that name is used with at least two
%    other meanings.  So, to be clear, a unicycle is a permutation of N
%    objects in which each object is returned to itself precisely after
%    N applications of the permutation.
%
%    This routine verifies that each of the integers from 1
%    to N occurs among the N entries of the permutation.
%
%    Any permutation of the integers 1 to N describes a unicycle.
%    The permutation ( 3, 4, 2, 1 ) indicates that the unicycle
%    sends 3 to 4, 4 to 2, 2 to 1 and 1 to 3.  This is the sequential
%    description of a unicycle.
%
%    The standard sequence "rotates" the permutation so that it begins
%    with 1.  The above sequence becomes a standard sequence when
%    written as ( 1, 3, 4, 2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, integer P(N), the unicycle sequence vector.
%
  ierror = 0;

  for iseek = 1 : n

    ierror = iseek;

    for ifind = 1 : n
      if ( p(ifind) == iseek )
        ierror = 0
        break
      end
    end

    if ( ierror ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'UNICYCLE_CHECK - Fatal error!\n' );
      fprintf ( 1, '  The input array does not represent\n' );
      fprintf ( 1, '  a unicycle.  In particular, the\n' );
      fprintf ( 1, '  array is missing the value %d\n', ierror );
      error ( 'UNICYCLE_CHECK - Fatal error!' )
    end

  end

  return
end
