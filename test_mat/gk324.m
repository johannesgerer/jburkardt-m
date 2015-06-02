function a = gk324 ( m, n, x )

%*****************************************************************************80
%
%% GK324 returns the GK324 matrix.
%
%  Discussion:
%
%    This is Gregory and Karney example matrix 3.24.
%
%  Example:
%
%    M = N = 5
%
%    X = ( 11, 12, 13, 14 )
%
%     1  1  1  1  1
%    11  1  1  1  1
%    11 12  1  1  1
%    11 12 13  1  1
%    11 12 13 14  1
%
%  Properties:
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 51, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, 
%    * real X(N-1), the first N-1 entries of the
%      last row, if M <= N, 
%    or 
%    * real X(N), the N entries of the last row,
%      if N < M.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n
      if ( i <= j )
        a(i,j) = 1.0;
      else
        a(i,j) = x(j);
      end
    end
  end

  return
end

