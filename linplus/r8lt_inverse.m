function a_inverse = r8lt_inverse ( n, a )

%*****************************************************************************80
%
%% R8LT_INVERSE computes the inverse of a R8LT matrix.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Second edition,
%    Academic Press, 1978,
%    ISBN 0-12-519260-6
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the lower triangular matrix to be inverted.
%
%    Output, real A_INVERSE(N,N), the inverse of the lower triangular matrix.
%

%
%  Check.
%
  for i = 1 : n
    if ( a(i,i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8LT_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  Zero diagonal element.\n' );
      error ( 'R8LT_INVERSE - Fatal error!' );
    end
  end

  a_inverse(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n

    for i = 1 : n

      if ( i < j )

        a_inverse(i,j) = 0.0;

      elseif ( i == j )

        a_inverse(i,j) = 1.0 / a_inverse(i,j);

      elseif ( j < i )

        a_inverse(i,j) = - ( a_inverse(i,j:i-1) * a_inverse(j:i-1,j) ) ...
          / a_inverse(i,i);

      end

    end
  end

  return
end
