function test_values_test082 ( )

%*****************************************************************************80
%
%% TEST082 demonstrates the use of GOODWIN_VALUES.
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
  fprintf ( 1, 'TEST082:\n' );
  fprintf ( 1, '  GOODWIN_VALUES stores values of\n' );
  fprintf ( 1, '  the Goodwin function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X               FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = goodwin_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
