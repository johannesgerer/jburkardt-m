function i4vec_ascend_sub_test ( )

%*****************************************************************************80
%
%% I4VEC_ASCEND_SUB_TEST tests I4VEC_ASCEND_SUB.
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
  n = 14;
  b = 1;
  c = 10;
  seed = 123456789;
  test_num = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_ASCEND_SUB_TEST\n' );
  fprintf ( 1, '  I4VEC_ASCEND_SUB computes a longest ascending\n' );
  fprintf ( 1, '  subsequence of an integer vector.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  for test = 1 : test_num
    [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
    i4vec_print ( n, a, '  The vector to be tested:' );
    [ length, sub ] = i4vec_ascend_sub ( n, a );
    i4vec_print ( length, sub, '  A longest ascending subsequence:' );
  end

  return
end
