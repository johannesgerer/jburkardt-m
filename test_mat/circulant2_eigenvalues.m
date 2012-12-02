function lambda = circulant2_eigenvalues ( n, x )

%*****************************************************************************80
%
%% CIRCULANT2_EIGENVALUES returns the eigenvalues of the CIRCULANT2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    x(i) = i;
  end

  w = c8vec_unity ( n );

  lambda(1:n) =  x(n);
  for i = n-1 : -1 : 1
    lambda(1:n) = lambda(1:n) .* w(1:n) + x(i);
  end

  return
end
