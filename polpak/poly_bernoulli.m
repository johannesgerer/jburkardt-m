function b = poly_bernoulli ( n, k )

%*****************************************************************************80
%
%% POLY_BERNOULLI evaluates the poly-Bernolli numbers with negative index.
%
%  Discussion:
%
%    The poly-Bernoulli numbers B_n^k were defined by M Kaneko
%    formally as the coefficients of X^n/n% in a particular power
%    series.  He also showed that, when the super-index is negative,
%    we have
%
%      B_n^(-k) = Sum ( 0 <= j <= min ( n, k ) )
%        (j%)^2 * S(n+1,j+1) * S(k+1,j+1)
%
%    where S(n,k) is the Stirling number of the second kind, the number of
%    ways to partition a set of size n into k nonempty subset.
%
%    B_n^(-k) is also the number of "lonesum matrices", that is, 0-1
%    matrices of n rows and k columns which are uniquely reconstructable
%    from their row and column sums.
%
%    The poly-Bernoulli numbers get large very quickly.
%
%  Table:
%
%    \ K 0  1    2     3      4       5        6
%    N
%    0   1  1    1     1      1       1        1
%    1   1  2    4     8     16      32       64
%    2   1  4   14    46    146     454     1394
%    3   1  8   46   230   1066    4718    20266
%    4   1 16  146  1066   6902   41506   237686
%    5   1 32  454  4718  41506  329462  2441314
%    6   1 64 1394 20266 237686 2441314 22934774
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Chad Brewbaker,
%    Lonesum (0,1) Matrices and Poly-Bernoulli Numbers of Negative Index,
%    MS Thesis,
%    Iowa State University, 2005.
%
%    M Kaneko,
%    Poly-Bernoulli Numbers,
%    Journal Theorie des Nombres Bordeaux,
%    Volume 9, 1997, pages 221-228.
%
%  Parameters:
%
%    Input, integer N, K, the indices.  N and K should be nonnegative.
%
%    Output, integer B, the value of B_N^(-K).
%
  if ( n < 0 )
    b = 0;
    return
  elseif ( n == 0 ) 
    b = 1;
    return
  end

  if ( k < 0 )
    b = 0;
    return
  elseif ( k == 0 )
    b = 1;
    return
  end

  jhi = min ( n, k );
  m = max ( n, k ) + 1;

  s = stirling2 ( m, m );

  jfact = 1;
  b = 0;

  for j = 0 : jhi

    b = b + jfact * jfact * s(n+1,j+1) * s(k+1,j+1);

    jfact = jfact * ( j + 1 );

  end

  return
end
