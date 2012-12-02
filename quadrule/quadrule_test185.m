function quadrule_test195 ( )

%*****************************************************************************80
%
%% TEST185 compares LEGENDRE_EK_COMPUTE.
%
%  Discussion:
%
%    I used this test to generate tabular values of weights and
%    abscissas for Gauss-Legendre quadrature of orders 21 through 31.
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
  n = 31;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST185\n' );
  fprintf ( 1, '  LEGENDRE_EK_COMPUTE computes Gauss-Legendre data;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the data for N = %d\n', n );

  [ x, w ] = legendre_dr_compute ( n );

  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    x(%d) = %24.16e;\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    w(%d) = %24.16e;\n', i, w(i) );
  end

  return
end
