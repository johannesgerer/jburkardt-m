function a = borderband ( n )

%*****************************************************************************80
%
%% BORDERBAND returns a border-banded matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,I) = 1
%    else if ( I = N )
%      A(N,J) = 2**(1-J)
%    else if ( J = N )
%      A(I,N) = 2**(1-I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%     1  0   0   0   1
%     0  1   0   0  1/2
%     0  0   1   0  1/4
%     0  0   0   1  1/8
%     1 1/2 1/4 1/8  1
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is border-banded.
%
%    A has N-2 eigenvalues of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
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
  for i = 1 : n

    for j = 1 : n

      if ( i == j )
        a(i,j) = 1.0;
      elseif ( j == n )
        a(i,j) = 2.0^(1-i);
      elseif ( i == n )
        a(i,j) = 2.0^(1-j);
      else
        a(i,j) = 0.0;
      end

    end

  end

  return
end
