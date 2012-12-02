function b = i4mat_u1_inverse ( n, a )

%*****************************************************************************80
%
%% I4MAT_U1_INVERSE inverts a unit upper triangular matrix.
%
%  Discussion:
%
%    A unit upper triangular matrix is a matrix with only 1's on the main
%    diagonal, and only 0's below the main diagonal.  Above the main
%    diagonal, the entries may be assigned any value.
%
%    It may be surprising to note that the inverse of an integer unit upper
%    triangular matrix is also an integer unit upper triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2004
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
%    Input, integer N, number of rows and columns in matrix.
%
%    Input, integer A(N,N).  Unit upper triangular matrix
%    to be inverted.
%
%    Output, integer B(N,N), the inverse matrix.
%
  b = zeros ( n, n );

  for j = n : -1 : 1

    for i = n : -1 : 1

      if ( i == j )
        isum = 1;
      else
        isum = 0;
      end

      for k = i + 1 : j
        isum = isum - a(i,k) * b(k,j);
      end

      b(i,j) = isum;

    end
  end

  return
end
