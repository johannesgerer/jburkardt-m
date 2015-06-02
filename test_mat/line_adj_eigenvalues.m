function lam = line_adj_eigenvalues ( n )

%*****************************************************************************80
%
%% LINE_ADJ_EIGENVALUES returns the eigenvalues of the LINE_ADJ matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real LAM(N), the eigenvalues.
%
  lam = zeros ( n, 1 );

  for i = 1 : n
    angle = i * pi / ( n + 1 );
    lam(i) = 2.0 * cos ( angle );
  end

  return
end
