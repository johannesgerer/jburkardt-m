function filum_test ( )

%*****************************************************************************80
%
%% FILUM_TEST tests FILUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILUM_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FILUM library.\n' );

  filum_test02 ( );
  filum_test03 ( );
  filum_test06 ( );
  filum_test085 ( );

  filum_test11 ( );
  filum_test13 ( );
  filum_test14 ( );
  filum_test15 ( );
  filum_test165 ( );
  filum_test17 ( );

  filum_test22 ( );
  filum_test225 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILUM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
