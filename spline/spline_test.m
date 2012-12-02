function spline_test ( )

%*****************************************************************************80
%
%% SPLINE_TEST tests SPLINE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPLINE_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the SPLINE library.\n' );

  spline_test001 ( );
  spline_test002 ( );
  spline_test003 ( );
  spline_test004 ( );
  spline_test005 ( );
  spline_test006 ( );

  spline_test01 ( );
  spline_test02 ( );
  spline_test03 ( );
  spline_test04 ( );
  spline_test05 ( );
  spline_test06 ( );
  spline_test07 ( );
  spline_test08 ( );
  spline_test09 ( );

  spline_test10 ( );
  spline_test11 ( );
  spline_test115 ( );
  spline_test116 ( );
  spline_test12 ( );
  spline_test125 ( );
  spline_test126 ( );
  spline_test127 ( );
  spline_test13 ( );
  spline_test14 ( );
  spline_test145 ( );
  spline_test15 ( );
  spline_test16 ( );
  spline_test17 ( );
  spline_test18 ( );
  spline_test19 ( );

  spline_test20 ( );
  spline_test205 ( );
  spline_test21 ( );
  spline_test215 ( );
  spline_test22 ( );
  spline_test225 ( );
  spline_test23 ( );
  spline_test235 ( );
  spline_test24 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPLINE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


