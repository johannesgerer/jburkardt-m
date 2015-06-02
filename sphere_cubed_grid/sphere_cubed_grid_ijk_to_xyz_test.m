function point_num = sphere_cubed_grid_ijk_to_xyz_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_IJK_TO_XYZ_TEST tests SPHERE_CUBED_GRID_IJK_TO_XYZ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_IJK_TO_XYZ_TEST:\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_IJK_TO_XYZ returns the XYZ coordinates\n' );
  fprintf ( 1, '  of a point on the surface of the cubed sphere,\n' );
  fprintf ( 1, '  given its (I,J,K) indices.\n' ); 

  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using grid parameter N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J     K        X           Y           Z\n');
  fprintf ( 1, '\n' );

  for i = 0 : n
    for j = 0 : n
      for k = 0 : n
        if ( i == 0 || i == n || j == 0 || j == n || k == 0 || k == n )
          xyz = sphere_cubed_grid_ijk_to_xyz ( n, i, j, k );
          fprintf ( 1, '  %4d  %4d  %4d    %10f  %10f  %10f\n', ...
            i, j, k, xyz(1,1), xyz(2,1), xyz(3,1) );
        end
      end
    end
  end

  return
end
