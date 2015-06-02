function r8poly3_root_test ( )

%*****************************************************************************80
%
%% R8POLY3_ROOT_TEST tests R8POLY3_ROOT.
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
  test_num = 4;

  a_test = [ 1.0, 9.0, 1.0, 1.0 ];
  b_test = [ -6.0, -36.0, -5.0, -8.0  ];
  c_test = [ 11.0, 54.0, 8.0, 25.0  ];
  d_test = [ -6.0, -27.0, -4.0, -26.0  ];
%
%  1: Three distinct real roots, 1, 2, 3.
%  2: One repeated real root, 1.5, 1.5, 1.5.
%  3: Two real roots, one repeated, 1, 2, 2.
%  4: One real root, a complex conjugate pair, 2, 3+2I, 3-2I.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY3_ROOT_TEST\n' );
  fprintf ( 1, '  R8POLY3_ROOT finds roots of cubic equations.\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
 
    a = a_test(test);
    b = b_test(test);
    c = c_test(test);
    d = d_test(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Polynomial coefficients:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  A = %f, B = %f, C = %f, D = %f\n', a, b, c, d );
 
    [ r1, r2, r3 ] = r8poly3_root ( a, b, c, d );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Roots:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %f\n', r1 );
    fprintf ( 1, '  %f\n', r2 );
    fprintf ( 1, '  %f\n', r3 );
 
  end

  return
end
