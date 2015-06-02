function a = symm_random ( n, d, key )

%*****************************************************************************80
%
%% SYMM_RANDOM returns the SYMM_RANDOM matrix.
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
%    17 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real D(N), the desired eigenvalues for the matrix.
%
%    Input, integer KEY, a positive integer that selects the data.
%
%    Output, real A(N,N), the matrix.
%

%
%  Get a random orthogonal matrix Q.
%
  q = orth_random ( n, key );
%
%  Set A = Q * Lambda * Q'.
%
  l = diag ( d );

  a = q * l * q';

  return
end
