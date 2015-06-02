function hypersphere_properties_test05 ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST05 tests HYPERSPHERE_AREA, HYPERSPHERE_VOLUME.
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
  r = 1.5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST05\n' );
  fprintf ( 1, '  For a hypersphere in M dimensions:\n' );
  fprintf ( 1, '  HYPERSPHERE_AREA computes the area;\n' );
  fprintf ( 1, '  HYPERSPHERE_VOLUME computes the volume.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Notice that both quantities eventually decrease!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a radius of R = %f\n', r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    M        Area          Volume    Area / Volume \n' );
  fprintf ( 1, '\n' );

  for m = 1 : 20
    area = hypersphere_area ( m, r );
    volume = hypersphere_volume ( m, r );
    fprintf ( 1, '  %3d  %12g  %12g  %12g\n', m, area, volume, area / volume );
  end

  return
end
