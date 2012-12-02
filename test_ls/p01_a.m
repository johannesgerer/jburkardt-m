function a = p01_a ( m, n )

%*****************************************************************************80
%
%% P01_A returns the matrix A for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
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
    a(i,1) = 1.0;
    for j = 2 : n
      a(i,j) = a(i,j-1) * i;
    end
  end

  return
end
