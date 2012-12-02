function r8lib_test005 ( )

%*****************************************************************************80
%
%% TEST005 tests R8_DIFF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 15;

  y_test = [ ...
    0.0625, 0.125, 0.25, 0.50,  0.874, ...
    0.876,  0.90,  0.95, 0.99,  1.0, ...
    1.01,   1.05,  1.10, 3.0,  10.0 ];

  ndig = 3;
  x = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  R8_DIFF computes a difference X-Y to a given\n' );
  fprintf ( 1, '  number of binary places.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this test, we use %d binary places.\n', ndig );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X       Y       X-Y    R8_DIFF(X,Y)\n' );
  fprintf ( 1, '\n' );
  for test = 1 : test_num
    y = y_test(test);
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', ...
      x, y, x-y, r8_diff ( x, y, ndig ) );
  end

  return
end
