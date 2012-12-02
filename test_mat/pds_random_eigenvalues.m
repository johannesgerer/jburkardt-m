function [ lambda, seed ] = pds_random_eigenvalues ( n, seed )

%*****************************************************************************80
%
%% PDS_RANDOM_EIGENVALUES returns the eigenvalues of the PDS_RANDOM matrix.
%
%  Discussion:
%
%    This routine will only work properly if the SAME value of SEED
%    is input that was input to PDS_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
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
%    Output, real LAMBDA(N), the eigenvalues.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );

  return
end
