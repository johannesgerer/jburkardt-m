function lambda = idem_random_eigenvalues ( n, rank )

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
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:rank) = 1.0;
  lambda(rank+1:n) = 0.0;

  return
end
