function a = rodman_inverse ( alpha, n )

%*****************************************************************************80
%
%% RODMAN_INVERSE returns the inverse of the Rodman matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = ( 1 + ALPHA * ( N - 2 ) ) /
%        ( 1 + ALPHA * ( N - 2 ) - ALPHA**2 * ( N - 1 ) )
%    else
%      A(I,J) = - ALPHA /
%        ( 1 + ALPHA * ( N - 2 ) - ALPHA**2 * ( N - 1 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  bot = 1.0 + alpha * ( n - 2 ) - alpha * alpha * ( n - 1 );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = ( 1.0 + alpha * ( n - 2 ) ) / bot;
      else
        a(i,j) = - alpha / bot;
      end

    end
  end

  return
end
