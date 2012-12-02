function test_values_test083 ( )

%*****************************************************************************80
%
%% TEST083 demonstrates the use of GUD_VALUES.
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
  fprintf ( 1, 'TEST083:\n' );
  fprintf ( 1, '  GUD_VALUES stores values of\n' );
  fprintf ( 1, '  the Gudermannian function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X               FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gud_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
