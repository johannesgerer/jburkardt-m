function six_j_values_test ( )

%*****************************************************************************80
%
%% SIX_J_VALUES_TEST demonstrates the use of SIX_J_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIX_J_VALUES_TEST:\n' );
  fprintf ( 1, '  SIX_J_VALUES returns values of \n' );
  fprintf ( 1, '  the Wigner 6J coefficient.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      J1      J2      J3      J4      J5      J6        SIX_J\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, j1, j2, j3, j4, j5, j6, fx ] = six_j_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %24.16f\n', ...
      j1, j2, j3, j4, j5, j6, fx );

  end

  return
end
