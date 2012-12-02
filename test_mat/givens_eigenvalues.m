function lambda = givens_eigenvalues ( n )

%*****************************************************************************80
%
%% GIVENS_EIGENVALUES returns the eigenvalues of the Givens matrix.
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
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 4 * n );
    lambda(i) = 0.5 / ( cos ( angle ) )^2;
  end

  return
end
