function lambda = eberlein_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% EBERLEIN_EIGENVALUES returns the eigenvalues of the EBERLEIN matrix.
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
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    lambda(1:n,1) = - ( i - 1 ) *. ( alpha + i );
  end

  return
end
