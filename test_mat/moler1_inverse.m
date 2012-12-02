function a = moler1_inverse ( alpha, n )

%*****************************************************************************80
%
%% MOLER1_INVERSE returns the inverse of the MOLER1 matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) =               min ( N-I, N-J )*ALPHA**2 + 1
%    else
%      A(I,J) = (-1)**(I+J) * min ( N-I, N-J ) * ALPHA**2 + ALPHA
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%     17 -14  10 -6  2
%    -14  13 -10  6 -2
%     10 -10   9 -6  2
%     -6   6  -6  5 -2
%      2  -2   2 -2  1
%
%  Properties:
%
%    The matrix is symmetric.
%
%    Successive elements of each diagonal decrease by ALPHA**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the inverse 
%    Moler matrix.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  v(1) = 1.0;
  v(2) = - alpha;
  for i = 3 : n
    v(i) = - ( alpha - 1.0 ) * v(i-1);
  end

  for i = 1 : n
    for j = 1 : n
      if ( i <= j )
        a(i,j) = v(1+j-i:n+1-i) * v(1    :n+1-j)';
      else
        a(i,j) = v(1    :n+1-i) * v(1+i-j:n+1-j)';
      end
    end
  end

  return
end
