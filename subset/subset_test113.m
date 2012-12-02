function subset_test113 ( )

%*****************************************************************************80
%
%% TEST113 tests POWER_SERIES4.
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
  fprintf ( 1, 'TEST113\n' );
  fprintf ( 1, '  POWER_SERIES4 composes a power series;\n' );

  for i = 1 : n
    a(i) = 1.0 / i;
  end

  b(1) = 1.0;
  b(2:n) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Power series of H(x) = G(1/F(x))\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for F(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', a(i) );
    if ( mod ( i, 5 ) == 0 | i == n )
      fprintf ( 1, '\n' );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for G(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', b(i) );
    if ( mod ( i, 5 ) == 0 | i == n )
      fprintf ( 1, '\n' );
    end
  end
 
  c = power_series4 ( n, a, b );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Series for H(x):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', c(i) );
    if ( mod ( i, 5 ) == 0 | i == n )
      fprintf ( 1, '\n' );
    end
  end

  return
end
