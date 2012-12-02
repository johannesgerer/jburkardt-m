function lambda = invol_eigenvalues ( n )

%*****************************************************************************80
%
%% INVOL_LAMBDA returns the eigenvalues of the INVOL matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
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
  k = floor ( n / 2 );

  lambda(1:k) =   +1.0;
  lambda(k+1:n) = -1.0;

  return
end
