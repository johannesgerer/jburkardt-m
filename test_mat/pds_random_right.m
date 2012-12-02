function [ q, seed ] = pds_random_right ( n, seed )

%*****************************************************************************80
%
%% PDS_RANDOM_RIGHT returns the right eigenvectors of the PDS_RANDOM matrix.
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
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real Q(N,N), the matrix.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%

%
%  Get a random set of eigenvalues.
%
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Get a random orthogonal matrix Q.
%
  [ q, seed ] = orth_random ( n, seed );

  return
end
