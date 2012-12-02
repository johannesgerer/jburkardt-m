function test_values_test059 ( )

%*****************************************************************************80
%
%% TEST059 demonstrates the use of DILOGARITHM_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST059:\n' );
  fprintf ( 1, '  DILOGARITHM_VALUES stores values of\n' );
  fprintf ( 1, '  the dilogarithm function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          DILOGARITHM(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = dilogarithm_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
