function lambda = downshift_eigenvalues ( n )

%*****************************************************************************80
%
%% DOWNSHIFT_EIGENVALUES returns the eigenvalues of the DOWNSHIFT matrix.
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
  lambda(1:n,1) = c8vec_unity ( n );

  return
end
