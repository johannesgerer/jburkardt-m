function triangulation_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests NODE_MERGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  node_num = 15;
  test_num = 4;

  node_xy = [ ...
       0.0, 0.0; ...
       1.0, 0.0; ...
       3.0, 0.0; ...
       4.0, 0.0; ...
       1.0, 1.0; ...
       4.0, 1.0; ...
       2.0, 2.0; ...
       3.0, 3.0; ...
       2.0, 3.5; ...
       0.5, 4.0; ...
       1.0, 4.0; ...
       1.5, 4.0; ...
       4.0, 4.0; ...
       1.0, 4.5; ...
       1.0, 4.5 ]';
  tolerance_test = [ 0.01, 0.75, 1.2, 1.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  NODE_MERGE identifies groups of nodes\n' );
  fprintf ( 1, '  that can be merged, with a given tolerance.\n' );

  r8mat_transpose_print ( 2, node_num, node_xy, '  Node coordinates:' );

  for test = 1 : test_num

    tolerance = tolerance_test(test);

    node_rep = node_merge ( dim_num, node_num, node_xy, tolerance );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  TOLERANCE = %f\n', tolerance )
    fprintf ( 1, '\n' );
    fprintf ( 1, '      Node  Representatives:\n' );
    fprintf ( 1, '\n' );

    for node = 1 : node_num
      fprintf ( 1, '  %8d  %8d\n', node, node_rep(node) );
    end
%
%  Make a list of the node representatives.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '      Rep   Coordinates:\n' );
    fprintf ( 1, '\n' );

    node_rep = i4vec_sort_heap_a ( node_num, node_rep );

    rep_num = 0;

    for node = 1 : node_num

      if ( 2 <= node )
        if ( node_rep(node-1) == node_rep(node) )
          continue
        end
      end

      rep = node_rep(node);
      rep_num = rep_num + 1;

      fprintf ( 1, '  %8d  %14f  %14f\n', rep_num, node_xy(1:2,rep) );

    end

  end

  return
end
