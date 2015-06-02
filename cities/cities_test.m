function cities_test ( )

%*****************************************************************************80
%
%% CITIES_TEST tests the CITIES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 September 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CITIES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CITIES library.\n' );

  test01 ( 'wg22' );
  test02 ( 'usca312_main.txt' );
  test03 ( 'usca312_main.txt' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CITIES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
