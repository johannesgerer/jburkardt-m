function test_values_test10875 ( )

%*****************************************************************************80
%
%% TEST10875 demonstrates the use of MERTENS_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10875:\n' );
  fprintf ( 1, '  MERTENS_VALUES returns values of \n' );
  fprintf ( 1, '  the Mertens function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         MERTENS(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = mertens_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, fn );

  end

  return
end
