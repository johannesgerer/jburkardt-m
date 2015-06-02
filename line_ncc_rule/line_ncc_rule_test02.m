function line_ncc_rule_test02 ( )

%*****************************************************************************80
%
%% LINE_NCC_RULE_TEST02 estimates the integral of exp(x) from 0 to 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 April 2014
%
%  Author:
%
%    John Burkardt
%
  a =  0.0;
  b = +1.0;
  exact = exp ( b ) - exp ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  Use a sequence of NCC rules to compute an estimate Q\n' );
  fprintf ( 1, '  of the integral:\n' );
  fprintf ( 1, '    I = integral ( 0 <= x <= 1 ) exp(x) dx.\n' );
  fprintf ( 1, '  The exact value is:\n' );
  fprintf ( 1, '    I = %g\n', exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N       Q             |Q-I|\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 22

    [ x, w ] = line_ncc_rule ( n, a, b );

    q = w(1:n)' * exp ( x(1:n) );
    error = abs ( exact - q );
    fprintf ( 1, '  %2d  %14.6g  %14.6g\n', n, q, error );

  end

  return
end
