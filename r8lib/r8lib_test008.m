function r8lib_test008 ( )

%*****************************************************************************80
%
%% TEST008 tests R8_FRACTIONAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2010
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
  fprintf ( 1, 'TEST008\n' );
  fprintf ( 1, '  R8_FRACTIONAL returns the fractional part of an R8.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ r8, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    fractional = r8_fractional ( r8 );
    fprintf ( 1, '  %10f  %10f\n', r8, fractional );
  end

  return
end
