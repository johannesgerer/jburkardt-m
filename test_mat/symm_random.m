function [ a, seed ] = symm_random ( n, x, seed )

%*****************************************************************************80
%
%% SYMM_RANDOM returns a "random" symmetric matrix with given eigenvalues.
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    The eigenvalues of A will be real.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the desired eigenvalues for the matrix.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real A(N,N), the matrix.
%

%
%  Get a random orthogonal matrix Q.
%
  [ q, seed ] = orth_random ( n, seed );
%
%  Set A = Q * Lambda * Q'.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = 0.0;
      for k = 1 : n
        a(i,j) = a(i,j) + q(i,k) * x(k) * q(j,k);
      end
    end
  end

  return
end
