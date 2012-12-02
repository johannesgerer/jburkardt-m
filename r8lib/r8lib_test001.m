function r8lib_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests R8_ABS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2010
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
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  R8_ABS returns the absolute value of an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X         R8_ABS(X)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ r8, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    r8_absolute = r8_abs ( r8 );
    fprintf ( 1, '  %10.6f  %10.6f\n', r8, r8_absolute );
  end

  return
end
