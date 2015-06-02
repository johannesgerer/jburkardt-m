function r8_fractional_test ( )

%*****************************************************************************80
%
%% R8_FRACTIONAL_TEST tests R8_FRACTIONAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2014
%
%  Author:
%
%    John Burkardt
%
  r8_hi = 5.0;
  r8_lo = -3.0;
  test_num = 10;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_FRACTIONAL_TEST\n' );
  fprintf ( 1, '  R8_FRACTIONAL returns the fractional part of an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X       R8_FRACTIONAL(X)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ r8, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    fractional = r8_fractional ( r8 );
    fprintf ( 1, '  %10f  %10f\n', r8, fractional );
  end

  return
end
