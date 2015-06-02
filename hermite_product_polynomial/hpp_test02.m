function hpp_test02 ( )

%*****************************************************************************80
%
%% HPP_TEST02 tests HEP_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST02:\n' );
  fprintf ( 1, '  HEP_VALUES stores values of\n' );
  fprintf ( 1, '  the Hermite polynomial He(o,x).\n' );
  fprintf ( 1, '  HEP_VALUE evaluates a Hermite polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     O        X          He(O,X)                   He(O,X)' );
  fprintf ( 1, '                   Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, o, x, fx1 ] = hep_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = hep_value ( n, o, x );

    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24g  %24g  %8g\n', o, x, fx1, fx2, e );

  end

  return
end
