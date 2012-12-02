function sphere_quad_test ( )

%*****************************************************************************80
%
%% SPHERE_QUAD_TEST tests SPHERE_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_QUAD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_QUAD library.\n' );

  sphere_quad_test01 ( );
  sphere_quad_test02 ( );
  sphere_quad_test03 ( );
  sphere_quad_test04 ( );
  sphere_quad_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_QUAD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
