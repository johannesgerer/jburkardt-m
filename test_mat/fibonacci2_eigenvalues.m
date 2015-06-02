function lambda = fibonacci2_eigenvalues ( n )

%*****************************************************************************80
%
%% FIBONACCI2_EIGENVALUES returns the eigenvalues of the FIBONACCI2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  if ( n == 1 )

    lambda(1,1) = 0.0;

  else

    phi = 0.5 * ( 1.0 + sqrt ( 5.0 ) );

    phi(1)          = phi;
    lambda(2:n-1,1) = 1.0;
    lambda(n,1)     = 1.0 - phi;

  end

  return
end
