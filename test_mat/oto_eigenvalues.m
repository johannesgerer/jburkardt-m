function lambda = oto_eigenvalues ( n )

%*****************************************************************************80
%
%% OTO_EIGENVALUES returns the eigenvalues of the OTO matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = i * pi / ( 2 * ( n + 1 ) );
    lambda(i) = 4.0 * ( sin ( angle ) )^2;
  end

  return
end
