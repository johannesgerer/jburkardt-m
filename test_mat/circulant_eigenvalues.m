function lambda = circulant_eigenvalues ( n, x )

%*****************************************************************************80
%
%% CIRCULANT_EIGENVALUES returns the eigenvalues of a real circulant matrix.
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
%    Input, real X(N), the values in the first row of A.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  w = c8vec_unity ( n );

  lambda(1:n) =  x(n);
  for i = n-1 : -1 : 1
    lambda(1:n) = lambda(1:n) .* w(1:n) + x(i);
  end

  return
end
