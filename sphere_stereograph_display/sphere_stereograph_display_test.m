function sphere_stereograph_display_test ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_DISPLAY_TEST tests the SPHERE_STEREOGRAPH_DISPLAY library.
%
%  Discussion:
%
%    The first test displays a calculation in which points on the
%    sphere are mapped to points on the plane.
%
%    The second displays a case in which points on a circle in the
%    plane are mapped to points on the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_DISPLAY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_STEREOGRAPH_DISPLAY library.\n' );

  sphere_stereograph_display_test01 ( );
  sphere_stereograph_display_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_DISPLAY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
