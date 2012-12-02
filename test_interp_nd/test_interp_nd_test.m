function test_interp_nd_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for TEST_INTERP_ND_TEST.
%
%  Discussion:
%
%    TEST_INTERP_ND_TEST calls the TEST_INTERP_ND tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  timestamp (  );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_ND_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INTERP_ND library.\n' );
  fprintf ( 1, '  The R8LIB library is also needed.\n' );

  test_interp_nd_test01 ( );

  n = 10;
  for m = 2 : 4
    test_interp_nd_test02 ( m, n );
  end

  n = 2;
  for m = 2 : 4
    test_interp_nd_test03 ( m, n );
  end

  m = 4;
  n = 10000;
  test_interp_nd_test04 ( m, n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_ND_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );
  rmpath ( '../r8lib' )

  return
end
