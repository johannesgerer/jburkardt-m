function ncc_triangle_test ( )

%*****************************************************************************80
%
%% NCC_TRIANGLE_TEST is the main program for the NCC_TRIANGLE sample code.
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
  fprintf ( 1, 'NCC_TRIANGLE_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NCC_TRIANGLE library.\n' );

  ncc_triangle_test01 ( );
  ncc_triangle_test02 ( );
  ncc_triangle_test03 ( );
  ncc_triangle_test04 ( );
  ncc_triangle_test05 ( );
  ncc_triangle_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCC_TRIANGLE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
