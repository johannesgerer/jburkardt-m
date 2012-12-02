function lambda = dif2_eigenvalues ( n )

%*****************************************************************************80
%
%% DIF2_EIGENVALUES returns the eigenvalues of the second difference matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = i * pi / ( 2 * ( n + 1 ) );
    lambda(i) = 4.0 * ( sin ( angle ) )^2;
  end

  return
end
