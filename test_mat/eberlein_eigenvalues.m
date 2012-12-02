function lambda = eberlein_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% EBERLEIN_EIGENVALUES returns the eigenvalues of the Eberlein matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n) = - ( 1:n - 1 ) *. ( alpha + 1:n );

  return
end
