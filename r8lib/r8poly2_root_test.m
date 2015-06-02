function r8poly2_root_test ( )

%*****************************************************************************80
%
%% R8POLY2_ROOT_TEST tests R8POLY2_ROOT.
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
  test_num = 3;

  a_test = [ 2.0, 1.0, 1.0 ];
  b_test = [ -2.0, -20.0, -2.0 ];
  c_test = [ -24.0, 100.0, 10.0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY2_ROOT_TEST\n' );
  fprintf ( 1, '  R8POLY2_ROOT finds quadratic equation roots.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         A         B         C     R1         R2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    a = a_test(test);
    b = b_test(test);
    c = c_test(test);

    [ r1, r2 ] = r8poly2_root ( a, b, c );
 
    fprintf ( 1, '  %9f  %9f  %9f  %9f  %9f\n', a, b, c, r1, r2 );
 
  end
 
  return
end
