function a = cauchy ( n, x, y )

%*****************************************************************************80
%
%% CAUCHY returns the Cauchy matrix.
%
%  Formula:
%
%    A(I,J) = 1.0D+00 / ( X(I) + Y(J) )
%
%  Example:
%
%    N = 5, X = ( 1, 3, 5, 8, 7 ), Y = ( 2, 4, 6, 10, 9 )
%
%    1/3  1/5  1/7  1/11 1/10
%    1/5  1/7  1/9  1/13 1/12
%    1/7  1/9  1/11 1/15 1/14
%    1/10 1/12 1/14 1/18 1/17
%    1/9  1/11 1/13 1/17 1/16
%
%    or, in decimal form,
%
%    0.333333      0.200000      0.142857      0.0909091     0.100000
%    0.200000      0.142857      0.111111      0.0769231     0.0833333
%    0.142857      0.111111      0.0909091     0.0666667     0.0714286
%    0.100000      0.0833333     0.0714286     0.0555556     0.0588235
%    0.111111      0.0909091     0.0769231     0.0588235     0.0625000
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is totally positive if 0 < X(1) < ... < X(N) and 0 < Y1 < ... < Y(N).
%
%    A will be singular if any X(I) equals X(J), or
%    any Y(I) equals Y(J), or if any X(I)+Y(J) equals zero.
%
%    A is generally not normal: A' * A /= A * A'.
%
%    The Hilbert matrix is a special case of the Cauchy matrix.
%
%    The Parter matrix is a special case of the Cauchy matrix.
%
%    The Ris or "ding-dong" matrix is a special case of the Cauchy matrix.
%
%    det ( A ) = product ( 1 <= I < J <= N ) ( X(J) - X(I) )* ( Y(J) - Y(I) )
%           / product ( 1 <= I <= N, 1 <= J <= N ) ( X(I) + Y(J) )
%
%    The inverse of A is
%
%      INVERSE(A)(I,J) = product ( 1 <= K <= N ) [ (X(J)+Y(K)) * (X(K)+Y(I)) ] /
%            [ (X(J)+Y(I)) * product ( 1 <= K <= N, K /= J ) (X(J)-X(K))
%                          * product ( 1 <= K <= N, K /= I ) (Y(I)-Y(K)) ]
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
%    Robert Gregory, David Karney,
%    Example 3.26,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 54, 
%    LC: QA263.G68.
%
%    Nicholas Higham,
%    Accuracy and Stability of Numerical Algorithms,
%    SIAM, 1996.
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms, Second Edition
%    Addison-Wesley, Reading, Massachusetts, 1973, page 36.
%
%    Olga Taussky, Marvin Marcus,
%    Eigenvalues of finite matrices,
%    in Survey of Numerical Analysis, 
%    Edited by John Todd,
%    McGraw-Hill, New York, pages 279-313, 1962.
%
%    Evgeny Tyrtyshnikov,
%    Cauchy-Toeplitz matrices and some applications,
%    Linear Algebra and Applications,
%    Volume 149, 1991, pages 1-18.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), Y(N), vectors that determine A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n

    for j = 1 : n

      if ( x(i) + y(j) == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'CAUCHY - Fatal error!\n' );
        fprintf ( 1, '  The denominator X(I)+Y(J) was zero\n' );
        fprintf ( 1, '  for I = %d\n', i );
        fprintf ( 1, '  X(I)  = %f\n', x(i) );
        fprintf ( 1, '  and J = %d\n', j );
        fprintf ( 1, '  Y(J)  = %d\n', y(j) );
        error ( 'CAUCHY - Fatal error!' );
      end

      a(i,j) = 1.0 / ( x(i) + y(j) );

    end
  end

  return
end
