function keast_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for KEAST_PRB.
%
%  Discussion:
%
%    KEAST_PRB runs tests on the KEAST library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KEAST_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the KEAST library.\n' );

  keast_test01 ( );
  keast_test02 ( );
  keast_test025 ( );
  keast_test03 ( );
  keast_test04 ( );
  keast_test05 ( );
  keast_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KEAST_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
