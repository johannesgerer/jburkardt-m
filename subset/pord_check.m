function ierror = pord_check ( n, a )

%*****************************************************************************80
%
%% PORD_CHECK checks a matrix representing a partial ordering.
%
%  Discussion:
%
%    The array A is supposed to represent a partial ordering of
%    the elements of a set of N objects.
%
%    For distinct indices I and J, the value of A(I,J) is:
%
%      1, if I << J
%      0, otherwise ( I and J may be unrelated, or perhaps J << I).
%
%    Diagonal elements of A are ignored.
%
%    This routine checks that the values of A do represent
%    a partial ordering.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%
%    Input, integer A(N,N), the partial ordering.
%    1 if I is less than J in the partial ordering, 
%    0 otherwise.
%
%    Output, integer IERROR, error flag.
%    0, no errors detected.  A is a partial ordering.
%    1, N <= 0.
%    2, 0 < A(I,J) and 0 < A(J,I) for some I and J.
%
  ierror = 0;

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PORD_CHECK - Fatal error!\n' );
    fprintf ( 1, '  N must be positive, but N = %d\n', n );
    ierror = 1;
    return
  end

  for i = 1 : n
    for j = i+1 : n

      if ( 0 < a(i,j) )
        if ( 0 < a(j,i) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'PORD_CHECK - Fatal error!\n' );
          fprintf ( 1, '  For indices I = %d\n', i );
          fprintf ( 1, '  and J = %d\n', j );
          fprintf ( 1, '  A(I,J) = %d\n', a(i,j) );
          fprintf ( 1, '  A(J,I) = %d\n', a(j,i) );
          ierror = 2;
          return
        end
      end

    end
  end

  return
end
