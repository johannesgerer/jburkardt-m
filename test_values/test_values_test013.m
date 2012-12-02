function test_values_test013 ( )

%*****************************************************************************80
%
%% TEST013 demonstrates the use of BELL_VALUES.
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
  fprintf ( 1, 'TEST013:\n' );
  fprintf ( 1, '  BELL_VALUES returns values of \n' );
  fprintf ( 1, '  the Bell numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        BELL(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = bell_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '%6d  %10d\n', n, c );

  end

  return
end
