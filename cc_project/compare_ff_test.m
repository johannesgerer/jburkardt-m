function compare_ff_test ( n )

%*****************************************************************************80
%
%% COMPARE_FF_TEST compares Boyd's "FF" rule with a variety of known rules.
%
%  Discussion:
%
%    There are many quadrature rules that have some relationship to what is
%    called "Clenshaw Curtis" quadrature, and so I wanted to see, simply
%    by comparing values for a specific rule size, whether Boyd's rule
%    corresponded with a rule I am familiar with.
%
%    It matches the Fejer Type 2 rule, which approximates 
%      I(f) = integral ( -1 <= x <= 1 ) f(x) dx
%    with a quadrature rule
%      Q(f) = sum ( 1 <= i <= n ) w(i) f(x(i))
%    in which the points x(i) are the cosines of a set of n+2 angles
%    equally spaced between 0 and pi, but omitting 0 and pi themselves.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Boyd,
%    Exponentially convergent Fourier-Chebyshev quadrature schemes on
%    bounded and infinite intervals,
%    Journal of Scientific Computing,
%    Volume 2, Number 2, 1987, pages 99-109.
%
%  Parameters:
%
%    Input, integer N, the number of points to use in the rules.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPARE_FF_TEST:\n' );
  fprintf ( 1, '  Compare Boyd''s rule to similar rules.\n' );
  fprintf ( 1, '  From the results, Boyd''s rule is the same as F2\n' );
  fprintf ( 1, '  Use order N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Stand: "Standard" Clenshaw Curtis rule, endpoints.\n' );
  fprintf ( 1, '  FF:    Boyd''s rule for [-1,+1], rho = 1, no endpoints\n' );
  fprintf ( 1, '  CC1:   Clenshaw-Curtis 1, rho = 1/sqrt(1-x^2), no endpoints\n' );
  fprintf ( 1, '  CC2:   Clenshaw-Curtis 2, rho = sqrt(1-x^2), no endpoints\n' );
  fprintf ( 1, '  CC3:   Clenshaw-Curtis 3, rho = 1/sqrt(1-x^2), endpoints\n' );
  fprintf ( 1, '  F1:    Fejer 1, rho = 1, no endpoints\n' );
  fprintf ( 1, '  F2:    Fejer 2, rho = 1, no endpoints\n' );

  [ x1, w1 ] = cc_standard ( n );
  [ x2, w2 ] = ccff ( n );
  [ x3, w3 ] = chebyshev1_compute ( n );
  [ x4, w4 ] = chebyshev2_compute ( n );
  [ x5, w5 ] = chebyshev3_compute ( n );
  [ x6, w6 ] = fejer1_compute ( n );
  [ x7, w7 ] = fejer2_compute ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X:\n' );
  fprintf ( 1, '  Stand     FF    CC1    CC2    CC3     F1     F2\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f\n', ...
      x1(i), x2(i), x3(i), x4(i), x5(i), x6(i), x7(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  W:\n' );
  fprintf ( 1, '  Stand     FF    CC1    CC2    CC3     F1     F2\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f\n', ...
      w1(i), w2(i), w3(i), w4(i), w5(i), w6(i), w7(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f  %5.2f\n', ...
    sum ( w1 ), sum ( w2 ), sum ( w3 ), sum ( w4 ), sum ( w5 ), sum ( w6 ), sum ( w7 ) );

  return
end

