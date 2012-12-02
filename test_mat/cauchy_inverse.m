function a = cauchy_inverse ( n, x, y )

%*****************************************************************************80
%
%% CAUCHY_INVERSE returns the inverse of the Cauchy matrix.
%
%  Formula:
%
%    A(I,J) = product ( 1 <= K <= N ) [(X(J)+Y(K))*(X(K)+Y(I))] /
%      [ (X(J)+Y(I)) * product ( 1 <= K <= N, K /= J ) (X(J)-X(K))
%                    * product ( 1 <= K <= N, K /= I ) (Y(I)-Y(K)) ]
%
%  Example:
%
%    N = 5, X = ( 1, 3, 5, 8, 7 ), Y = ( 2, 4, 6, 10, 9 )
%
%       241.70      -2591.37       9136.23      10327.50     -17092.97
%     -2382.19      30405.38    -116727.19    -141372.00     229729.52
%      6451.76     -89667.70     362119.56     459459.00    -737048.81
%     10683.11    -161528.55     690983.38     929857.44   -1466576.75
%    -14960.00     222767.98    -942480.06   -1253376.00    1983696.00
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The sum of the entries of A equals the sum of the entries of X and Y.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms, Second Edition,
%    Addison-Wesley, Reading, Massachusetts, 1973, page 36.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), Y(N), vectors that determine A.
%    The following conditions on X and Y must hold:
%
%      X(I)+Y(J) must not be zero for any I and J;
%      X(I) must never equal X(J);
%      Y(I) must never equal Y(J).
%
%    Output, real A(N,N), the matrix.
%

%
%  Check the data.
%
  for i = 1 : n
    for j = 1 : n

      if ( x(i) + y(j) == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'CAUCHY_INVERSE - Fatal error!\n' );
        fprintf ( 1, '  The denominator X(I)+Y(J) was zero\n' );
        fprintf ( 1, '  for I = %d\n', i );
        fprintf ( 1, '  and J = %d\n', j );
        error ( 'CAUCHY_INVERSE - Fatal error!' );
      end

      if ( i ~= j & x(i) == x(j) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'CAUCHY_INVERSE - Fatal error!\n' );
        fprintf ( 1, '  X(I) equals X(J)\n' );
        fprintf ( 1, '  for I = %d\n', i );
        fprintf ( 1, '  and J = %d\n', j );
        error ( 'CAUCHY_INVERSE - Fatal error!' );
      end

      if ( i ~= j & y(i) == y(j) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'CAUCHY_INVERSE - Fatal error!\n' );
        fprintf ( 1, '  Y(I) equals Y(J)\n' );
        fprintf ( 1, '  for I = %d\n', i );
        fprintf ( 1, '  and J = %d\n', j );
        error ( 'CAUCHY_INVERSE - Fatal error!' );
      end

    end
  end

  for i = 1 : n
    for j = 1 : n

      top = 1.0;
      bot1 = 1.0;
      bot2 = 1.0;

      for k = 1 : n

        top = top * ( x(j) + y(k) ) * ( x(k) + y(i) );

        if ( k ~= j )
          bot1 = bot1 * ( x(j) - x(k) );
        end

        if ( k ~= i )
          bot2 = bot2 * ( y(i) - y(k) );
        end

      end

      a(i,j) = top / ( ( x(j) + y(i) ) * bot1 * bot2 );

    end
  end

  return
end
