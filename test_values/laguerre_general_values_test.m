function laguerre_general_values_test ( )

%*****************************************************************************80
%
%% LAGUERRE_GENERAL_VALUES_TEST demonstrates the use of LAGUERRE_GENERAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_GENERAL_VALUES_TEST:\n' );
  fprintf ( 1, '  LAGUERRE_GENERAL_VALUES stores values of\n' );
  fprintf ( 1, '  the generalized Laguerre function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     A    X             L(N,A)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, a, x, fx ] = laguerre_general_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %12f  %24.16f\n', n, a, x, fx );

  end

  return
end
