function test_values_test0114 ( )

%*****************************************************************************80
%
%% TEST0114 demonstrates the use of ARCCOS_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  Modified:
%
%    12 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0114:\n' );
  fprintf ( 1, '  ARCCOS_VALUES stores values of \n' );
  fprintf ( 1, '  the arc cosine function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = arccos_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
