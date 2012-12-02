function blas1_d_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests DROTG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  DROTG generates a real Givens rotation\n' );
  fprintf ( 1, '    (  C  S ) * ( A ) = ( R )\n' );
  fprintf ( 1, '    ( -S  C )   ( B )   ( 0 )\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = r8_uniform_01 ( seed );
    [ b, seed ] = r8_uniform_01 ( seed );

    [ c, s, r, z ] = drotg ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  A =  %f  B =  %f\n', a, b );
    fprintf ( 1, '  C =  %f  S =  %f\n', c, s );
    fprintf ( 1, '  R =  %f  Z =  %f\n', r, z );
    fprintf ( 1, '   C*A+S*B = %f\n',  c * a + s * b );
    fprintf ( 1, '  -S*A+C*B = %f\n', -s * a + c * b );

  end

  return
end
