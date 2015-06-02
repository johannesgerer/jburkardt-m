function v = symm_random_eigen_left ( n, d, key )

%*****************************************************************************80
%
%% SYMM_RANDOM_EIGEN_LEFT returns the left eigenvectors for SYMM_RANDOM.
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
%    Input, integer N, the order of A.
%
%    Input, real D(N), the desired eigenvalues for the matrix.
%
%    Input, integer KEY, a positive integer that selects the data.
%
%    Output, real V(N,N), the matrix.
%
  v = orth_random ( n, key );
  v = v';

  return
end
