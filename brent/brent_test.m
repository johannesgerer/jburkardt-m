function brent_test ( )

%*****************************************************************************80
%
%% BRENT_TEST tests the BRENT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BRENT_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BRENT library.\n' );

  test_zero_all ( );
  test_zero_rc_all ( );
  test_local_min_all ( );
  test_local_min_rc_all ( );
  test_glomin_all ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BRENT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



