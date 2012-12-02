function test_values_test05125 ( )

%*****************************************************************************80
%
%% TEST05125 demonstrates the use of CLEBSCH_GORDAN_VALUES.
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
  fprintf ( 1, 'TEST05125:\n' );
  fprintf ( 1, '  CLEBSCH_GORDAN_VALUES returns values of \n' );
  fprintf ( 1, '  the Clebsch-Gordan coefficient.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      J1      J2      J3      M1      M2      M3        CG\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, j1, j2, j3, m1, m2, m3, fx ] = clebsch_gordan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %24.16f\n', ...
      j1, j2, j3, m1, m2, m3, fx );

  end

  return
end
