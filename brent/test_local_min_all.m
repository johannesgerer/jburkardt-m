function test_local_min_all ( )

%*****************************************************************************80
%
%% TEST_LOCAL_MIN_ALL tests the Brent local minimizer on all test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_LOCAL_MIN_ALL\n' );
  fprintf ( 1, '  Test the Brent LOCAL_MIN routine, which seeks\n' );
  fprintf ( 1, '  a local minimizer of a function F(X)\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );

  tol = 10.0 * sqrt ( eps );
  t = eps;

  a = 0.0;
  b = 3.141592653589793;

  test_local_min_one ( a, b, tol, t, @g_01, ...
    'g_01(x) = ( x - 2 ) * ( x - 2 ) + 1' );

  a = 0.0;
  b = 1.0;

  test_local_min_one ( a, b, tol, t, @g_02, ...
    'g_02(x) = x * x + exp ( - x )' );

  a = -2.0;
  b =  2.0;

  test_local_min_one ( a, b, tol, t, @g_03, ...
    'g_03(x) = x^4 + 2x^2 + x + 3' );

  a =  0.0001;
  b =  1.0;

  test_local_min_one ( a, b, tol, t, @g_04, ...
    'g_04(x) = exp ( x ) + 1 / ( 100 x )' );

  a =  0.0002;
  b = 2.0;

  test_local_min_one ( a, b, tol, t, @g_05, ...
    'g_05(x) = exp ( x ) - 2x + 1/(100x) - 1/(1000000x^2)' );

  return
end
