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
%    Input, real X(N), the values in the first row of A.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  lambda(1:n) = 0.0;

  for j = 1 : n
    for k = 1 : n
      angle = ( 2 * j - 1 ) * pi * ( k - 1 ) / n;
      lambda(j) = lambda(j) + x(k) * complex ( cos ( angle ), sin ( angle ) );
    end
  end

  return
end
