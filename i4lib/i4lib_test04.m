function i4lib_test04 ( )

%*****************************************************************************80
%
%% I4LIB_TEST04 tests I4_BIT_REVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST04\n' );
  fprintf ( 1, '  I4_BIT_REVERSE bit reverses I with respect to 2^J\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J  I4_BIT_REVERSE(I,J)\n' );
  fprintf ( 1, '\n' );

  for j = 0 : 4
    i_hi = 2^j - 1;
    for i = 0 : i_hi
      k = i4_bit_reverse ( i, j );
      fprintf ( 1, '  %8d  %8d  %8d\n', i, j, k );
    end
  end

  return
end
