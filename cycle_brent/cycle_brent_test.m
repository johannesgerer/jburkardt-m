function cycle_brent_test ( )

%*****************************************************************************80
%
%% CYCLE_BRENT_TEST tests the CYCLE_BRENT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLE_BRENT_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CYCLE_BRENT library.\n' );

  cycle_brent_test01 ( );
  cycle_brent_test02 ( );
  cycle_brent_test03 ( );
  cycle_brent_test04 ( );
  cycle_brent_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLE_BRENT_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
