function b = r8mat_l_inverse ( n, a )

%*****************************************************************************80
%
%% R8MAT_L_INVERSE inverts a lower triangular R8MAT.
%
%  Discussion:
%
%    A lower triangular matrix is a matrix whose only nonzero entries
%    occur on or below the diagonal.
%
%    The inverse of a lower triangular matrix is a lower triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
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
%    Input, real A(N,N), the lower triangular matrix.
%
%    Output, real B(N,N), the inverse matrix.
%
  for j = 1 : n

    for i = 1 : n

      if ( i < j )
        b(i,j) = 0.0;
      elseif ( j == i )
        b(i,j) = 1.0 / a(i,j);
      else
        b(i,j) = -( a(i,1:i-1) * b(1:i-1,j) ) / a(i,i);
      end

    end
  end

  return
end
