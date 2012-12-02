function test_values_test061 ( )

%*****************************************************************************80
%
%% TEST061 demonstrates the use of EI_VALUES.
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
  fprintf ( 1, 'TEST061:\n' );
  fprintf ( 1, '  EI_VALUES stores values of\n' );
  fprintf ( 1, '  the exponential integral function EI(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          EI(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = ei_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
