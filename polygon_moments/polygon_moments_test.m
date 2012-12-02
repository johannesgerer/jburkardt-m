function polygon_moments_test ( )

%*****************************************************************************80
%
%% POLYGON_MOMENTS_TEST tests POLYGON_MOMENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( '\n' );
  fprintf ( 'POLYGON_MOMENTS_TEST:\n' );
  fprintf ( '  MATLAB version\n' );
  fprintf ( '  Test POLYGON_MOMENTS library.\n' );

  polygon_moments_test01 ( );
%
%  Terminate.
%
  fprintf ( '\n' );
  fprintf ( 'POLYGON_MOMENTS_TEST:\n' );
  fprintf ( '  Normal end of execution.\n' );
  fprintf ( '\n' );
  timestamp ( );

  return
end
