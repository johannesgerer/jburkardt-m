function i4lib_test03 ( )

%*****************************************************************************80
%
%% I4LIB_TEST03 tests I4_BIT_LO1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST03\n' );
  fprintf ( 1, '  I4_BIT_LO1 returns the location of the low 1 bit.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I  I4_BIT_LO1(I)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    [ i, seed ] = i4_uniform_ab ( 0, 100, seed );
    j = i4_bit_lo1 ( i );
    fprintf ( 1, '  %6d  %6d\n', i, j );
  end

  return
end
