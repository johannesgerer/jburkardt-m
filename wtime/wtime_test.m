function wtime_test ( )

%*****************************************************************************80
%
%% WTIME_TEST uses WTIME to get elapsed wall clock time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WTIME_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the WTIME library.\n' );

  wtime_test01 ( );

  timestamp ( );

  wtime_test02 ( );

  timestamp ( );

  wtime_test03 ( );

  timestamp ( );

  wtime_test04 ( );

  timestamp ( );

  wtime_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WTIME_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
