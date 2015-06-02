function tsearch_test ( )

%*****************************************************************************80
%
%% TSEARCH_TEST tests the TSEARCH library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSEARCH_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TSEARCH library.\n' );

  opt = 0;
  tsearch_test01 ( opt );
  opt = 1;
  tsearch_test01 ( opt );
  opt = 2;
  tsearch_test01 ( opt );
  opt = 3;
  tsearch_test01 ( opt );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSEARCH_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



