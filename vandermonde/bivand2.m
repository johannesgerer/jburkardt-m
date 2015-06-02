function a = bivand2 ( n, alpha, beta )

%*****************************************************************************80
%
%% BIVAND2 returns a bidimensional Vandermonde2 matrix.
%
%  Discussion:
%
%    N = 3, ALPHA = ( 1, 2, 3 ), BETA = ( 10, 20, 30 )
%
%    (x,y)   | (1,10) (2,10) (3,10) (1,20) (2,20) (3,20) (1,30) (2,30) (3,30)
%    --------+---------------------------------------------------------------
%    1       |     1      1      1      1      1      1      1      1      1  
%    x       |     1      2      3      1      2      1      1      2      3
%    x^2     |     1      4      9      1      4      1      1      4      9
%       y    |    10     10     10     20     20     20     30     30     30
%    x  y    |    10     20     30     20     40     60     30     60     90
%    x^2y    |    10     40     90     20     80    180     30    120    270
%       y^2  |   100    100    100    400    400    400    900    900    900
%    x  y^2  |   100    200    300    400    800   1200    900   1800   2700
%    x^2y^2  |   100    400    900    400   1600   3600    900   3600   8100
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the data vectors.
%
%    Input, real ALPHA(N), BETA(N), the values that define A.
%
%    Output, real A(N^2,N^2), the matrix.
%
  nn = n * n;
  a = zeros ( nn, nn );

  i = 0
  for iy = 1 : n
    for ix = 1 : n
      i = i + 1;
      j = 0;
      for jy = 1 : n
        for jx = 1 : n
          j = j + 1;
          a(i,j) = alpha(jx) ^ ( ix - 1 ) * beta(jy) ^ ( iy - 1 );
        end
      end
    end
  end

  return
end
