function divdif_test ( )

%*****************************************************************************80
%
%% DIVDIF_TEST tests the DIVDIF library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2013
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
  divdif_test03 ( );
  divdif_test05 ( );
  divdif_test06 ( );
  divdif_test07 ( );
  divdif_test08 ( );

  divdif_test16 ( );
  divdif_test17 ( );
  divdif_test18 ( );
  divdif_test19 ( );

  divdif_test20 ( );
  divdif_test21 ( );
  divdif_test22 ( );
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

