function quadrule_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests LEGENDRE_EK_COMPUTE and SUM_SUB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
  n = 2;

  a = 0.0;
  b = 1.0;

  xlo = -1.0;
  xhi = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  LEGENDRE_EK_COMPUTE computes a Gauss-Legendre rule;\n' );
  fprintf ( 1, '  SUM_SUB carries it out over subintervals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Here, we use a fixed order N = %d\n', n );
  fprintf ( 1, '  and use more and more subintervals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NSUB     Integral\n' );
  fprintf ( 1, '\n' );

  [ x, w ] = legendre_ek_compute ( n );

  for iexp = 0 : 9

    nsub = 2^iexp;

    result = sum_sub ( @fx2sd1, a, b, nsub, n, xlo, xhi, x, w );

    fprintf ( 1, '  %4d  %16f\n', nsub, result );

  end

  return
end
