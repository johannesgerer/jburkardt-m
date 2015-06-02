function blas0_test01 ( )

%******************************************************************************/
%
%% BLAS0_TEST01 tests R4_ABS.
%
%  Licensing:
%
%   This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 June 2008
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
  fprintf ( 1, 'BLAS0_TEST01\n' );
  fprintf ( 1, '  R4_ABS returns the absolute value of an R4.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ r4, seed ] = r4_uniform_ab ( r4_lo, r4_hi, seed );
    r4_absolute = r4_abs ( r4 );
    fprintf ( 1, '  %10.6f  %10.6f\n', r4, r4_absolute );
  end

  return
end
