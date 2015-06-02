function lambda = upshift_eigenvalues ( n )

%*****************************************************************************80
%
%% UPSHIFT_EIGENVALUES returns the eigenvalues of the UPSHIFT matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n,1) = c8vec_unity ( n );

  return
end
