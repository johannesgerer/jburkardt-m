function combo_test31 ( )

%*****************************************************************************80
%
%% COMBO_TEST31 tests PRUEFER_TO_TREE and TREE_TO_PRUEFER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  seed = 123456789;
  test_num = 5;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST31\n' );
  fprintf ( 1, '  PRUEFER_TO_TREE converts a Pruefer code to\n' );
  fprintf ( 1, '  a tree;\n' );
  fprintf ( 1, '  TREE_TO_PRUEFER converts a tree to a Pruefer\n' );
  fprintf ( 1, '  code.\n' );

  pruefer_num = pruefer_enum ( n );

  i4_lo = 0;
  i4_hi = pruefer_num - 1;

  for test = 1 : test_num
%
%  Pick a "random" Pruefer code.
%
    [ rank, seed ] = i4_uniform ( i4_lo, i4_hi, seed );

    p = pruefer_unrank ( rank, n );

    fprintf ( 1, ' \n' );
    fprintf ( 1, '  Random Pruefer code of rank %d\n', rank );
    fprintf ( 1, '\n' );
    for i = 1 : n - 2
      fprintf ( 1, '%5d', p(i) );
    end
    fprintf ( 1, '\n' );
%
%  Convert the Pruefer code to a tree.
%
    t = pruefer_to_tree ( n, p );

    fprintf ( 1, ' \n' );
    fprintf ( 1, '  Edge list for the corresponding tree:\n' );
    fprintf ( 1, ' \n' );
    for j = 1 : n - 1
      fprintf ( 1, '  %3d  %3d  %3d', j, t(1:2,j) );
    end
    fprintf ( 1, '\n' );
%
%  Convert the tree to a Pruefer code.
%
    p = tree_to_pruefer ( n, t );

    fprintf ( 1, ' \n' );
    fprintf ( 1, '  Corresponding Pruefer code:\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n - 2
      fprintf ( 1, '%5d', p(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
