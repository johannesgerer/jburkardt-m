function lambda = idem_random_eigenvalues ( n, rank, key )

%*****************************************************************************80
%
%% IDEM_RANDOM_EIGENVALUES returns the eigenvalues of the IDEM_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer RANK, the rank of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:rank,1) = 1.0;
  lambda(rank+1:n,1) = 0.0;

  return
end
