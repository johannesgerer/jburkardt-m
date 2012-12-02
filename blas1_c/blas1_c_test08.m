function blas1_c_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests CROTG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  CROTG generates a complex Givens rotation\n' );
  fprintf ( 1, '    (  C  S ) * ( A ) = ( R )\n' );
  fprintf ( 1, '    ( -S  C )   ( B )   ( 0 )\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = c4_uniform_01 ( seed );
    [ b, seed ] = c4_uniform_01 ( seed );

    [ c, s, r ] = crotg ( a, b );

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
    fprintf ( 1, '  -conj(S)*A+C*B = %10f  %10f\n', ...
      real ( t ), imag ( t ) );

  end

  return
end
