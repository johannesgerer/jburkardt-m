function subset_test112 ( )

%*****************************************************************************80
%
%% TEST112 tests POWER_SERIES3;
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST112\n' );
  fprintf ( 1, '  POWER_SERIES3 composes a power series;\n' );
 
  a(1) = 1.0;
  a(2) = 1.0;
  a(3:n) = 0.0;
 
  b(1) = 1.0;
  b(2) = 1.0;
  b(3:n) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Power series of H(x) = G(F(x))\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of terms, N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for F(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for G(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', b(i) );
  end
  fprintf ( 1, '\n' );
 
  c = power_series3 ( n, a, b );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for H(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', c(i) );
  end
  fprintf ( 1, '\n' );

  return
end
