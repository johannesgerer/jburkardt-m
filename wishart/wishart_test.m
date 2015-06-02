function wishart_test ( )

%*****************************************************************************80
%
%% WISHART_TEST tests the WISHART library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 October 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WISHART_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the WISHART library.\n' );

  wishart_test01 ( );
  wishart_test02 ( );
  wishart_test03 ( );
  wishart_test04 ( );
  wishart_test05 ( );
  wishart_test06 ( );
  wishart_test07 ( );
  wishart_test08 ( );
  wishart_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WISHART_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
