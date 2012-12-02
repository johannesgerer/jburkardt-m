function lambda = combin_eigenvalues ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_EIGENVALUES returns the eigenvalues of the combinatorial matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define A.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n-1) = alpha;
  lambda(n) = alpha + n * beta;

  return
end
