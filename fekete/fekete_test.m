function fekete_test ( )

%*****************************************************************************80
%
%% FEKETE_TEST is the main program for the FEKETE sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEKETE_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEKETE library.\n' );

  fekete_test01 ( );
  fekete_test02 ( );
  fekete_test025 ( );
  fekete_test03 ( );
  fekete_test04 ( );
  fekete_test05 ( );
  fekete_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEKETE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
