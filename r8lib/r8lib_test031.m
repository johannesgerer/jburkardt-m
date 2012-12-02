function r8lib_test031 ( )

%*****************************************************************************80
%
%% R8LIB_TEST031 tests R82POLY2_TYPE.
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
  test_num = 12;

  a_test = [  ...
    9.0, 4.0, 9.0,  1.0, 0.0, ...
    1.0, 0.0, 0.0,  0.0, 0.0, ...
    0.0, 0.0 ];
  b_test = [ ...
    -4.0,   1.0,  16.0,   1.0, 0.0,  ...
     2.0, 1.0,   1.0,  1.0,  0.0, ...
     0.0, 0.0 ];
  c_test = [  ...
     0.0,  -4.0,   0.0,   0.0, 1.0,  ...
     0.0, 0.0,   0.0,  0.0,  0.0, ...
     0.0, 0.0 ];
  d_test = [ ...
    -36.0,  3.0,  36.0,  -6.0, 3.0, ...
    -2.0, 0.0,   0.0,  0.0,  2.0, ...
     0.0, 0.0 ];
  e_test = [ ...
    -24.0, -4.0, -32.0, -10.0, -1.0, ...
     16.0, -6.0, -6.0, -2.0, -1.0, ...
     0.0, 0.0 ];
  f_test = [ ...
    -36.0,  1.0, -92.0, 115.0, -3.0, ...
     33.0, +8.0, 10.0,  +1.0,  1.0, ...
      0.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST031\n' );
  fprintf ( 1, '  R82POLY2_TYPE determines the type of a second order\n' );
  fprintf ( 1, '  equation in two variables.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    a = a_test(test);
    b = b_test(test);
    c = c_test(test);
    d = d_test(test);
    e = e_test(test);
    f = f_test(test);

    fprintf ( 1, '\n' );

    r82poly2_print ( a, b, c, d, e, f );

    type = r82poly2_type ( a, b, c, d, e, f );

    fprintf ( 1, '  Type = %d\n', type );

    r82poly2_type_print ( type );

  end

  return
end
