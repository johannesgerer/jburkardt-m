function ply_to_tri_surface_test ( )

%*****************************************************************************80
%
%% PLY_TO_TRI_SURFACE_TEST tests the PLY_TO_TRI_SURFACE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLY_TO_TRI_SURFACE_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the PLY_TO_TRI_SURFACE library.\n' );

  ply_file_name = 'sphere.ply';
  
  ply_to_tri_surface_test01 ( ply_file_name );

  ply_file_name = 'cube.ply';

  ply_to_tri_surface_test02 ( ply_file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLY_TO_TRI_SURFACE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
