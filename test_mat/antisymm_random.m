function [ a, seed ] = antisymm_random ( n, seed )

%*****************************************************************************80
%
%% ANTISYMM_RANDOM returns a random antisymmetric matrix.
%
%  Example:
%
%    N = 5
%
%     0.0000  -0.1096   0.0813   0.9248   -0.0793
%     0.1096   0.0000   0.1830   0.1502    0.8244
%    -0.0813  -0.1830   0.0000   0.0899   -0.2137
%    -0.9248  -0.1502  -0.0899   0.0000   -0.4804
%     0.0793  -0.8244   0.2137   0.4804    0.0000
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is antisymmetric: A' = -A.
%
%    Because A is antisymmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The diagonal of A is zero.
%
%    All the eigenvalues of A are imaginary.
%
%    If N is odd, then det ( A ) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );
  
  a = r8mat_diag_set_scalar ( n, a, 0.0 );

  for i = 1 : n
    for j = i+1 : n
      [ t, seed ] = r8_uniform_01 ( seed );
      a(i,j) = 2.0 * t - 1.0;
      a(j,i) = - a(i,j);
    end
  end

  return
end

