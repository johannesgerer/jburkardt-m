function lambda = fibonacci3_eigenvalues ( n )

%*****************************************************************************80
%
%% FIBONACCI3_EIGENVALUES returns the eigenvalues of the FIBONACCI3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
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
    angle = i * pi / ( n + 1 );
    lambda(i) = complex ( 1.0, 2.0 * cos ( angle ) );
  end

  return
end
