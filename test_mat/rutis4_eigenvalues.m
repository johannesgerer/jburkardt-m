function lambda = rutis4_eigenvalues ( n )

%*****************************************************************************80
%
%% RUTIS4_EIGENVALUES returns the eigenvalues of the Rutishauser4 matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = ( i ) * pi / ( 2 * ( n + 1 ) );
    lambda(i) = 64.0 * ( cos ( angle ) )^6;
  end

  return
end
