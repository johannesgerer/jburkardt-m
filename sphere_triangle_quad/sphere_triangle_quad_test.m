function sphere_triangle_quad_test ( )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_QUAD_TEST tests the SPHERE_TRIANGLE_QUAD library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_TRIANGLE_QUAD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_TRIANGLE_QUAD library.\n' );

  sphere_triangle_quad_test01 ( );
  sphere_triangle_quad_test02 ( );
  sphere_triangle_quad_test03 ( );
  sphere_triangle_quad_test04 ( );
  sphere_triangle_quad_test05 ( );
  sphere_triangle_quad_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_TRIANGLE_QUAD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end