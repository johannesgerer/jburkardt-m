function test_values_test069 ( )

%*****************************************************************************80
%
%% TEST069 demonstrates the use of EXP3_INT_VALUES.
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
  fprintf ( 1, 'TEST069:\n' );
  fprintf ( 1, '  EXP3_INT_VALUES stores values of\n' );
  fprintf ( 1, '  the EXP3 Integral function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = exp3_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
