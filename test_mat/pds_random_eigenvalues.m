function lambda = pds_random_eigenvalues ( n, key )

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
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  seed = key;
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );

  return
end
