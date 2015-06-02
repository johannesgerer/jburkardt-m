function a = bivand1 ( n, alpha, beta )

%*****************************************************************************80
%
%% BIVAND1 returns a bidimensional Vandermonde1 matrix.
%
%  Discussion:
%
%    N = 3, ALPHA = ( 1, 2, 3 ), BETA = ( 10, 20, 30 )
%
%    (x,y)   | (1,10)  (2,10)  (3,10)  (1,20)  (2,20)  (1,30)
%    --------+-----------------------------------------------
%    1       |     1       1       1       1       1       1  
%    x       |     1       2       3       1       2       1
%       y    |    10      10      10      20      20      30
%    x^2     |     1       4       9       1       4       1
%    x  y    |    10      20      30      20      40      30
%    x^2y^2  |   100     100     100     400     400     900
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 November 2013
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
%    Output, real A(((N+1)*N)/2,((N+1)*N)/2), the matrix.
%
  nn = ( ( n + 1 ) * n ) / 2;
  a = zeros ( nn, nn );

  e1 = 0;
  e2 = 0;
  e = 0;

  for ii = 1 : nn

    j1 = 1;
    j2 = 1;

    for jj = 1 : nn

      if ( ii == 1 )
        a(ii,jj) = 1.0;
      else
        a(ii,jj) = alpha(j1) ^ e1 * beta(j2) ^ e2;
      end

      if ( j1 + j2 < n + 1 )
        j1 = j1 + 1;
      else
        j1 = 1;
        j2 = j2 + 1;
      end

    end

    if ( e2 < e )
      e1 = e1 - 1;
      e2 = e2 + 1;
    else
      e = e + 1;
      e1 = e;
      e2 = 0;
    end

  end

  return
end
