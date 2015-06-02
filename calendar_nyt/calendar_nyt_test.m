function calendar_nyt_test ( )

%*****************************************************************************80
%
%% CALENDAR_NYT_TEST tests the CALENDAR_NYT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 February 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALENDAR_NYT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CALENDAR_NYT library.\n' );

  calendar_nyt_test01 ( );
  calendar_nyt_test02 ( );
  calendar_nyt_test03 ( );
  calendar_nyt_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALENDAR_NYT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
