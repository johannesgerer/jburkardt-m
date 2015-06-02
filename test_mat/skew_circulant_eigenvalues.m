function lambda = skew_circulant_eigenvalues ( n, x )

%*****************************************************************************80
%
%% SKEW_CIRCULANT_EIGENVALUES returns eigenvalues of the SKEW_CIRCULANT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N,1), the values in the first row of A.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  x = x(:);

  for j = 1 : n
    for k = 1 : n
      angle = ( 2 * j - 1 ) * pi * ( k - 1 ) / n;
      lambda(j,1) = lambda(j,1) + x(k,1) * complex ( cos ( angle ), sin ( angle ) );
    end
  end

  return
end
