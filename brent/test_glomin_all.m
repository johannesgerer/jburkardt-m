function test_glomin_all ( )

%*****************************************************************************80
%
%% TEST_GLOMIN_ALL tests the Brent global minimizer on all test functions.
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
  fprintf ( 1, 'TEST_GLOMIN_ALL\n' );
  fprintf ( 1, '  Test the Brent GLOMIN routine, which seeks\n' );
  fprintf ( 1, '  a global minimizer of a function F(X)\n' );
  fprintf ( 1, '  in an interval [A,B],\n' );
  fprintf ( 1, '  given some upper bound M for F".\n' );

  machep = eps;
  e = sqrt ( machep );
  t = sqrt ( machep );

  a = 7.0;
  b = 9.0;
  c = ( a + b ) / 2.0;
  m = 0.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_01, ...
    'h_01(x) = 2 - x' );

  a = 7.0;
  b = 9.0;
  c = ( a + b ) / 2.0;
  m = 100.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_01, ...
    'h_01(x) = 2 - x' );

  a = -1.0;
  b = +2.0;
  c = ( a + b ) / 2.0;
  m = 2.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_02, ...
    'h_02(x) = x * x' );

  a = -1.0;
  b = +2.0;
  c = ( a + b ) / 2.0;
  m = 2.1;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_02, ...
    'h_02(x) = x * x' );

  a = -0.5;
  b =  +2.0;
  c = ( a + b ) / 2.0;
  m = 14.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_03, ...
    'h_03(x) = x^3 + x^2' );

  a = -0.5;
  b =  +2.0;
  c = ( a + b ) / 2.0;
  m = 28.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_03, ...
    'h_03(x) = x^3 + x^2' );

  a = -10.0;
  b = +10.0;
  c = ( a + b ) / 2.0;
  m = 72.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_04, ...
    'h_04(x) = ( x + sin(x) ) * exp(-x*x)' );

  a = -10.0;
  b = +10.0;
  c = ( a + b ) / 2.0;
  m = 72.0;

  test_glomin_one ( a, b, c, m, machep, e, t, @h_05, ...
    'h_05(x) = ( x - sin(x) ) * exp(-x*x)' );

  return
end
