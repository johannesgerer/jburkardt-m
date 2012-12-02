function [ x, w ] = bdfp_set ( n )

%*****************************************************************************80
%
%% BDFP_SET sets weights for backward differentiation predictor quadrature.
%
%  Discussion:
%
%    A backward differentiation predictor formula is defined for a set
%    of evenly spaced abscissas X(I) with X(1) = 1 and X(2) = 0.  Assuming
%    that the values of the function to be integrated are known at the
%    abscissas, the formula is written in terms of the function value at
%    X(2), and the backward differences at X(2) that approximate the
%    derivatives there.  A backward differentiation predictor formula
%    is equivalent to an Adams-Bashforth formula of the same order.
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * BD**(I-1) F ( 0 ),
%
%    Here, "BD**(I-1) F ( 0 )" denotes the (I-1)st backward difference
%    of F at X = 0, using a spacing of 1.  In particular,
%
%    BD**0 F(0) = F(0)
%    BD**1 F(0) = F(0) - F(-1)
%    BD**2 F(0) = F(0) - 2 * F(-1) + F(-2 )
%
%    The relationship between a backward difference predictor and the
%    corresponding Adams-Bashforth formula may be illustrated for the
%    BDF predictor of order 3:
%
%      BD**0 F(0) + 0.5 * BD**1 F(0) + 5/12 * BD**2 F(0)
%      =            F(0)
%        + 1/2  * ( F(0) -         F(1) )
%        + 5/12 * ( F(0) - 2     * F(-1) +      F(-2) )
%      =  23/12 *   F(0) - 16/12 * F(-1) + 5/12 F(-2)
%
%    which is the Adams-Bashforth formula of order 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Simeon Fatunla,
%    Numerical Methods for Initial Value Problems in Ordinary Differential
%    Equations,
%    Academic Press, 1988.
%
%  Parameters:
%
%    Input, integer N, the order.
%    1 <= N <= 19.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  n_max = 19;

  w_save(1) =                       1.0;
  w_save(2) =                       1.0 /                2.0;
  w_save(3) =                       5.0 /               12.0;
  w_save(4) =                       3.0 /                8.0;
  w_save(5) =                     251.0 /              720.0;
  w_save(6) =                      95.0 /              288.0;
  w_save(7) =                   19087.0 /            60480.0;
  w_save(8) =                    5257.0 /            17280.0;
  w_save(9) =                 1070017.0 /          3628800.0;
  w_save(10) =                  25713.0 /            89600.0;
  w_save(11) =               26842253.0 /         95800320.0;
  w_save(12) =                4777223.0 /         17418240.0;
  w_save(13) =           703604254357.0 /    2615348736000.0;
  w_save(14) =           106364763817.0 /     402361344000.0;
  w_save(15) =          1166309819657.0 /    4483454976000.0;
  w_save(16) =               25221445.0 /         98402304.0;
  w_save(17) =       8092989203533249.0 /    3201186852864.0;
  w_save(18) =         85455477715379.0 /      34237292544.0;
  w_save(19) =   12600467236042756559.0 / 5109094217170944.0;

  if ( n_max < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BDFP_SET - Fatal error!\n' );
    fprintf ( 1, '  N = %d exceeds N_MAX = %d\n', n, n_max );
    error ( 'BDFP_SET - Fatal error!' );
  end

  w(1:n) = w_save(1:n);

  for i = 1 : n
    x(i) = 1 - i;
  end

  return
end
