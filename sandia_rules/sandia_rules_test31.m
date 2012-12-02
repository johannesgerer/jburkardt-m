function sandia_rules_test31 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST31 tests HCE_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2011
%
%  Author:
%
%    John Burkardt
%
  m = 11;
  n = 2 * m;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST31:\n' );
  fprintf ( 1, '  HCE_COMPUTE returns a quadrature rule\n' );
  fprintf ( 1, '  for piecewise Hermite cubic splines which are based\n' );
  fprintf ( 1, '  on equally spaced function and derivative data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we compute a rule of order N = %d\n', n );

  [ x, w ] = hce_compute ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X(I)        W(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %10f  %10f\n', i, x(i), w(i) );
  end

  return
end
