function lp_value_test ( )

%*****************************************************************************80
%
%% LP_VALUE_TEST tests LP_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LP_VALUE_TEST:\n' );
  fprintf ( 1, '  LP_VALUE evaluates a Legendre polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     O        X           L(O,X)                    L(O,X)' );
  fprintf ( 1, '                   Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, o, x, fx1 ] = lp_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = lp_value ( n, o, x );

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24g  %24g  %8g\n', o, x, fx1, fx2, e );

  end

  return
end
