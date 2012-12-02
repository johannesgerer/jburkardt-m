function test_values_test087 ( )

%*****************************************************************************80
%
%% TEST087 demonstrates the use of FACTORIAL2_VALUES.
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
  fprintf ( 1, 'TEST087:\n' );
  fprintf ( 1, '  FACTORIAL2_VALUES returns values of\n' );
  fprintf ( 1, '  the double factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         N!!\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = factorial2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n',  n, fn );

  end

  return
end
