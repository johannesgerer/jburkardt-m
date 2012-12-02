function test_zero_all ( )

%*****************************************************************************80
%
%% TEST_ZERO_ALL tests the Brent zero finding routine on all test functions.
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
  fprintf ( 1, 'TEST_ZERO_ALL\n' );
  fprintf ( 1, '  Test the Brent ZERO routine, which seeks\n' );
  fprintf ( 1, '  a root of a function F(X)\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );

  machep = eps;
  t = machep;

  a = 1.0;
  b = 2.0;

  test_zero_one ( a, b, machep, t, @f_01, ...
    'f_01(x) = sin ( x ) - x / 2' );

  a = 0.0;
  b = 1.0;

  test_zero_one ( a, b, machep, t, @f_02, ...
    'f_02(x) = 2 * x - exp ( - x )' );

  a = -1.0;
  b =  0.5;

  test_zero_one ( a, b, machep, t, @f_03, ...
    'f_03(x) = x * exp ( - x )' );

  a =  0.0001;
  b =  20.0;

  test_zero_one ( a, b, machep, t, @f_04, ...
    'f_04(x) = exp ( x ) - 1 / ( 100 * x * x )' );

  a = -5.0;
  b =  2.0;

  test_zero_one ( a, b, machep, t, @f_05, ...
    'f_05(x) = (x+3) * (x-1) * (x-1)' );

  return
end
