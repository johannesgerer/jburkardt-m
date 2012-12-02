function subset_test1531 ( )

%*****************************************************************************80
%
%% TEST1531 tests UBVEC_ADD;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1531\n' );
  fprintf ( 1, '  UBVEC_ADD adds unsigned binary vectors representing\n' );
  fprintf ( 1, '  unsigned integers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I        J        K = I + J\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( 0, 100, seed );
    [ j, seed ] = i4_uniform ( 0, 100, seed );

    fprintf ( 1, '\n' );

    fprintf ( 1, '  %8d  %8d\n', i, j );

    k = i + j;

    fprintf ( 1, '  Directly:           %8d\n', k );

    bvec1 = i4_to_bvec ( i, n );
    bvec2 = i4_to_bvec ( j, n );

    bvec3 = bvec_add ( n, bvec1, bvec2 );
    k = bvec_to_i4 ( n, bvec3 );

    fprintf ( 1, '  BVEC_ADD            %8d\n', k );

  end

  return
end
