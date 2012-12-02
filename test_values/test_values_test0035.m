function test_values_test0035 ( )

%*****************************************************************************80
%
%% TEST0035 demonstrates the use of AGM_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0035:\n' );
  fprintf ( 1, '  AGM_VALUES stores values of \n' );
  fprintf ( 1, '  the arithmetic geometric mean function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A           B         AGM(A,B)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, fx ] = agm_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', a, b, fx );

  end

  return
end
