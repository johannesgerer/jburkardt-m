function combo_test07 ( )

%*****************************************************************************80
%
%% COMBO_TEST07 tests I4_FACTORIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST07:\n' );
  fprintf ( 1, '  I4_FACTORIAL evaluates the factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Exact F       FACTORIAL(X)\n' );
  fprintf ( 1, '\n' );

  n = 0;

  while ( 1 )

    [ n, x, fx ] = i4_factorial_values ( n );

    if ( n == 0 )
      break
    end

    if ( x <= 0.0 )
      continue
    end

    fx2 = i4_factorial ( x );

    fprintf ( 1, '  %4d  %12d  %12d\n', x, fx, fx2 );

  end

  return
end
