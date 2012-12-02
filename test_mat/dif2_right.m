function a = dif2_right ( n )

%*****************************************************************************80
%
%% DIF2_RIGHT returns the right eigenvectors of the second difference matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2007
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
  for i = 1: n
    for j = 1 : n
      angle = ( i * j ) * pi / ( n + 1 );
      a(i,j) = sqrt ( 2.0 / ( n + 1 ) ) * sin ( angle );
    end
  end

  return
end
