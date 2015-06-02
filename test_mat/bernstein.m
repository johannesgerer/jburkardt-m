function a = bernstein ( n )

%*****************************************************************************80
%
%% BERNSTEIN returns the BERNSTEIN matrix.
%
%  Discussion:
%
%    The Bernstein matrix of order N is an NxN matrix A which can be used to
%    transform a vector of power basis coefficients C representing a polynomial 
%    P(X) to a corresponding Bernstein basis coefficient vector B:
%
%      B = A * C
%
%    The N power basis vectors are ordered as (1,X,X^2,...X^(N-1)) and the N 
%    Bernstein basis vectors as ((1-X)^(N-1), X*(1_X)^(N-2),...,X^(N-1)).
%
%  Example:
%
%    N = 5
%
%    1    -4     6    -4     1
%    0     4   -12    12    -4
%    0     0     6   -12     6
%    0     0     0     4    -4
%    0     0     0     0     1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the Bernstein matrix.
%
  a = zeros ( n, n );

  n0 = n - 1;

  for j0 = 0 : n0
    for i0 = 0 : j0
      a(i0+1,j0+1) = r8_mop ( j0 - i0 ) * r8_choose ( n0 - i0, j0 - i0 ) ...
        * r8_choose ( n0, i0 );
    end
  end

  return
end
