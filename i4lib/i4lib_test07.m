function i4lib_test07 ( )

%*****************************************************************************80
%
%% I4LIB_TEST07 tests I4_DIVP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 July 2010
%
%  Author:
%
%    John Burkardt
%
  a_hi =  100;
  a_lo = -100;
  b_hi =  10;
  b_lo = -10;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST07\n' );
  fprintf ( 1, '  I4_DIVP(A,B) returns the smallest multiplier of J\n' );
  fprintf ( 1, '  that is less than I\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A     B     C     D\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num
    [ a, seed ] = i4_uniform_ab ( a_lo, a_hi, seed );
    [ b, seed ] = i4_uniform_ab ( b_lo, b_hi, seed );
    if ( b == 0 )
      b = 7;
    end
    c = i4_divp ( a, b );
    d = c * b;
    fprintf ( 1, '  %4d  %4d  %4d  %4d\n', a, b, c, d );
  end

  return
end
