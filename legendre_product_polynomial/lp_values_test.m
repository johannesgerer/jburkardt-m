function lp_values_test ( )

%*****************************************************************************80
%
%% LP_VALUES_TEST tests LP_VALUES.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LP_VALUES_TEST:\n' );
  fprintf ( 1, '  LP_VALUES stores values of\n' );
  fprintf ( 1, '  the Legendre polynomial P(o,x).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated\n' );
  fprintf ( 1, '     O        X           L(O,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, o, x, fx ] = lp_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24g\n', o, x, fx );

  end

  return
end
