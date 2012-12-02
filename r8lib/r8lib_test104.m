function subpak_test104 ( )

%*****************************************************************************80
%
%% TEST104 tests R8POLY4_ROOT.
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
  test_num = 7;

  a_test = [ 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ];
  b_test = [ -10.0, -5.0, -22.0, -16.0, -20.0, 2.0, 0.0 ];
  c_test = [ 35.0, 1.0, 141.0, 72.0, 150.0, 1.0, 13.0 ];
  d_test = [ -50.0, 21.0, -220.0, -128.0, -500.0, 8.0, 0.0 ];
  e_test = [ 24.0, -18.0, +100.0, 80.0, 625.0, -12.0, 36.0 ];
%
%  1: Four distinct real roots, 1, 2, 3, 4.
%  2: Three distinct real roots, 1, -2, 3, 3
%  3: Two distinct real roots, 1, 1, 10, 10.
%  4: Two distinct real roots, 2, 2, 2, 10
%  5: One real root, 5, 5, 5, 5
%  6: Two distinct real roots, one complex conjugate pair.
%  7: Two distinct complex conjugate pairs.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST104\n' );
  fprintf ( 1, '  R8POLY4_ROOT finds roots of quartic equations.\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
 
    a = a_test(test);
    b = b_test(test);
    c = c_test(test);
    d = d_test(test);
    e = e_test(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  A = %f\n', a );
    fprintf ( 1, '  B = %f\n', b );
    fprintf ( 1, '  C = %f\n', c );
    fprintf ( 1, '  D = %f\n', d );
    fprintf ( 1, '  E = %f\n', e );

    [ r1, r2, r3, r4 ] = r8poly4_root ( a, b, c, d, e );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Roots:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %f\n', r1 );
    fprintf ( 1, '  %f\n', r2 );
    fprintf ( 1, '  %f\n', r3 );
    fprintf ( 1, '  %f\n', r4 );
 
  end

  return
end
