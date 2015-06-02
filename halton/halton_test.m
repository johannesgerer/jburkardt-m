function halton_test ( )

%*****************************************************************************80
%
%% HALTON_TEST tests the HALTON library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HALTON_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HALTON library.\n' );

  halton_test01 ( );
  halton_test0125 ( );
  halton_test0126 ();
  halton_test02 ( );
  halton_test025 ( );
  halton_test03 ( );
  halton_test04 ( );
  halton_test045 ( );
  halton_test05( );
  halton_test06 ( );
  halton_test07 ( );
  halton_test08 ( );
  halton_test09 ( );
  halton_test10 ( );

  halton_test11 ( );
  halton_test12 ( );
  halton_test13 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HALTON_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
