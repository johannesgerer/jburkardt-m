function a = antihadamard ( n )

%*****************************************************************************80
%
%% ANTIHADAMARD returns an approximate "Anti-Hadamard" matrix.
%
%  Discussion:
%
%    An Anti-Hadamard matrix is one whose elements are all 0 or 1,
%    and for which the Frobenius norm of the inverse is as large as
%    possible.  This routine returns a matrix for which the Frobenius norm
%    of the inverse is large, though not necessarily maximal.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    else if ( I < J and mod ( I+J, 2 ) = 1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    1 1 0 1 0
%    0 1 1 0 1
%    0 0 1 1 0
%    0 0 0 1 1
%    0 0 0 0 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is upper triangular.
%
%    A is integral: int ( A ) = A.
%
%    A is a zero-one matrix.
%
%    The inverse of A is integral.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ronald Graham, Neal Sloane,
%    Anti-Hadamard Matrices,
%    Linear Algebra and Applications,
%    Volume 62, 1984, pages 113-137.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );
  
  for i = 1 : n
    for j = 1 : n

      if ( j < i )
        a(i,j) = 0.0;
      elseif ( i == j )
        a(i,j) = 1.0;
      elseif ( mod ( i+j, 2 ) == 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
