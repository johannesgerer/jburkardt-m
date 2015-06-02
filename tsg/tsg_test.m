function tsg_test ( )

%*****************************************************************************80
%
%% TSG_TEST tests the TSG library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2014
%
%  Author:
%
%    Miro Stoyanov
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSG_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  TSG_TEST tests the TSG library.\n' );

  tsg_test01 ( );
  tsg_test02 ( );
  tsg_test03 ( );
  tsg_test04 ( );
  tsg_test05 ( );
  tsg_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSG_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
