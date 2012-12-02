function sphere_stereograph_test ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_TEST tests the SPHERE_STEREOGRAPH library.
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
  fprintf ( 1, 'SPHERE_STEREOGRAPH_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_STEREOGRAPH library.\n' );

  sphere_stereograph_test01 ( );
  sphere_stereograph_test02 ( );
  sphere_stereograph_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
