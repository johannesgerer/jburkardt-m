function a = integration ( alpha, n )

%*****************************************************************************80
%
%% INTEGRATION returns the integration matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    else if ( J = I + 1 )
%      A(I,J) = ALPHA / I
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%    1  2   0   0   0
%    0  1  2/2  0   0
%    0  0   1  2/3  0
%    0  0   0   1  2/4
%    0  0   0   0   1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is unit upper triangular.
%
%    A is bidiagonal.
%
%    Because A is bidiagonal, it has property A (bipartite).
%
%    A is nonsingular.
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
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar which defines the first 
%    superdiagonal of the matrix.
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real A(N,N), the matrix.
%

  for i = 1 : n
    for j = 1 : n

      if ( j == i )
        a(i,j) = 1.0;
      elseif ( j == i + 1 )
        a(i,j) = alpha / i;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
