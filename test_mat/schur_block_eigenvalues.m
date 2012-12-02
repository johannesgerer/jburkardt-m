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
%    Input, real X( (N+1)/2 ), specifies the diagonal 
%    elements of A.
%
%    Input, real Y( N/2 ), specifies the off-diagonal 
%    elements of the Schur blocks.
%
%    Output, complex LAMBDA(N), the eigenvalues of A.
%
  k = 0;
  for i = 1 : floor ( n / 2 )
    k = k + 1
    lambda(k) = complex ( x(i),   y(i) );
    k = k + 1
    lambda(k) = complex ( x(i), - y(i) );
  end

  if ( k < n )
    k = k + 1;
    lambda(k) = x(floor ( (n+1)/2 ) );
  end

  return
end
