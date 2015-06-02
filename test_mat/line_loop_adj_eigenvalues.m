function lam = line_loop_adj_eigenvalues ( n )

%*****************************************************************************80
%
%% LINE_LOOP_ADJ_EIGENVALUES: the eigenvalues of the LINE_LOOP_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAM(N,1), the eigenvalues.
%
  lam = zeros ( n, 1 );

  for i = 1 : n
    angle = i * pi / ( n + 1 );
    lam(i) = 1.0 + 2.0 * cos ( angle );
  end

  return
end
