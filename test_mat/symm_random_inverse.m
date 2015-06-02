function b = symm_random_inverse ( n, d, key )

%*****************************************************************************80
%
%% SYMM_RANDOM_INVERSE returns the inverse of the SYMM_RANDOM matrix.
%
%  Discussion:
%
%    The input value of SEED must be the same as the input value used
%    when defining the original matrix.
%
%    For the inverse to exist, no entry of D may be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real D(N), the desired eigenvalues for the matrix.
%
%    Input, integer KEY, a positive integer that selects the data.
%
%    Output, real B(N,N), the matrix.
%

%
%  Get a random orthogonal matrix Q.
%
  q = orth_random ( n, key );
%
%  Set B = Q * 1/Lambda * Q'.
%
  l_inv = diag ( 1.0 ./ d );

  b = q * l_inv * q';

  return
end