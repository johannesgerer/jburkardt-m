function lambda = hanowa_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% HANOWA_EIGENVALUES returns the eigenvalues of the HANOWA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the Hanowa matrix.  A
%    typical value is -1.0.
%
%    Input, integer N, the order of A.  N must be even.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HANOWA_EIGENVALUES - Fatal error!\n' );
    fprintf ( 1, '  Input N = %d\n', n );
    fprintf ( 1, '  but N must be a multiple of 2.\n' );
    error ( 'HANOWA_EIGENVALUES - Fatal error!' );
  end

  for i = 1 : floor ( n / 2 )
    lambda(2*i-1,1) = complex ( alpha,   i );
    lambda(2*i,1  ) = complex ( alpha, - i );
  end

  return
end
