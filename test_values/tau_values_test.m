function tau_values_test ( )

%*****************************************************************************80
%
%% TAU_VALUES_TEST demonstrates the use of TAU_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TAU_VALUES_TEST:\n' );
  fprintf ( 1, '  TAU_VALUES returns values of \n' );
  fprintf ( 1, '  the TAU function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         TAU(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = tau_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, fn );

  end

  return
end
