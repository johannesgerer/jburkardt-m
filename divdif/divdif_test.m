function divdif_test ( )

%*****************************************************************************80
%
%% DIVDIF_TEST tests DIVDIF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the DIVDIF library.\n' );

  divdif_test01 ( );
  divdif_test02 ( );
  divdif_test04 ( );
  divdif_test05 ( );
  divdif_test06 ( );
  divdif_test07 ( );
  divdif_test08 ( );
  divdif_test09 ( );
  divdif_test10 ( );
  divdif_test11 ( );
  divdif_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



