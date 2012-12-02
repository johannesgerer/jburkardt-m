function subset_test111 ( )

%*****************************************************************************80
%
%% TEST111 tests POWER_SERIES2;
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
  fprintf ( 1, 'TEST111\n' );
  fprintf ( 1, '  POWER_SERIES2 composes a power series;\n' );
  fprintf ( 1, '  Here we compute the power series of G(x) = exp(F(x))-1\n' );
  fprintf ( 1, '  The number of terms is N = %d\n', n );

  a(1) = -4.0;
  a(2:n) = 0.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for F(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', a(i) );
  end
  fprintf ( 1, '\n' );
 
  b = power_series2 ( n, a );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for G(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', b(i) );
  end
  fprintf ( 1, '\n' );
 
  return
end
