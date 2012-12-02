function b = tri_l1_inverse ( n, a )

%*****************************************************************************80
%
%% TRI_L1_INVERSE inverts a double precision unit lower triangular matrix.
%
%  Discussion:
%
%    A unit lower triangular matrix is a matrix with only 1's on the main
%    diagonal, and only 0's above the main diagonal.
%
%    The inverse of a unit lower triangular matrix is also
%    a unit lower triangular matrix.
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
%    MATLAB version by John Burkardt
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
%    Input, real A(N,N), the unit lower triangular matrix.
%
%    Output, real B(N,N), the inverse matrix.
%
  for i = 1 : n

    for j = 1 : n

      if ( i < j )
        b(i,j) = 0.0;
      elseif ( j == i )
        b(i,j) = 1.0;
      else
        b(i,j) = -( a(i,1:i-1) * b(1:i-1,j) );
      end

    end
  end

  return
end
