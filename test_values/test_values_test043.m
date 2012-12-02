function test_values_test043 ( )

%*****************************************************************************80
%
%% TEST043 demonstrates the use of CATALAN_VALUES.
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
  fprintf ( 1, 'TEST043:\n' );
  fprintf ( 1, '  CATALAN_VALUES returns values of\n' );
  fprintf ( 1, '  the Catalan numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        C(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = catalan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, c );

  end

  return
end
