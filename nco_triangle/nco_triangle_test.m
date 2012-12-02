function nco_triangle_test ( )

%*****************************************************************************80
%
%% NCO_TRIANGLE_TEST is the main program for the NCO_TRIANGLE sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCO_TRIANGLE_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NCO_TRIANGLE library.\n' );

  nco_triangle_test01 ( );
  nco_triangle_test02 ( );
  nco_triangle_test03 ( );
  nco_triangle_test04 ( );
  nco_triangle_test05 ( );
  nco_triangle_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCO_TRIANGLE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
