function a = pascal1_inverse ( n )

%*****************************************************************************80
%
%% PASCAL1_INVERSE returns the inverse of the PASCAL1 matrix.
%
%  Formula:
%
%    if ( J = 1 )
%      A(I,J) = (-1)^(I+J)
%    elseif ( I = 1 )
%      A(I,J) = 0
%    else
%      A(I,J) = A(I-1,J) - A(I,J-1)
%
%  Example:
%
%    N = 5
%
%     1  0  0  0  0
%    -1  1  0  0  0
%     1 -2  1  0  0
%    -1  3 -3  1  0
%     1 -4  6 -4  1
%
%  Properties:
%
%    A is nonsingular.
%
%    A is lower triangular.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    (0, 0, ..., 0, 1) is an eigenvector.
%
%    The inverse of A is the same as A, except that entries in "odd"
%    positions have changed sign:
%
%      B(I,J) = (-1)^(I+J) * A(I,J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2007
%
%  Author:
%
%    John Burkardt
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

      if ( j == 1 )
        a(i,j) = ( -1.0 )^(i+j);
      elseif ( i == 1 )
        a(i,j) = 0.0;
      else
        a(i,j) = a(i-1,j-1) - a(i-1,j);
      end

    end
  end

  return
end
