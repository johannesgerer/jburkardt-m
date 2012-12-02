function test_values_test132 ( )

%*****************************************************************************80
%
%% TEST132 demonstrates the use of SPHERE_UNIT_VOLUME_VALUES.
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
  fprintf ( 1, 'TEST132:\n' );
  fprintf ( 1, '  SPHERE_UNIT_VOLUME_VALUES stores values of\n' );
  fprintf ( 1, '  the volume of the unit sphere in various dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N            Volume\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fx ] = sphere_unit_volume_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '  %4d  %24.16f\n', n, fx );

  end

  return
end
