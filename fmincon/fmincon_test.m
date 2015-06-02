function fmincon_test ( )

%*****************************************************************************80
%
%% FMINCON_TEST tests the FMINCON library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FMINCON_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the FMINCON library.\n' );

  fmincon_test01 ( );
  fmincon_test02 ( );
  fmincon_test03 ( );
  fmincon_test04 ( );
  fmincon_test05 ( );
  fmincon_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FMINCON_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



