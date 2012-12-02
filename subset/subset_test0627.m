function subset_test0627 ( )

%*****************************************************************************80
%
%% TEST0627 tests I4_TO_I4POLY, I4POLY_TO_I4;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  test_num = 9;

  base_test = [ 2, 2, 2, 3, 4, 5, 6, 23, 24 ];
  intval_test = [ 1, 6, 23, 23, 23, 23, 23, 23, 23 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0627\n' );
  fprintf ( 1, '  I4_TO_I4POLY converts an integer to a polynomial\n' );
  fprintf ( 1, '    in a given base;\n' );
  fprintf ( 1, '  I4POLY_TO_I4 evaluates an integer polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I    BASE  DEGREE  Coefficients\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    intval = intval_test(test);
    base = base_test(test);
    [ a, degree ] = i4_to_i4poly ( intval, base );
    fprintf ( 1, '  %6d  %6d  %6d', intval, base, degree );
    for i = degree : -1 : 0
      fprintf ( 1, '  %6d', a(i+1) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now let I4_TO_I4POLY convert I to a polynomial,\n' );
  fprintf ( 1, '  use I4POLY_TO_I4 to evaluate it, and compare.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I    I2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    intval = intval_test(test);
    base = base_test(test);
    [ a, degree ] = i4_to_i4poly ( intval, base );
    intval2 = i4poly_to_i4 ( degree, a, base );
    fprintf ( 1, '  %6d  %6d\n', intval, intval2 );
  end

  return
end
