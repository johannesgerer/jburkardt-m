function a_inverse = r8ut_inverse ( n, a )

%*****************************************************************************80
%
%% R8UT_INVERSE computes the inverse of a R8UT matrix.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the R8UT matrix to be inverted.
%
%    Output, real A_INVERSE(N,N), the inverse of the upper triangular matrix.
%

%
%  Check.
%
  for i = 1 : n
    if ( a(i,i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8UT_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  Zero diagonal element.\n' );
      error ( 'R8UT_INVERSE - Fatal error!' );
    end
  end

  a_inverse(1:n,1:n) = a(1:n,1:n);

  for j = n : -1 : 1

    for i = n : -1 : 1

      if ( j < i )

        a_inverse(i,j) = 0.0;

      elseif ( i == j )

        a_inverse(i,j) = 1.0 / a_inverse(i,j);

      elseif ( i < j )

        a_inverse(i,j) = - ( a_inverse(i,i+1:j) * a_inverse(i+1:j,j) ) ...
          / a_inverse(i,i);

      end

    end
  end

  return
end
