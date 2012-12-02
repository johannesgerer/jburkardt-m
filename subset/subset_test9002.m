function subset_test9002 ( )

%*****************************************************************************80
%
%% TEST9002 tests BVEC_COMPLEMENT2;
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
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST9002\n' );
  fprintf ( 1, '  BVEC_COMPLEMENT2 returns the two''s complement\n' );
  fprintf ( 1, '  of a (signed) binary vector;\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( -100, 100, seed );

    bvec1 = i4_to_bvec ( i, n );

    bvec2 = bvec_complement2 ( n, bvec1 );

    j = bvec_to_i4 ( n, bvec2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  I = %8d\n', i );
    fprintf ( 1, '  J = %8d\n', j );
    bvec_print ( n, bvec1, ' ' );
    bvec_print ( n, bvec2, ' ' );

  end
