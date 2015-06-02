function nine_j_values_test ( )

%*****************************************************************************80
%
%% NINE_J_VALUES_TEST demonstrates the use of NINE_J_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINE_J_VALUES_TEST:\n' );
  fprintf ( 1, '  NINE_J_VALUES returns values of \n' );
  fprintf ( 1, '  the Wigner 9J coefficient.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      J1      J2      J3      J4      J5      J6      J7      J8      J9        NINE_J\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, j1, j2, j3, j4, j5, j6, j7, j8, j9, fx ] = ...
      nine_j_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %24.16f\n', ...
      j1, j2, j3, j4, j5, j6, j7, j8, j9,  fx );

  end

  return
end
