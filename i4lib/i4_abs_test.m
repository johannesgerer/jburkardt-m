function i4_abs_test ( )

%*****************************************************************************80
%
%% I4_ABS_TEST tests I4_ABS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
  i4_lo = -100;
  i4_hi = +100;
  test_num = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_ABS_TEST\n' );
  fprintf ( 1, '  I4_ABS returns the absolute value of an I4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A         B=I4_ABS(A)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ a, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
    b = i4_abs ( a );
    fprintf ( 1, '  %10d  %10d\n', a, b );
  end

  return
end
