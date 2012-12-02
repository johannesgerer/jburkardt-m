function lambda = smoke_eigenvalues ( n )

%*****************************************************************************80
%
%% SMOKE_EIGENVALUES returns the eigenvalues of the SMOKE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = 2.0 * pi * i / n;
    lambda(i) = complex ( cos ( angle ), sin ( angle ) );
  end

  lambda(1:n) = lambda(1:n) * 2^( 1.0 / n );

  return
end
