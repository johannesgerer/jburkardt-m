function lambda = givens_eigenvalues ( n )

%*****************************************************************************80
%
%% GIVENS_EIGENVALUES returns the eigenvalues of the GIVENS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 4 * n );
    lambda(i,1) = 0.5 / ( cos ( angle ) )^2;
  end

  return
end
