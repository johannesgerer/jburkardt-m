function b = i4mat_u1_inverse ( n, a )

%*****************************************************************************80
%
%% I4MAT_U1_INVERSE inverts a unit upper triangular I4MAT.
%
%  Discussion:
%
%    A unit upper triangular matrix is a matrix with only 1's on the main
%    diagonal, and only 0's below the main diagonal.
%
%    The inverse of an integer unit upper triangular matrix is also
%    an integer unit upper triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
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
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, number of rows and columns in the matrix.
%
%    Input, integer A(N,N), the unit upper triangular matrix.
%
%    Output, integer B(N,N), the inverse matrix.
%
  for j = n : -1 : 1

    b(j+1:n,j) = 0;
    b(j,j) = 1;

    for i = j-1 : -1 : 1
      b(i,j) = - a(i,i+1:j) * b(i+1:j,j);
    end

  end

  return
end
