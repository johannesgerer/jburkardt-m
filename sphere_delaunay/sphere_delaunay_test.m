function sphere_delaunay_test ( )

%*****************************************************************************80
%
%% SPHERE_DELAUNAY_TEST tests the SPHERE_DELAUNAY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 May 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_DELAUNAY_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the SPHERE_DELAUNAY library.\n' );

  sphere_delaunay_test01 ( );
  sphere_delaunay_test02 ( );
  sphere_delaunay_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_DELAUNAY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
