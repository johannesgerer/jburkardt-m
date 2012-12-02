function cvt_test ( )

%*****************************************************************************80
%
%% CVT_TEST tests CVT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CVT library.\n' );

  cvt_test01 ( );
  cvt_test02 ( );
  cvt_test03 ( );
  cvt_test04 ( );
  cvt_test05 ( );
  cvt_test06 ( );
  cvt_test07 ( );
  cvt_test08 ( );
  cvt_test09 ( );

  cvt_test10 ( );
  cvt_test11 ( );
  cvt_test12 ( );
  cvt_test13 ( );
  cvt_test14 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



