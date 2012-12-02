function subset_test9001 ( )

%*****************************************************************************80
%
%% TEST9001 tests BVEC_ADD and BVEC_SUB;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST9001\n' );
  fprintf ( 1, '  BVEC_ADD adds binary vectors representing integers;\n' );
  fprintf ( 1, '  BVEC_SUB subtracts binary vectors representing integers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I        J        K = I + J    L = I - J\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( -100, 100, seed );
    [ j, seed ] = i4_uniform ( -100, 100, seed );

    fprintf ( 1, '\n' );

    fprintf ( 1, '  %8d  %8d\n', i, j );

    k = i + j;
    l = i - j;

    fprintf ( 1, '  Directly:           %8d  %8d\n', k, l );

    bvec1 = i4_to_bvec ( i, n );
    bvec2 = i4_to_bvec ( j, n );

    bvec3 = bvec_add ( n, bvec1, bvec2 );
    k = bvec_to_i4 ( n, bvec3 );

    bvec4 = bvec_sub ( n, bvec1, bvec2 );
    l = bvec_to_i4 ( n, bvec4 );

    fprintf ( 1, '  BVEC_ADD, BVEC_SUB  %8d  %8d\n', k, l );

  end

  return
end
