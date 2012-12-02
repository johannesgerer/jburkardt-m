function blas1_z_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests ZROTG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  ZROTG generates a complex Givens rotation\n' );
  fprintf ( 1, '    (  C  S ) * ( A ) = ( R )\n' );
  fprintf ( 1, '    ( -S  C )   ( B )   ( 0 )\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = c8_uniform_01 ( seed );
    [ b, seed ] = c8_uniform_01 ( seed );

    [ c, s, r ] = zrotg ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  A =  %10f  %10f\n', real ( a ), imag ( a ) );
    fprintf ( 1, '  B =  %10f  %10f\n', real ( b ), imag ( b ) );
    fprintf ( 1, '  C =  %10f\n', c );
    fprintf ( 1, '  S =  %10f  %10f\n', real ( s ), imag ( s ) );
    fprintf ( 1, '  R =  %10f  %10f\n', real ( r ), imag ( r ) );
    t = c   * a + s * b;
    fprintf ( 1, '         C *A+S*B = %10f  %10f\n', ...
      real ( t ), imag ( t )  );
    t = -conj ( s ) * a + c * b;
    fprintf ( 1, '  -conjg(S)*A+C*B = %10f  %10f\n', ...
      real ( t ), imag ( t ) );

  end

  return
end
