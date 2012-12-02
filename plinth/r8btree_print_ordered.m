function r8btree_print_ordered ( node_num, tree, data_num, tree_data )

%*****************************************************************************80
%
%% R8BTREE_PRINT_ORDERED prints the nodes of a BTREE in order.
%
%  Discussion:
%
%    Each node of the BTREE has an associated X value which was used to
%    determine the structure of the BTREE.
%
%    This function prints out the data associated with each node of the
%    BTREE, ordered by the X values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the tree.
%
%    Input, integer TREE(4,NODE_NUM).
%    TREE(1,I), the index in TREE_DATA(1,*) of the coordinate of node I.
%    TREE(2,I), the left child of node I.
%    TREE(3,I), the right child of node I.
%    TREE(4,I), the parent of node I.
%
%    Input, integer DATA_NUM, the number of data items per node.
%
%    Input, real TREE_DATA(DATA_NUM,NODE_NUM), node data.
%
  if ( node_num < 1 ) 
    return
  end

  for output = 1 : 2
%
%  Print the pointers.
%
    if ( output == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '       J       I    Left   Right  Parent\n' );
      fprintf ( 1, '\n' );
    elseif ( output == 2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '       J   Ordered Tree Data\n' );
      fprintf ( 1, '\n' );
    end

    m_old = -1;
    m = 1;
%
%  Go down to the left if you can.
%
    while ( 1 )
%
%  Going down, try the left child.
%
      if ( m_old == tree(4,m) )
        m_new = tree(2,m);
        if ( 0 < m_new )
          m_old = m;
          m = m_new;
          continue
        else
          m_old = -1;
        end
      end
%
%  Coming up from left child, print, try the right child.
%
      if ( m_old == tree(2,m) )
        if ( output == 1 )
          fprintf ( 1, '  %6d  %6d  %6d  %6d  %6d\n', m, tree(1:4,m) );
        elseif ( output == 2 )
          fprintf ( 1, '  %6d', m );
          for i = 1 : data_num
            fprintf ( 1, '  %10.4f', tree_data(i,m) );
          end
          fprintf ( 1, '\n' );
        end
        m_new = tree(3,m);
        if ( 0 < m_new )
          m_old = m;
          m = m_new;
          continue
        else
          m_old = -1;
        end
      end
%
%  Coming up from the right child, go up.
%
      if ( m_old == tree(3,m) )
        m_old = m;
        m = tree(4,m);
        if ( m == -1 )
          break;
        end
      end

    end

  end

  return
end

