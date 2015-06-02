function q = pds_random_eigen_right ( n, key )

%*****************************************************************************80
%
%% PDS_RANDOM_EIGEN_RIGHT returns the right eigenvectors of the PDS_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real Q(N,N), the matrix.
%

%
%  Get a random set of eigenvalues.
%
  seed = key;
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Get a random orthogonal matrix Q.
%
  q = orth_random ( n, key );

  return
end
