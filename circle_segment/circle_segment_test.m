function circle_segment_test ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST tests the CIRCLE_SEGMENT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CIRCLE_SEGMENT library.\n' );

  figure_num = 0;

  circle_segment_test01 ( );
  circle_segment_test02 ( );
  figure_num = circle_segment_test03 ( figure_num );
  circle_segment_test04 ( );
  circle_segment_test05 ( );
  figure_num = circle_segment_test06 ( figure_num );
  circle_segment_test07 ( );
  circle_segment_test08 ( );
  circle_segment_test09 ( );
  circle_segment_test10 ( );
  circle_segment_test11 ( );
  figure_num = circle_segment_test12 ( figure_num );
  circle_segment_test13 ( );
  circle_segment_test14 ( );
  if ( 0 )
    circle_segment_test15 ( );
  end
  circle_segment_test16 ( );
  circle_segment_test17 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
