function a = line_adj_eigen_right ( n )

%*****************************************************************************80
%
%% LINE_ADJ_EIGEN_RIGHT returns the right eigenvectors of the LINE_ADJ matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the right eigenvector matrix.
%
  a = zeros ( n, n );

  for i = 1: n
    for j = 1 : n
      angle = ( i * j ) * pi / ( n + 1 );
      a(i,j) = sqrt ( 2.0 / ( n + 1 ) ) * sin ( angle );
    end
  end

  return
end
