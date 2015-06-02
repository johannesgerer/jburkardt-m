function bvec_mul_test ( )

%*****************************************************************************80
%
%% BVEC_MUL_TEST tests BVEC_MUL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2015
%
%  Author:
%
%    John Burkardt
%
  n = 15;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_MUL_TEST\n' );
  fprintf ( 1, '  BVEC_MUL multiplies binary vectors \n' );
  fprintf ( 1, '  representing integers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I        J        I * J   BVEC_MUL\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform_ab ( -100, 100, seed );
    [ j, seed ] = i4_uniform_ab ( -100, 100, seed );

    k = i * j;

    bvec1 = i4_to_bvec ( i, n );
    bvec2 = i4_to_bvec ( j, n );
    bvec3 = bvec_mul ( n, bvec1, bvec2 );
    l = bvec_to_i4 ( n, bvec3 );

    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', i, j, k, l );

  end

  return
end
