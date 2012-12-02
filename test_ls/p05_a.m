function a = p05_a ( m, n )

%*****************************************************************************80
%
%% P05_A returns the matrix A for problem 5.
%
%  Discussion:
%
%    A is the Hilbert matrix.
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
  for j = 1 : n
    for i = 1 : m
      a(i,j) = 1.0 / ( i + j - 1 );
    end
  end

  return
end
