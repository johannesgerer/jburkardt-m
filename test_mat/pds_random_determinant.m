function determ = pds_random_determinant ( n, key )

%*****************************************************************************80
%
%% PDS_RANDOM_DETERMINANT returns the determinant of the PDS_RANDOM matrix.
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
%    Output, real DETERM, the determinant.
%
  seed = key;
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );

  determ = prod ( lambda(1:n) );

  return
end
