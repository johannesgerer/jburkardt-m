function bezier_surface_test ( )

%*****************************************************************************80
%
%% BEZIER_SURFACE_PRB tests the BEZIER_SURFACE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BEZIER_SURFACE_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BEZIER_SURFACE library.\n' );

  bezier_surface_test01 ( );
  bezier_surface_test02 ( );
  bezier_surface_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BEZIER_SURFACE_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

