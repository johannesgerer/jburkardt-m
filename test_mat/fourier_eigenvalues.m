function lambda = fourier_eigenvalues ( n )

%*****************************************************************************80
%
%% FOURIER_EIGENVALUES returns the eigenvalues of the FOURIER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1,1) = 1.0;

  lambda(2:4:n,1) = - 1.0;
  lambda(3:4:n,1) =   i;
  lambda(4:4:n,1) =   1.0;
  lambda(5:4:n,1) = - i;

  return
end
