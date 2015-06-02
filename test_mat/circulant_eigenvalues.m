function lambda = circulant_eigenvalues ( n, x )

%*****************************************************************************80
%
%% CIRCULANT_EIGENVALUES returns the eigenvalues of the CIRCULANT matrix.
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
%    Input, integer N, the number of rows and columns of A.
%
%    Input, real X(N,1), the values in the first row of A.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  x = x(:);

  w(1:n,1) = c8vec_unity ( n );

  lambda(1:n,1) =  x(n,1);
  for i = n - 1 : -1 : 1
    lambda(1:n,1) = lambda(1:n,1) .* w(1:n,1) + x(i,1);
  end

  return
end
