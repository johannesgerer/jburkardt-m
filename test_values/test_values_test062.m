function test_values_test062 ( )

%*****************************************************************************80
%
%% TEST062 demonstrates the use of ELLIPTIC_EA_VALUES.
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
  fprintf ( 1, 'TEST062:\n' );
  fprintf ( 1, '  ELLIPTIC_EA_VALUES stores values of\n' );
  fprintf ( 1, '  the complete elliptic integral of the second\n' );
  fprintf ( 1, '  kind, with parameter angle ALPHA in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ALPHA        EA(ALPHA)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = elliptic_ea_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
