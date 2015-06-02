function polygon_integrals_test ( )

%*****************************************************************************80
%
%% POLYGON_INTEGRALS_TEST tests the POLYGON_INTEGRALS library.
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
  fprintf ( 'POLYGON_INTEGRALS_TEST:\n' );
  fprintf ( '  MATLAB version\n' );
  fprintf ( '  Test the POLYGON_INTEGRALS library.\n' );

  polygon_integrals_test01 ( );
%
%  Terminate.
%
  fprintf ( '\n' );
  fprintf ( 'POLYGON_INTEGRALS_TEST:\n' );
  fprintf ( '  Normal end of execution.\n' );
  fprintf ( '\n' );
  timestamp ( );

  return
end
