function subset_test1165 ( )

%*****************************************************************************80
%
%% TEST1165 tests R8_TO_RAT, RAT_TO_R8.
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
  ndig = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1165\n' );
  fprintf ( 1, '  R8_TO_RAT converts a real number to a rational;\n' );
  fprintf ( 1, '  RAT_TO_R8 converts a rational to a real number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The maximum number of digits allowed is %d\n', ndig );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     R   =>  A / B  =>  R2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 10.0 * ( r - 0.25 );
    [ a, b ] = r8_to_rat ( r, ndig );
    r2 = rat_to_r8 ( a, b );
    fprintf ( 1, '  %8d  %4d  %4d  %8f\n', r, a, b, r2 );
  end

  return
end
