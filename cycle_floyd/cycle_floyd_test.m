function cycle_floyd_test ( )

%*****************************************************************************80
%
%% CYCLE_FLOYD_TEST tests the CYCLE_FLOYD library.
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
  fprintf ( 1, 'CYCLE_FLOYD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CYCLE_FLOYD library.\n' );

  cycle_floyd_test01 ( );
  cycle_floyd_test02 ( );
  cycle_floyd_test03 ( );
  cycle_floyd_test04 ( );
  cycle_floyd_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLE_FLOYD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
