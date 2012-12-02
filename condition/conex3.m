function a = conex3 ( n )

%*****************************************************************************80
%
%% CONEX3 returns a LINPACK condition number counterexample.
%
%  Formula:
%
%    if ( I = J and I < N )
%      A(I,J) =  1.0D+00 for 1<=I<N
%    else if ( I = J = N )
%      A(I,J) = -1.0D+00
%    else if ( J < I )
%      A(I,J) = -1.0D+00
%    else
%      A(I,J) =  0.0D+00
%
%  Example:
%
%    N = 5
%
%     1  0  0  0  0
%    -1  1  0  0  0
%    -1 -1  1  0  0
%    -1 -1 -1  1  0
%    -1 -1 -1 -1 -1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is lower triangular.
%
%    det ( A ) = -1.
%
%    A is unimodular.
%
%    LAMBDA = ( 1, 1, 1, 1, -1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Cline, RK Rew,
%    A set of counterexamples to three condition number estimators,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 4, 1983, pages 602-611.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j < i )
        a(i,j) = -1.0;
      elseif ( j == i & i ~= n )
        a(i,j) = 1.0;
      elseif ( j == i & i == n )
        a(i,j) = - 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
