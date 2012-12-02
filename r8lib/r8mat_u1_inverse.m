function b = r8mat_u1_inverse ( n, a )

%*****************************************************************************80
%
%% R8MAT_U1_INVERSE inverts a unit upper triangular R8MAT.
%
%  Discussion:
%
%    A unit upper triangular matrix is a matrix with only 1's on the main
%    diagonal, and only 0's below the main diagonal.
%
%    The inverse of a unit upper triangular matrix is also
%    a unit upper triangular matrix.
%
%    This routine can invert a matrix in place, that is, with no extra
%    storage.  If the matrix is stored in A, then the call
%
%      call r8mat_u1_inverse ( n, a, a )
%
%    will result in A being overwritten by its inverse.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
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
%    Input, real A(N,N), the unit upper triangular matrix.
%
%    Output, real B(N,N), the inverse matrix.
%
  for j = n : -1 : 1

    for i = n : -1 : 1

      if ( j < i )
        b(i,j) = 0.0;
      elseif ( i == j )
        b(i,j) = 1.0;
      else
        b(i,j) = -( a(i,i+1:j) * b(i+1:j,j) );
      end

    end
  end

  return
end
