function subset_test1163 ( )

%*****************************************************************************80
%
%% TEST1163 tests R8_TO_DEC, DEC_TO_R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1163\n' );
  fprintf ( 1, '  R8_TO_DEC converts a real number to a decimal;\n' );
  fprintf ( 1, '  DEC_TO_R8 converts a decimal to a real number.\n' );

  dec_digit = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of decimal digits is %d\n', dec_digit );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     R   =>  A * 10^B  =>  R2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 10.0 * ( r - 0.25 );
    [ a, b ] = r8_to_dec ( r, dec_digit );
    r2 = dec_to_r8 ( a, b );
    fprintf ( 1, '  %8f  %6d  %6d  %10f\n', r, a, b, r2 );
  end

  return
end
