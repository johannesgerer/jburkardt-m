function sandia_rules_test32 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST32 tests HCC_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2011
%
%  Author:
%
%    John Burkardt
%
  m = 11;
  n = 2 * m;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST32:\n' );
  fprintf ( 1, '  HCC_COMPUTE returns a quadrature rule\n' );
  fprintf ( 1, '  for piecewise Hermite cubic splines which are based\n' );
  fprintf ( 1, '  on Chebyshev-spaced function and derivative data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we compute a rule of order N = %d\n', n );

  [ x, w ] = hcc_compute ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X(I)        W(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %10f  %10f\n', i, x(i), w(i) );
  end

  return
end
