function a = rodman_inverse ( n, alpha )

%*****************************************************************************80
%
%% RODMAN_INVERSE returns the inverse of the RODMAN matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = ( 1 + ALPHA * ( N - 2 ) ) /
%        ( 1 + ALPHA * ( N - 2 ) - ALPHA^2 * ( N - 1 ) )
%    else
%      A(I,J) = - ALPHA /
%        ( 1 + ALPHA * ( N - 2 ) - ALPHA^2 * ( N - 1 ) )
%
%  Example:
%
%    N = 5, ALPHA = 2.0
%
%   -0.7778    0.2222    0.2222    0.2222    0.2222
%    0.2222   -0.7778    0.2222    0.2222    0.2222
%    0.2222    0.2222   -0.7778    0.2222    0.2222
%    0.2222    0.2222    0.2222   -0.7778    0.2222
%    0.2222    0.2222    0.2222    0.2222   -0.7778
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
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

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
