function meshfaces_test ( )

%*****************************************************************************80
%
%% MAIN tests the MESHFACES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MESHFACES library.\n' );

  meshfaces_test01 ( );
  meshfaces_test02 ( );
  meshfaces_test03 ( );
  meshfaces_test04 ( );
  meshfaces_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
