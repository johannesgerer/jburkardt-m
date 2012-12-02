function b = r8mat_u_inverse ( n, a )

%*****************************************************************************80
%
%% R8MAT_U_INVERSE inverts an upper triangular R8MAT.
%
%  Discussion:
%
%    An upper triangular matrix is a matrix whose only nonzero entries
%    occur on or above the diagonal.
%
%    The inverse of an upper triangular matrix is an upper triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2005
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, number of rows and columns in the matrix.
%
%    Input, real A(N,N), the upper triangular matrix.
%
%    Output, real B(N,N), the inverse matrix.
%
  for j = n : -1 : 1

    for i = n : -1 : 1

      if ( j < i )
        b(i,j) = 0.0;
      elseif ( i == j )
        b(i,j) = 1.0 / a(i,j);
      else
        b(i,j) = -( a(i,i+1:n) * b(i+1:n,j) ) / a(i,i);
      end

    end
  end

  return
end
