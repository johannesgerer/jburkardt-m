function monomial_test12 ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST12 tests MONO_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST12\n' );
  fprintf ( 1, '  MONO_VALUE evaluates a monomial.\n' );

  m = 3;
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M = %d\n', m );
  fprintf ( 1, '      N = %d\n', n );

  seed = 123456789;
  test_num = 5;

  for test = 1 : test_num

    [ f, rank, seed ] = mono_upto_random ( m, n, seed );
    fprintf ( 1, '\n' );
    mono_print ( m, f, '  M(X) = ' );

    nx = 2;
    x(1:m,1) = [ 1.0, 2.0, 3.0 ];
    x(1:m,2) = [ -2.0, 4.0, 1.0 ];
    v = mono_value ( m, nx, f, x );
    for j = 1 : nx
      fprintf ( 1, '  M(%g,%g,%g) = %g\n', x(1:m,j), v(j) );
    end
    
  end

  return
end
