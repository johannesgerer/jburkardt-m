function subset_test110 ( )

%*****************************************************************************80
%
%% TEST110 tests POWER_SERIES1;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST110\n' );
  fprintf ( 1, '  POWER_SERIES1 composes a power series;\n' );

  alpha = 7.0;
 
  a(1) = 1.0;
  a(2:n) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Power series of G(x) = (1+F(x))^alpha\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  ALPHA = %f', alpha );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for F(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', a(i) );
    if ( mod ( i, 5 ) == 0 | i == n)
      fprintf ( 1, '\n' );
    end
  end
 
  b = power_series1 ( n, alpha, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for G(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', b(i) );
    if ( mod ( i, 5 ) == 0 | i == n )
      fprintf ( 1, '\n' );
    end
  end

  return
end

