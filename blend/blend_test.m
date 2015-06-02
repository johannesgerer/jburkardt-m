function blend_test ( )

%*****************************************************************************80
%
%% BLEND_TEST tests the BLEND library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLEND library.\n' );

  blend_test01 ( );
  blend_test02 ( );
  blend_test03 ( );
  blend_test04 ( );
  blend_test05 ( );
  blend_test06 ( );
  blend_test07 ( );
  blend_test08 ( );
  blend_test09 ( );
  blend_test10 ( );
  blend_test11 ( );
  blend_test12 ( );
  blend_test13 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
