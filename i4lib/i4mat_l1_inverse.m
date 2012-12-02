function b = i4mat_l1_inverse ( n, a )

%*****************************************************************************80
%
%% I4MAT_L1_INVERSE inverts a unit lower triangular I4MAT.
%
%  Discussion:
%
%    A unit lower triangular matrix is a matrix with only 1's on the main
%    diagonal, and only 0's above the main diagonal.
%
%    The inverse of an integer unit lower triangular matrix is also
%    an integer unit lower triangular matrix.
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
%    Input, integer A(N,N), the unit lower triangular matrix.
%
%    Output, integer B(N,N), the inverse matrix.
%
  for i = 1 : n

    for j = 1 : i - 1
      b(i,j) = - a(i,1:i-1) * b(1:i-1,j);
    end

    b(i,i) = 1;
    b(i,i+1:n) = 0;

  end

  return
end
