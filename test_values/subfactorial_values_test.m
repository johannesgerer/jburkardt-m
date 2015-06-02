function subfactorial_values_test ( )

%*****************************************************************************80
%
%% SUBFACTORIAL_VALUES_TEST demonstrates the use of SUBFACTORIAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBFACTORIAL_VALUES_TEST:\n' );
  fprintf ( 1, '  SUBFACTORIAL_VALUES returns values of\n' );
  fprintf ( 1, '  the subfactorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     Subfactorial(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = subfactorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n',  n, fn );

  end

  return
end
