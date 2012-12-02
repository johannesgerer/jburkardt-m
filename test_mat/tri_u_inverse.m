function b = tri_u_inverse ( n, a )

%*****************************************************************************80
%
%% TRI_U_INVERSE inverts an upper triangular R8MAT.
%
%  Discussion:
%
%    An R8MAT is an array of R8 values.
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
%    29 June 2008
%
%  Author:
%
%    FORTRAN77 original version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
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
        b(i,j) = - ( a(i,i+1:j) * b(i+1:j,j) ) / a(i,i);
      end

    end
  end

  return
end
