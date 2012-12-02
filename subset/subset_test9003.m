function subset_test9003 ( )

%*****************************************************************************80
%
%% TEST9003 tests BVEC_MUL;
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
  n = 15;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST9003\n' );
  fprintf ( 1, '  BVEC_MUL multiplies binary vectors \n' );
  fprintf ( 1, '  representing integers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I        J        K = I * J\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( -100, 100, seed );
    [ j, seed ] = i4_uniform ( -100, 100, seed );

    fprintf ( 1, '\n' );

    fprintf ( 1, '  %8d  %8d\n', i, j );

    k = i * j;

    fprintf ( 1, '  Directly:           %8d\n', k );

    bvec1 = i4_to_bvec ( i, n );
    bvec2 = i4_to_bvec ( j, n );
    bvec3 = bvec_mul ( n, bvec1, bvec2 );
    k = bvec_to_i4 ( n, bvec3 );

    fprintf ( 1, '  BVEC_MUL            %8d\n', k );

  end

  return
end
