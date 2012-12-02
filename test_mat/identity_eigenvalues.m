function lambda = identity_eigenvalues ( n )

%*****************************************************************************80
%
%% IDENTITY_EIGENVALUES returns the eigenvalues of the identity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n) = 1.0;

  return
end
