function lambda = minij_eigenvalues ( n )

%*****************************************************************************80
%
%% MINIJ_EIGENVALUES returns the eigenvalues of the MINIJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 2 * n + 1 );
    lambda(i,1) = 0.5 / ( 1.0 - cos ( angle ) );
  end

  return
end
