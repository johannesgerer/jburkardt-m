function a = p06_a ( m, n )

%*****************************************************************************80
%
%% P06_A returns the matrix A for problem 6.
%
%  Discussion:
%
%    A is a symmetric, orthogonal matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of equations.
%
%    Input, integer N, the number of variables.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      angle = i * j * pi / ( n + 1 );
      a(i,j) = sin ( angle );
    end
  end

  a(1:m,1:n) = a(1:m,1:n) * sqrt ( 2.0 / ( n + 1 ) );

  return
end
