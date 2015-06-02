function line_cvt_lloyd_test ( )

%*****************************************************************************80
%
%% LINE_CVT_LLOYD_TEST tests the line_cvt_lloyd library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_CVT_LLOYD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINE_CVT_LLOYD library.\n' );

  line_cvt_lloyd_test01 ( );
  line_cvt_lloyd_test02 ( );
%
%  Repeat, using sorted initial points.
%
  line_cvt_lloyd_test03 ( );
  line_cvt_lloyd_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_CVT_LLOYD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
