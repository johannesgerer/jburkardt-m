function [ x, w ] = bdfc_set ( n )

%*****************************************************************************80
%
%% BDFC_SET sets weights for backward differentiation corrector quadrature.
%
%  Definition:
%
%    A backward differentiation corrector formula is defined for a set
%    of evenly spaced abscissas X(I) with X(1) = 1 and X(2) = 0.  Assuming
%    that the values of the function to be integrated are known at the
%    abscissas, the formula is written in terms of the function value at
%    X(1), and the backward differences at X(1) that approximate the
%    derivatives there.
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * BD**(I-1) F ( 1 ).
%
%    Here, "BD**(I-1) F ( 1 )" denotes the (I-1)st backward difference
%    of F at X = 1, using a spacing of 1.  In particular,
%
%    BD**0 F(1) = F(1)
%    BD**1 F(1) = F(1) - F(0)
%    BD**2 F(1) = F(1) - 2 * F(0) + F(-1 )
%
%
%    The relationship between a backward difference corrector and the
%    corresponding Adams-Moulton formula may be illustrated for the
%    BDF corrector of order 4:
%
%      BD**0 F(1) - 1/2 * BD**1 F(1) - 1/12 * BD**2 F(1) - 1/24 * BDF**3 F(1)
%      =            F(1)
%        -  1/2 * ( F(1) -         F(0) )
%        - 1/12 * ( F(1) - 2     * F(0) +        F(-1) )
%        - 1/24 * ( F(1) - 3     * F(0) + 3    * F(-1) -        F(-2) )
%      =   9/24 *   F(1) + 19/24 * F(0) - 5/24 * F(-1) + 1/24 * F(-2)
%
%    which is the Adams-Moulton formula of order 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Simeon Fatunla,
%    Numerical Methods for Initial Value Problems in Ordinary Differential
%      Equations,
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

  order_max = 19;

  w_save(1) =                 1.0;
  w_save(2) =               - 1.0 /               2.0;
  w_save(3) =               - 1.0 /              12.0;
  w_save(4) =               - 1.0 /              24.0;
  w_save(5) =              - 19.0 /             720.0;
  w_save(6) =               - 3.0 /             160.0;
  w_save(7) =             - 863.0 /           60480.0;
  w_save(8) =             - 275.0 /           24792.0;
  w_save(9) =           - 33953.0 /         3628800.0;
  w_save(10) =           - 8183.0 /         1036800.0;
  w_save(11) =        - 3250433.0 /       479001600.0;
  w_save(12) =           - 4671.0 /          788480.0;
  w_save(13) =    - 13695779093.0 /   2615348736000.0;
  w_save(14) =     - 2224234463.0 /    475517952000.0;
  w_save(15) =   - 132282840127.0 /  31384184832000.0;
  w_save(16) =     - 2639651053.0 /    689762304000.0;
  w_save(17) =  111956703448001.0 /   3201186852864.0;
  w_save(18) =         50188465.0 /     15613165568.0;
  w_save(19) = 2334028946344463.0 / 786014494949376.0;

  if ( order_max < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BDFC_SET - Fatal error!\n' );
    fprintf ( 1, '  Input order %d exceeds maximum %d\n', n, order_max );
    error ( 'BDFC_SET - Fatal error!' );
  end

  for i = 1 : n
    w(i) = w_save(i);
  end

  for i = 1 : n
    x(i) = ( 2 - i );
  end

  return
end
