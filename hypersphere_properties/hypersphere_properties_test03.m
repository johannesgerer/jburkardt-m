function hypersphere_properties_test03 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST03 tests HYPERSPHERE_01_AREA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST03:\n' );
  fprintf ( 1, '  HYPERSPHERE_01_AREA evaluates the area of the unit\n' );
  fprintf ( 1, '  hypersphere in M dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       M      Exact       Computed\n' );
  fprintf ( 1, '              Area        Area\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, area ] = hypersphere_01_area_values ( n_data );

    if ( n_data == 0 )
      break
    end

    area2 = hypersphere_01_area ( m );

    fprintf ( 1, '  %6d  %10f  %10f\n', m, area, area2 );

  end

  return
end
