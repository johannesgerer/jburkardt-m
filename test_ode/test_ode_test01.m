function test_ode_test01 ( )

%*****************************************************************************80
%
%% TEST_ODE_TEST01 simply lists the problems with titles and sizes.
%
%  Discussion:
%
%    In order to use a single routine FCN to evaluate the
%    right hand side of any of the test problems, it is
%    necessary to declare and set a global variable TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  List the problem titles and sizes.\n' );
%
%  Find out how many test problems are available.
%
  test_num = p00_test_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d test problems.\n', test_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test  Size  Title\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    title = p00_title ( test );
    neqn = p00_neqn ( test );
    fprintf ( 1, '  %4d  %4d  %s\n', test, neqn, title );
  end

  return
end
