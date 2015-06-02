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
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i,1) = i;
  end

  w(1:n,1) = c8vec_unity ( n );

  lambda(1:n,1) =  x(n,1);
  for i = n-1 : -1 : 1
    lambda(1:n,1) = lambda(1:n,1) .* w(1:n,1) + x(i,1);
  end

  return
end
