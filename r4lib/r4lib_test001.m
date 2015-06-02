function r4lib_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests R4_ABS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2014
%
%  Author:
%
%    John Burkardt
%
  r4_hi = 5.0;
  r4_lo = -3.0;
  test_num = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  R4_ABS returns the absolute value of an R4.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ r4, seed ] = r4_uniform_ab ( r4_lo, r4_hi, seed );
    r4_absolute = r4_abs ( r4 );
    fprintf ( 1, '  %10.6f  %10.6f\n', r4, r4_absolute );
  end

  return
end
