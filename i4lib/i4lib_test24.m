function i4lib_test24 ( )

%*****************************************************************************80
%
%% I4LIB_TEST24 tests i4_XOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST24\n' );
  fprintf ( 1, '  I4_XOR returns the bitwise exclusive OR of two integers.\n' );
  fprintf ( 1, '  MATLAB provides a BITXOR operator which should be used instead!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I       J  I4_XOR  BITXOR\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 10

    [ i, seed ] = i4_uniform_ab ( 0, 100, seed );
    [ j, seed ] = i4_uniform_ab ( 0, 100, seed );
    k = i4_xor ( i, j );
    l = bitxor ( i, j );

    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', i, j, k, l );

  end 

  return
end
