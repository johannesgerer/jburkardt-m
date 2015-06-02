function sphere_unit_area_values_test ( )

%*****************************************************************************80
%
%% SPHERE_UNIT_AREA_VALUES_TEST demonstrates the use of SPHERE_UNIT_AREA_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_UNIT_AREA_VALUES_TEST:\n' );
  fprintf ( 1, '  SPHERE_UNIT_AREA_VALUES stores values of\n' );
  fprintf ( 1, '  the area of the unit sphere in various dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N            Area\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fx ] = sphere_unit_area_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '  %4d  %24.16f\n', n, fx );

  end

  return
end
