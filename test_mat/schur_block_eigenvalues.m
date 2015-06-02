function lambda = schur_block_eigenvalues ( n, x, y )

%*****************************************************************************80
%
%% SCHUR_BLOCK_EIGENVALUES returns the eigenvalues of the SCHUR_BLOCK matrix.
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
%    Input, real X( (N+1)/2, 1 ), specifies the diagonal 
%    elements of A.
%
%    Input, real Y( N/2, 1 ), specifies the off-diagonal 
%    elements of the Schur blocks.
%
%    Output, complex LAMBDA(N,1), the eigenvalues of A.
%
  lambda = zeros ( n, 1 );

  x = x(:);
  y = y(:);

  k = 0;
  for i = 1 : floor ( n / 2 )
    k = k + 1
    lambda(k,1) = complex ( x(i,1),   y(i,1) );
    k = k + 1
    lambda(k,1) = complex ( x(i,1), - y(i,1) );
  end

  if ( k < n )
    k = k + 1;
    lambda(k,1) = x(floor ( (n+1)/2 ),1 );
  end

  return
end
