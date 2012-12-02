function sftpack_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for SFTPACK_PRB.
%
%  Discussion:
%
%    SFTPACK_PRB tests the SFTPACK routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFTPACK_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SFTPACK library.\n' );

  sftpack_test01 ( );
  sftpack_test02 ( );
  sftpack_test03 ( );
  sftpack_test04 ( );
  sftpack_test05 ( );
  sftpack_test06 ( );
  sftpack_test07 ( );
  sftpack_test08 ( );

  sftpack_test11 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFTPACK_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
