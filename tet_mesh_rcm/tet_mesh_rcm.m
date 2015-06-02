function tet_mesh_rcm ( prefix )

%*****************************************************************************80
%
%% TET_MESH_RCM applies the RCM reordering to a tet mesh.
%
%  Discussion:
%
%    TET_MESH_RCM applies the RCM reordering to a tet mesh.
%
%    The user supplies a node file and a tetrahedron file, containing
%    the coordinates of the nodes, and the indices of the nodes that
%    make up each tetrahedron.  Either 4-node or 10-node tetrahedrons may
%    be used.
%
%    The program reads the data, computes the adjacency information,
%    carries out the RCM algorithm to get the permutation, applies
%    the permutation to the nodes and tetrahedrons, and writes out
%    new node and tetrahedron files that correspond to the RCM permutation.
%
%    Note that node data is normally three dimensional, that is,
%    each node has an X, Y and Z coordinate.  In some applications, it
%    may be desirable to specify more information.  This program
%    will accept node data that includes DIM_NUM entries on each line,
%    as long as DIM_NUM is the same for each entry.  
%
%  Usage:
%
%    tet_mesh_rcm ( 'prefix' )
%
%    where
%
%    * 'prefix'_nodes.txt contains nodal coordinates;
%    * 'prefix'_elements.txt contains the element definitions;
%    * 'prefix'_rcm_nodes.txt contains the new node coordinates;
%    * 'prefix'_rcm_elements.txt contains the new element definitions;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common filename prefix.
%
  debugging = 0;
  
  fprintf ( 1, '\n' );
  timestamp ( ) ;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_RCM:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Read a node dataset of NODE_NUM points in 3 dimensions.\n' );
  fprintf ( 1, '  Read an associated tet mesh dataset of TETRA_NUM\n' );
  fprintf ( 1, '  tetrahedrons using 4 or 10 nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Apply the RCM reordering (Reverse Cuthill-McKee).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reorder the data and write it out to files\n' );
%
%  Argument 1 is the common file prefix.
%
  if ( 1 <= nargin )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_RCM:\n' );
    prefix = input ( '  Please enter the filename prefix: ' );

  end
%
%  Create the filenames.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  node_rcm_filename = strcat ( prefix, '_rcm_nodes.txt' );
  element_rcm_filename = strcat ( prefix, '_rcm_elements.txt' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read (  node_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', node_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  Number of points NODE_NUM = %d\n', node_num );

  node_xyz = r8mat_data_read ( node_filename, dim_num, node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', node_filename );

  r8mat_transpose_print_some ( dim_num, node_num, node_xyz, 1, 1, dim_num, 5, ...
    '  Coordinates of first 5 nodes:' );
%
%  Read the tet mesh data.
%
  [ tetra_order, tetra_num ] = i4mat_header_read ( element_filename );

  if ( tetra_order ~= 4 && tetra_order ~= 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TET_MESH_RCM - Fatal error!\n' );
    fprintf ( 1, '  Data is not for a 4-node or 10-node tet mesh.\n' );
    error ( 'TET_MESH_RCM - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron order = %d\n', tetra_order );
  fprintf ( 1, '  Number of tetras  = %d\n', tetra_num );

  tetra_node = i4mat_data_read ( element_filename, tetra_order, ...
    tetra_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', element_filename );

  i4mat_transpose_print_some ( tetra_order, tetra_num, ...
    tetra_node, 1, 1, tetra_order, 5, '  First 5 tetrahedrons:' );
%
%  Detect and correct 0-based indexing.
%
  tetra_node = mesh_base_one ( node_num, tetra_order, tetra_num, tetra_node );
%
%  Following code depends on the order of the elements.
%
  if ( tetra_order == 4 )
%
%  Count the number of adjacencies.
%  Set up the ADJ_ROW adjacency pointer array.
%
    [ adj_num, adj_row ] = tet_mesh_order4_adj_count ( node_num, tetra_num, ...
      tetra_node );

    if ( debugging )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DEBUG:\n' );
      fprintf ( 1, '  ADJ_NUM = %d\n', adj_num );
      fprintf ( 1, '\n' );
      i4vec_print ( node_num+1, adj_row, '  ADJ_ROW:' );
    end
%
%  Set up the ADJ adjacency array.
%
    adj = tet_mesh_order4_adj_set ( node_num, tetra_num, tetra_node, ...
      adj_num, adj_row );

    if ( node_num < 10 )
      adj_print ( node_num, adj_num, adj_row, adj, '  DEBUG: ADJ' );
    end

  elseif ( tetra_order == 10 )

    [ adj_num, adj_row ] = tet_mesh_order10_adj_count ( node_num, tetra_num, ...
      tetra_node );

    if ( debugging )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DEBUG:\n' );
      fprintf ( 1, '  ADJ_NUM = %d\n', adj_num );
      fprintf ( 1, '\n' );
      i4vec_print ( node_num+1, adj_row, '  ADJ_ROW:' );
    end
%
%  Set up the ADJ adjacency array.
%
    adj = tet_mesh_order10_adj_set ( node_num, tetra_num, tetra_node, ...
      adj_num, adj_row );

    if ( node_num < 10 )
      adj_print ( node_num, adj_num, adj_row, adj, '  DEBUG: ADJ' );
    end

  end

  bandwidth = adj_bandwidth ( node_num, adj_num, adj_row, adj );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ADJ bandwidth = %d\n', bandwidth );
%
%  Compute the RCM permutation.
%
  perm = genrcm ( node_num, adj_num, adj_row, adj );

  perm_inv = perm_inverse3 ( node_num, perm );

  bandwidth = adj_perm_bandwidth ( node_num, adj_num, adj_row, adj, ...
    perm, perm_inv );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Permuted ADJ bandwidth = %d\n', bandwidth );

  if ( node_num < 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '     I PERM(I) INVERSE(I)\n' );
    fprintf ( 1, '\n' );
    for i = 1 : node_num
      fprintf ( 1, '  %8d  %8d  %8d\n', i, perm(i), perm_inv(i) );
    end
  end
%
%  Permute the nodes.
%
  node_xyz = r8col_permute ( dim_num, node_num, node_xyz, perm );
%
%  Permute the node indices in the tetrahedron array.
%
  for j = 1 : tetra_num
    for i = 1 : tetra_order
      node = tetra_node(i,j);
      tetra_node(i,j) = perm_inv(node);
    end
  end
%
%  Write the nodes.
%
  r8mat_write ( node_rcm_filename, dim_num, node_num, node_xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the node file "%s".\n', node_rcm_filename );

  i4mat_write ( element_rcm_filename, tetra_order, tetra_num, ...
    tetra_node );
    
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the tet_mesh file "%s".\n', ...
    element_rcm_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_RCM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = adj_bandwidth ( node_num, adj_num, adj_row, adj )

%*****************************************************************************80
%
%% ADJ_BANDWIDTH computes the bandwidth of an adjacency matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Output, integer VALUE, the bandwidth of the adjacency
%    matrix.
%
  band_lo = 0;
  band_hi = 0;

  for i = 1 : node_num

    for j = adj_row(i) : adj_row(i+1)-1
      col = adj(j);
      band_lo = max ( band_lo, i - col );
      band_hi = max ( band_hi, col - i );
    end

  end

  value = band_lo + 1 + band_hi;

  return
end
function value = adj_perm_bandwidth ( node_num, adj_num, adj_row, adj, ...
  perm, perm_inv )

%*****************************************************************************80
%
%% ADJ_PERM_BANDWIDTH computes the bandwidth of a permuted adjacency matrix.
%
%  Discussion:
%
%    The matrix is defined by the adjacency information and a permutation.
%
%    The routine also computes the bandwidth and the size of the envelope.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer PERM(NODE_NUM), integer PERM_INV(NODE_NUM), the permutation
%    and inverse permutation.
%
%    Output, integer ADJ_PERM_BANDWIDTH, the bandwidth of the permuted
%    adjacency matrix.
%
  band_lo = 0;
  band_hi = 0;

  for i = 1 : node_num

    for j = adj_row(perm(i)) : adj_row(perm(i)+1)-1
      col = perm_inv(adj(j));
      band_lo = max ( band_lo, i - col );
      band_hi = max ( band_hi, col - i );
    end

  end

  value = band_lo + 1 + band_hi;

  return
end
function adj_print ( node_num, adj_num, adj_row, adj, title )

%*****************************************************************************80
%
%% ADJ_PRINT prints adjacency information.
%
%  Discussion:
%
%    The list has the form:
%
%    Row   Nonzeros
%
%    1       2   5   9
%    2       7   8   9   15   78   79   81  86  91  99
%          100 103
%    3      48  49  53
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1), organizes the adjacency entries
%    into rows.  The entries for row I are in entries ADJ_ROW(I)
%    through ADJ_ROW(I+1)-1.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure, which contains,
%    for each row, the column indices of the nonzero entries.
%
%    Input, string TITLE, a title to be printed.
%
  adj_print_some ( node_num, 1, node_num, adj_num, adj_row, adj, title );

  return
end
function adj_print_some ( node_num, node_lo, node_hi, adj_num, adj_row, ...
  adj, title )

%*****************************************************************************80
%
%% ADJ_PRINT_SOME prints some adjacency information.
%
%  Discussion:
%
%    The list has the form:
%
%    Row   Nonzeros
%
%    1       2   5   9
%    2       7   8   9   15   78   79   81  86  91  99
%          100 103
%    3      48  49  53
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_LO, NODE_HI, the first and last nodes for
%    which the adjacency information is to be printed.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1), organizes the adjacency entries
%    into rows.  The entries for row I are in entries ADJ_ROW(I)
%    through ADJ_ROW(I+1)-1.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure, which contains,
%    for each row, the column indices of the nonzero entries.
%
%    Input, string TITLE, a title to be printed.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sparse adjacency structure:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes       = %d\n', node_num );
  fprintf ( 1, '  Number of adjacencies = %d\n', adj_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node Min Max      Nonzeros \n' );
  fprintf ( 1, '\n' );

  for i = node_lo : node_hi

    jmin = adj_row(i);
    jmax = adj_row(i+1) - 1;

    if ( jmax < jmin )

      fprintf ( 1, '  %4d%4d%4d\n', i, jmin, jmax );

    else

      for jlo = jmin : 5 : jmax

        jhi = min ( jlo + 4, jmax );

        if ( jlo == jmin )

          fprintf ( 1, '  %4d%4d%4d   ', i, jmin, jmax );
          for j = jlo : jhi
            fprintf ( 1, '%8d', adj(j) );
          end
          fprintf ( 1, '\n' );

        else

          fprintf ( 1, '                 ' );
          for j = jlo : jhi
            fprintf ( 1, '%8d', adj(j) );
          end
          fprintf ( 1, '\n' );

        end

      end

    end

  end

  return
end
function [ deg, iccsze, ls ] = degree ( root, adj_num, adj_row, adj, mask, ...
  node_num )

%*****************************************************************************80
%
%% DEGREE computes the degrees of the nodes in the connected component.
%
%  Discussion:
%
%    The connected component is specified by MASK and ROOT.
%    Nodes for which MASK is zero are ignored.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer ROOT, the node that defines the connected component.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), is nonzero for those nodes which are
%    to be considered.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer DEG(NODE_NUM), contains, for each  node in the connected
%    component, its degree.
%
%    Output, integer ICCSZE, the number of nodes in the connected component.
%
%    Output, integer LS(NODE_NUM), stores in entries 1 through ICCSIZE the nodes
%    in the connected component, starting with ROOT, and proceeding
%    by levels.
%
  deg = zeros ( node_num, 1 );
  ls = zeros ( node_num, 1 );
%
%  The sign of ADJ_ROW(I) is used to indicate if node I has been considered.
%
  ls(1) = root;
  adj_row(root) = -adj_row(root);
  lvlend = 0;
  iccsze = 1;
%
%  LBEGIN is the pointer to the beginning of the current level, and
%  LVLEND points to the end of this level.
%
  while ( 1 )

    lbegin = lvlend + 1;
    lvlend = iccsze;
%
%  Find the degrees of nodes in the current level,
%  and at the same time, generate the next level.
%
    for i = lbegin : lvlend

      node = ls(i);
      jstrt = -adj_row(node);
      jstop = abs ( adj_row(node+1) ) - 1;
      ideg = 0;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )

          ideg = ideg + 1;

          if ( 0 <= adj_row(nbr) )
            adj_row(nbr) = -adj_row(nbr);
            iccsze = iccsze + 1;
            ls(iccsze) = nbr;
          end

        end

      end

      deg(node) = ideg;

    end
%
%  Compute the current level width.
%
    lvsize = iccsze - lvlend;
%
%  If the current level width is nonzero, generate another level.
%
    if ( lvsize == 0 )
      break
    end

  end
%
%  Reset ADJ_ROW to its correct sign and return.
%
  for i = 1 : iccsze
    node = ls(i);
    adj_row(node) = -adj_row(node);
  end

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
  end

  column_num = s_word_count ( line );

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function perm = genrcm ( node_num, adj_num, adj_row, adj )

%*****************************************************************************80
%
%% GENRCM finds the reverse Cuthill-Mckee ordering for a general graph.
%
%  Discussion:
%
%    For each connected component in the graph, the routine obtains
%    an ordering by calling RCM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Output, integer PERM(NODE_NUM), the RCM ordering.
%
%  Local Parameters:
%
%    Local, integer LEVEL_ROW(NODE_NUM+1), the index vector for a level
%    structure.  The level structure is stored in the currently unused
%    spaces in the permutation vector PERM.
%
%    Local, integer MASK(NODE_NUM), marks variables that have been numbered.
%
  mask(1:node_num) = 1;

  num = 1;

  for i = 1 : node_num
%
%  For each masked connected component...
%
    if ( mask(i) ~= 0 )

      root = i;
%
%  Find a pseudo-peripheral node ROOT.  The level structure found by
%  ROOT_FIND is stored starting at PERM(NUM).
%
      root = root_find ( root, ...
        adj_num, adj_row, adj, mask, node_num );
%
%  RCM orders the component using ROOT as the starting node.
%
      [ mask, level, iccsze ] = rcm ( root, adj_num, adj_row, adj, mask, ...
        node_num );

      perm(num:num+iccsze-1) = level(1:iccsze);

      num = num + iccsze;
%
%  We can stop once every node is in one of the connected components.
%
      if ( node_num < num )
        return
      end

    end

  end

  return
end
function isgn = i4col_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_COMPARE compares columns I and J of a integer array.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      ISGN = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an array of N columns of vectors of length M.
%
%    Input, integer I, J, the columns to be compared.
%    I and J must be between 1 and N.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, column I < column J,
%     0, column I = column J,
%    +1, column J < column I.
%

%
%  Check.
%
  if ( i < 1)
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index I = %d < 1.\n', i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index I = %d.\n', n, i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( j < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index J = %d < 1.\n', j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index J = %d.\n', n, j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  isgn = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= m )

    if ( a(k,i) < a(k,j) )
      isgn = -1;
      return
    elseif ( a(k,j) < a(k,i) )
      isgn = +1;
      return
    end

    k = k + 1;

  end

  return
end
function a = i4col_sort2_a ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORT2_A ascending sorts the elements of each column of an I4COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A, and the length
%    of a vector of data.
%
%    Input, integer A(M,N), the array of N columns of M vectors.
%
%    Output, integer A(M,N), the elements of each column of A have been 
%    sorted in ascending order.
%
  if ( m <= 1 )
    return
  end

  if ( n <= 0 )
    return
  end
%
%  Initialize.
%
  for col = 1 : n

    indx = 0;
    isgn = 0;
%
%  Call the external heap sorter.
%
    while ( 1 )

      [ indx, i, j ] = sort_heap_external ( m, indx, isgn );
%
%  Interchange the I and J objects.
%
      if ( 0 < indx )

        t        = a(i,col);
        a(i,col) = a(j,col);
        a(j,col) = t;
%
%  Compare the I and J objects.
%
      elseif ( indx < 0 )

        if ( a(j,col) < a(i,col) )
          isgn = +1;
        else
          isgn = -1;
        end

      elseif ( indx == 0 )

        break

      end

    end

  end

  return
end
function a = i4col_sort_a ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORT_A ascending sorts an I4COL.
%
%  Discussion:
%
%    In lexicographic order, the statement "X < Y", applied to two real
%    vectors X and Y of length M, means that there is some index I, with
%    1 <= I <= M, with the property that
%
%      X(J) = Y(J) for J < I,
%    and
%      X(I) < Y(I).
%
%    In other words, the first time they differ, X is smaller.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A, and the length of
%    a vector of data.
%
%    Input, integer N, the number of columns of A.
%
%    Input, integer A(M,N), the array of N columns of M-vectors.
%
%    Output, integer A(M,N), the columns of A have been sorted in ascending
%    lexicographic order.
%
  if ( m <= 0 )
    return
  end

  if ( n <= 1 )
    return
  end
%
%  Initialize.
%
  indx = 0;
  isgn = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      a = i4col_swap ( m, n, a, i, j );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = i4col_compare ( m, n, a, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
function unique_num = i4col_sorted_unique_count ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORTED_UNIQUE_COUNT counts unique elements in an I4COL.
%
%  Discussion:
%
%    The columns of the array may be ascending or descending sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), a sorted array, containing
%    N columns of data.
%
%    Output, integer UNIQUE_NUM, the number of unique columns.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;
  j1 = 1;

  for j2 = 2 : n

    if ( any ( a(1:m,j1) ~= a(1:m,j2) ) )
      unique_num = unique_num + 1;
      j1 = j2;
    end

  end

  return
end
function a = i4col_swap ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_SWAP swaps columns I and J of a integer array of column data.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      A = (
%        1  4  3  2
%        5  8  7  6
%        9 12 11 10 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer A(M,N), an array of N columns of length M.
%
%    Input, integer I, J, the columns to be swapped.
%
%    Output, integer A(M,N), the array, with columns I and J swapped.
%
  if ( i < 1 || n < i || j < 1 || n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_SWAP - Fatal error!\n' );
    fprintf ( 1, '  I or J is out of bounds.\n' );
    fprintf ( 1, '  I =    %d\n', i );
    fprintf ( 1, '  J =    %d\n', j );
    fprintf ( 1, '  N =    %d\n', n );
    error ( 'I4COL_SWAP - Fatal error!' );
  end

  if ( i == j )
    return
  end

  col(1:m) = a(1:m,i)';
  a(1:m,i) = a(1:m,j);
  a(1:m,j) = col(1:m)';

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 10;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function i4mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% I4MAT_WRITE writes an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer TABLE(M,N), the points.
%
%    Input, logical HEADER, is TRUE if the header is to be included.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %12d', round ( table(i,j) ) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function i4vec_print ( n, a, title )

%*****************************************************************************80
%
%% I4VEC_PRINT prints an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d  %6d\n', i, a(i) );
  end

  return
end
function a = i4vec_reverse ( n, a )

%*****************************************************************************80
%
%% I4VEC_REVERSE reverses the elements of an I4VEC.
%
%  Example:
%
%    Input:
%
%      N = 5,
%      A = ( 11, 12, 13, 14, 15 ).
%
%    Output:
%
%      A = ( 15, 14, 13, 12, 11 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), the array to be reversed.
%
%    Output, integer A(N), the reversed array.
%
  b(1:n) = a(n:-1:1);
  a(1:n) = b(1:n);

  return
end
function [ mask, level_num, level_row, level ] = level_set ( root, adj_num, ...
  adj_row, adj, mask, node_num )

%*****************************************************************************80
%
%% LEVEL_SET generates the connected level structure rooted at a given node.
%
%  Discussion:
%
%    Only nodes for which MASK is nonzero will be considered.
%
%    The root node chosen by the user is assigned level 1, and masked.
%    All (unmasked) nodes reachable from a node in level 1 are
%    assigned level 2 and masked.  The process continues until there
%    are no unmasked nodes adjacent to any node in the current level.
%    The number of levels may vary between 2 and NODE_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer ROOT, the node at which the level structure
%    is to be rooted.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM).  On input, only nodes with nonzero
%    MASK are to be processed.  On output, those nodes which were included
%    in the level set have MASK set to 1.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer MASK(NODE_NUM).  On input, only nodes with nonzero
%    MASK are to be processed.  On output, those nodes which were included
%    in the level set have MASK set to 1.
%
%    Output, integer LEVEL_NUM, the number of levels in the level
%    structure.  ROOT is in level 1.  The neighbors of ROOT
%    are in level 2, and so on.
%
%    Output, integer LEVEL_ROW(NODE_NUM+1), LEVEL(NODE_NUM), the rooted
%    level structure.
%
  level_row = zeros ( node_num + 1 , 1 );
  mask(root) = 0;
  level(1) = root;
  level_num = 0;
  lvlend = 0;
  iccsze = 1;
%
%  LBEGIN is the pointer to the beginning of the current level, and
%  LVLEND points to the end of this level.
%
  while ( 1 )

    lbegin = lvlend + 1;
    lvlend = iccsze;
    level_num = level_num + 1;
    level_row(level_num) = lbegin;
%
%  Generate the next level by finding all the masked neighbors of nodes
%  in the current level.
%
    for i = lbegin : lvlend

      node = level(i);
      jstrt = adj_row(node);
      jstop = adj_row(node+1)-1;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )
          iccsze = iccsze + 1;
          level(iccsze) = nbr;
          mask(nbr) = 0;
        end

      end

    end
%
%  Compute the current level width (the number of nodes encountered.)
%  If it is positive, generate the next level.
%
    lvsize = iccsze - lvlend;

    if ( lvsize <= 0 )
      break
    end

  end

  level_row(level_num+1) = lvlend + 1;
%
%  Reset MASK to 1 for the nodes in the level structure.
%
  mask(level(1:iccsze)) = 1;

  return
end
function element_node = mesh_base_one ( node_num, element_order, ...
  element_num, element_node )

%*****************************************************************************80
%
%% MESH_BASE_ONE ensures that the element definition is one-based.
%
%  Discussion:
%
%    The ELEMENT_NODE array contains nodes indices that form elements.
%    The convention for node indexing might start at 0 or at 1.
%    Since a MATLAB program will naturally assume a 1-based indexing, it is
%    necessary to check a given element definition and, if it is actually
%    0-based, to convert it.
%
%    This function attempts to detect 0-based node indexing and correct it.
%
%    Thanks to Feifei Xu for pointing out that I was subtracting 1 when I
%    should have been adding 1!  29 November 2012.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input/output, integer ELEMENT_NODE(ELEMENT_ORDE,ELEMENT_NUM), the element
%    definitions.
%
  node_min = min ( min ( element_node(1:element_order,1:element_num) ) );
  node_max = max ( max ( element_node(1:element_order,1:element_num) ) );

  if ( node_min == 0 && node_max == node_num - 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 0-based!\n' );
    fprintf ( 1, '  This will be converted to 1-based.\n' );
    element_node(1:element_order,1:element_num) = ...
      element_node(1:element_order,1:element_num) + 1;
  elseif ( node_min == 1 && node_max == node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE:\n' );
    fprintf ( 1, '  The element indexing appears to be 1-based!\n' );
    fprintf ( 1, '  No conversion is necessary.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_BASE_ONE - Warning!\n' );
    fprintf ( 1, '  The element indexing is not of a recognized type.\n' );
  end

  return
end
function perm_inv = perm_inverse3 ( n, perm )

%*****************************************************************************80
%
%% PERM_INVERSE3 produces the inverse of a given permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items permuted.
%
%    Input, integer PERM(N), a permutation.
%
%    Output, integer PERM_INV(N), the inverse permutation.
%
  perm_inv(perm(1:n)) = ( 1 : n );

  return
end
function a = r8col_permute ( m, n, a, p )

%*****************************************************************************80
%
%% R8COL_PERMUTE permutes an R8COL in place.
%
%  Discussion:
%
%    An R8COL is an M by N array of double precision values, regarded
%    as an array of N columns of length M.
%
%    This routine permutes an array of real "objects", but the same
%    logic can be used to permute an array of objects of any arithmetic
%    type, or an array of objects of any complexity.  The only temporary
%    storage required is enough to store a single object.  The number
%    of data movements made is N + the number of cycles of order 2 or more,
%    which is never more than N + N/2.
%
%  Example:
%
%    Input:
%
%      M = 2
%      N = 5
%      P = (   2,    4,    5,    1,    3 )
%      A = ( 1.0,  2.0,  3.0,  4.0,  5.0 )
%          (11.0, 22.0, 33.0, 44.0, 55.0 )
%
%    Output:
%
%      A    = (  2.0,  4.0,  5.0,  1.0,  3.0 )
%             ( 22.0, 44.0, 55.0, 11.0, 33.0 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the size of the objects.
%
%    Input, integer N, the number of objects.
%
%    Input, real A(M,N), the array to be permuted.
%
%    Input, integer P(N), the permutation.  P(I) = J means
%    that the I-th element of the output array should be the J-th
%    element of the input array.  P must be a legal permutation
%    of the integers from 1 to N, otherwise the algorithm will
%    fail catastrophically.
%
%    Output, real A(M,N), the permuted array.
%

%
%  Search for the next element of the permutation that has not been used.
%
  for istart = 1 : n

    if ( p(istart) < 0 )

      continue

    elseif ( p(istart) == istart )

      p(istart) = - p(istart);
      continue

    else

      a_temp(1:m) = a(1:m,istart);
      iget = istart;
%
%  Copy the new value into the vacated entry.
%
      while ( 1 )

        iput = iget;
        iget = p(iget);

        p(iput) = - p(iput);

        if ( iget < 1 || n < iget )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'R8COL_PERMUTE - Fatal error!\n' );
          fprintf ( 1, '  A permutation index is out of range.\n' );
          fprintf ( 1, '  P(%d) = %d\n', iput, iget );
          error ( 'R8COL_PERMUTE - Fatal error!' );
        end

        if ( iget == istart )
          a(1:m,iput) = a_temp(1:m)';
          break
        end

        a(1:m,iput) = a(1:m,iget);

      end

    end

  end
%
%  Restore the signs of the entries.
%
% p(1:n) = -p(1:n);

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function [ mask, perm, iccsze ] = rcm ( root, adj_num, adj_row, adj, ...
  mask, node_num )

%*****************************************************************************80
%
%% RCM renumbers a connected component by the reverse Cuthill McKee algorithm.
%
%  Discussion:
%
%    The connected component is specified by a node ROOT and a mask.
%    The numbering starts at the root node.
%
%    An outline of the algorithm is as follows:
%
%    X(1) = ROOT.
%
%    for ( I = 1 to N-1)
%      Find all unlabeled neighbors of X(I),
%      assign them the next available labels, in order of increasing degree.
%
%    When done, reverse the ordering.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%  Parameters:
%
%    Input, integer ROOT, the node that defines the connected component.
%    It is used as the starting point for the RCM ordering.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), a mask for the nodes.  Only
%    those nodes with nonzero input mask values are considered by the
%    routine.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer MASK(NODE_NUM), the nodes numbered by RCM have 
%    their mask values set to zero.
%
%    Output, integer PERM(NODE_NUM), the RCM ordering.
%
%    Output, integer ICCSZE, the size of the connected component
%    that has been numbered.
%
%  Local Parameters:
%
%    Workspace, integer DEG(NODE_NUM), a temporary vector used to hold
%    the degree of the nodes in the section graph specified by mask and root.
%

%
%  Find the degrees of the nodes in the component specified by MASK and ROOT.
%
  [ deg, iccsze, perm ] = degree ( root, adj_num, adj_row, adj, mask, ...
    node_num );

  mask(root) = 0;

  if ( iccsze <= 1 )
    return
  end

  lvlend = 0;
  lnbr = 1;
%
%  LBEGIN and LVLEND point to the beginning and
%  the end of the current level respectively.
%
  while ( lvlend < lnbr )

    lbegin = lvlend + 1;
    lvlend = lnbr;

    for i = lbegin : lvlend
%
%  For each node in the current level...
%
      node = perm(i);
      jstrt = adj_row(node);
      jstop = adj_row(node+1) - 1;
%
%  Find the unnumbered neighbors of NODE.
%
%  FNBR and LNBR point to the first and last neighbors
%  of the current node in PERM.
%
      fnbr = lnbr + 1;

      for j = jstrt : jstop

        nbr = adj(j);

        if ( mask(nbr) ~= 0 )
          lnbr = lnbr + 1;
          mask(nbr) = 0;
          perm(lnbr) = nbr;
        end

      end
%
%  If no neighbors, skip to next node in this level.
%
      if ( lnbr <= fnbr )
        continue
      end
%
%  Sort the neighbors of NODE in increasing order by degree.
%  Linear insertion is used.
%
      k = fnbr;

      while ( k < lnbr )

        l = k;
        k = k + 1;
        nbr = perm(k);

        while ( fnbr < l )

          lperm = perm(l);

          if ( deg(lperm) <= deg(nbr) )
            break
          end

          perm(l+1) = lperm;
          l = l-1;

        end

        perm(l+1) = nbr;

      end

    end

  end
%
%  We now have the Cuthill-McKee ordering.  Reverse it.
%
  perm = i4vec_reverse ( iccsze, perm );

  return
end
function [ root, level_num, level_row, level ] = root_find ( root, ...
  adj_num, adj_row, adj, mask, node_num )

%*****************************************************************************80
%
%% ROOT_FIND finds a pseudo-peripheral node.
%
%  Discussion:
%
%    The diameter of a graph is the maximum distance (number of edges)
%    between any two nodes of the graph.
%
%    The eccentricity of a node is the maximum distance between that
%    node and any other node of the graph.
%
%    A peripheral node is a node whose eccentricity equals the
%    diameter of the graph.
%
%    A pseudo-peripheral node is an approximation to a peripheral node;
%    it may be a peripheral node, but all we know is that we tried our
%    best.
%
%    The routine is given a graph, and seeks pseudo-peripheral nodes,
%    using a modified version of the scheme of Gibbs, Poole and
%    Stockmeyer.  It determines such a node for the section subgraph
%    specified by MASK and ROOT.
%
%    The routine also determines the level structure associated with
%    the given pseudo-peripheral node; that is, how far each node
%    is from the pseudo-peripheral node.  The level structure is
%    returned as a list of nodes LS, and pointers to the beginning
%    of the list of nodes that are at a distance of 0, 1, 2, ...,
%    NODE_NUM-1 from the pseudo-peripheral node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    Original FORTRAN77 version by Alan George, Joseph Liu
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan George, Joseph Liu,
%    Computer Solution of Large Sparse Positive Definite Systems,
%    Prentice Hall, 1981.
%
%    Norman Gibbs, William Poole, Paul Stockmeyer,
%    An Algorithm for Reducing the Bandwidth and Profile of a Sparse Matrix,
%    SIAM Journal on Numerical Analysis,
%    Volume 13, pages 236-250, 1976.
%
%    Norman Gibbs,
%    Algorithm 509: A Hybrid Profile Reduction Algorithm,
%    ACM Transactions on Mathematical Software,
%    Volume 2, pages 378-387, 1976.
%
%  Parameters:
%
%    Input, integer ROOT a node in the the component of the graph for 
%    which a pseudo-peripheral node is sought.
%
%    Input, integer ADJ_NUM, the number of adjacency entries.
%
%    Input, integer ADJ_ROW(NODE_NUM+1).  Information about row I is stored
%    in entries ADJ_ROW(I) through ADJ_ROW(I+1)-1 of ADJ.
%
%    Input, integer ADJ(ADJ_NUM), the adjacency structure.
%    For each row, it contains the column indices of the nonzero entries.
%
%    Input, integer MASK(NODE_NUM), specifies a section subgraph.  Nodes
%    for which MASK is zero are ignored by FNROOT.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Output, integer ROOT, the pseudo-peripheral node obtained.
%
%    Output, integer LEVEL_NUM, is the number of levels in the level structure
%    rooted at the node ROOT.
%
%    Output, integer LEVEL_ROW(NODE_NUM+1), LEVEL(NODE_NUM), the
%    level structure array pair containing the level structure found.
%

%
%  Determine the level structure rooted at ROOT.
%
  [ mask, level_num, level_row, level ] = level_set ( root, adj_num, ...
    adj_row, adj, mask, node_num );
%
%  Count the number of nodes in this level structure.
%
  iccsze = level_row(level_num+1) - 1;
%
%  Extreme case:
%    A complete graph has a level set of only a single level.
%    Every node is equally good (or bad).
%
  if ( level_num == 1 )
    return
  end
%
%  Extreme case:
%    A "line graph" 0--0--0--0--0 has every node in its only level.
%    By chance, we've stumbled on the ideal root.
%
  if ( level_num == iccsze )
    return
  end
%
%  Pick any node from the last level that has minimum degree
%  as the starting point to generate a new level set.
%
  while ( 1 )

    mindeg = iccsze;

    jstrt = level_row(level_num);
    root = level(jstrt);

    if ( jstrt < iccsze )

      for j = jstrt : iccsze

        node = level(j);
        ndeg = 0;
        kstrt = adj_row(node);
        kstop = adj_row(node+1)-1;

        for k = kstrt : kstop
          nabor = adj(k);
          if ( 0 < mask(nabor) )
            ndeg = ndeg+1;
          end
        end

        if ( ndeg < mindeg )
          root = node;
          mindeg = ndeg;
        end

      end

    end
%
%  Generate the rooted level structure associated with this node.
%
    [ mask, level_num2, level_row, level ] = level_set ( root, adj_num, ...
      adj_row, adj, mask, node_num );
%
%  If the number of levels did not increase, accept the new ROOT.
%
    if ( level_num2 <= level_num )
      break
    end

    level_num = level_num2;
%
%  In the unlikely case that ROOT is one endpoint of a line graph,
%  we can exit now.
%
    if ( iccsze <= level_num )
      break
    end

  end

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

  end

  return
end
function [ indx, i, j ] = sort_heap_external ( n, indx, isgn )

%*****************************************************************************80
%
%% SORT_HEAP_EXTERNAL externally sorts a list of items into ascending order.
%
%  Discussion:
%
%    The actual list of data is not passed to the routine.  Hence this
%    routine may be used to sort integers, reals, numbers, names,
%    dates, shoe sizes, and so on.  After each call, the routine asks
%    the user to compare or interchange two items, until a special
%    return value signals that the sorting is completed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis and Herbert Wilf.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of items to be sorted.
%
%    Input, integer INDX, the main communication signal.
%    The user must set INDX to 0 before the first call.
%    Thereafter, the user should set the input value of INDX
%    to the output value from the previous call.
%
%    Input, integer ISGN, results of comparison of elements I and J.
%    (Used only when the previous call returned INDX less than 0).
%    ISGN <= 0 means I is less than or equal to J;
%    0 <= ISGN means I is greater than or equal to J.
%
%    Output, integer INDX, the main communication signal.
%    If INDX is
%
%      greater than 0, the user should:
%      * interchange items I and J;
%      * call again.
%
%      less than 0, the user should:
%      * compare items I and J;
%      * set ISGN = -1 if I < J, ISGN = +1 if J < I;
%      * call again.
%
%      equal to 0, the sorting is done.
%
%    Output, integer I, J, the indices of two items.
%    On return with INDX positive, elements I and J should be interchanged.
%    On return with INDX negative, elements I and J should be compared, and
%    the result reported in ISGN on the next call.
%
  persistent i_save;
  persistent j_save;
  persistent k;
  persistent k1;
  persistent n1;
%
%  INDX = 0: This is the first call.
%
  if ( indx == 0 )
      
    i_save = -1;
    j_save = -1;
    k = floor ( n / 2 );
    k1 = k;
    n1 = n;
%
%  INDX < 0: The user is returning the results of a comparison.
%
  elseif ( indx < 0 )

    if ( indx == -2 )

      if ( isgn < 0 )
        i_save = i_save + 1;
      end

      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    end

    if ( 0 < isgn )
      indx = 2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )

      if ( n1 == 1 )
        i_save = 0;
        j_save = 0;
        indx = 0;
      else
        i_save = n1;
        n1 = n1 - 1;
        j_save = 1;
        indx = 1;
      end

      i = i_save;
      j = j_save;
      return;

    end

    k = k - 1;
    k1 = k;
%
%  0 < INDX, the user was asked to make an interchange.
%
  elseif ( indx == 1 )

    k1 = k;

  end

  while ( 1 )

    i_save = 2 * k1;

    if ( i_save == n1 )
      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    elseif ( i_save <= n1 )
      j_save = i_save + 1;
      indx = -2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )
      break;
    end

    k = k - 1;
    k1 = k;

  end

  if ( n1 == 1 )
    i_save = 0;
    j_save = 0;
    indx = 0;
    i = i_save;
    j = j_save;
  else
    i_save = n1;
    n1 = n1 - 1;
    j_save = 1;
    indx = 1;
    i = i_save;
    j = j_save;
  end

  return
end
function [ adj_num, adj_row ] = tet_mesh_order4_adj_count ( node_num, ...
  tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_ADJ_COUNT counts the number of nodal adjacencies.
%
%  Discussion:
%
%    Assuming that the tet mesh is to be used in a finite element
%    computation, we declare that two distinct nodes are "adjacent" if and
%    only if they are both included in some tetrahedron.
%
%    It is the purpose of this routine to determine the number of
%    such adjacency relationships.
%
%    The initial count gets only the (I,J) relationships, for which
%    node I is strictly less than node J.  This value is doubled
%    to account for symmetry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(4,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Output, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Output, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
%

%
%  Each order 4 tetrahedron defines 6 adjacency pairs.
%
  pair(1,            1:  tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,            1:  tetra_num) = tetra_node(2,1:tetra_num);

  pair(1,  tetra_num+1:2*tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,  tetra_num+1:2*tetra_num) = tetra_node(3,1:tetra_num);

  pair(1,2*tetra_num+1:3*tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,2*tetra_num+1:3*tetra_num) = tetra_node(4,1:tetra_num);

  pair(1,3*tetra_num+1:4*tetra_num) = tetra_node(2,1:tetra_num);
  pair(2,3*tetra_num+1:4*tetra_num) = tetra_node(3,1:tetra_num);

  pair(1,4*tetra_num+1:5*tetra_num) = tetra_node(2,1:tetra_num);
  pair(2,4*tetra_num+1:5*tetra_num) = tetra_node(4,1:tetra_num);

  pair(1,5*tetra_num+1:6*tetra_num) = tetra_node(3,1:tetra_num);
  pair(2,5*tetra_num+1:6*tetra_num) = tetra_node(4,1:tetra_num);

  pair_num = 6 * tetra_num;
%
%  Force the nodes of each pair to be listed in ascending order.
%
  pair = i4col_sort2_a ( 2, pair_num, pair );
%
%  Rearrange the columns in ascending order.
%
  pair = i4col_sort_a ( 2, pair_num, pair );
%
%  Get the number of unique columns.
%
  pair_unique_num = i4col_sorted_unique_count ( 2, pair_num, pair );
%
%  The number of adjacencies is TWICE this value, plus the number of nodes.
%
  adj_num = 2 * pair_unique_num;
%
%  Now set up the ADJ_ROW counts.
%
  adj_row(1:node_num) = 0;

  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj_row(i) = adj_row(i) + 1;
    adj_row(j) = adj_row(j) + 1;

  end
%
%  We used ADJ_ROW to count the number of entries in each row.
%  Convert it to pointers into the ADJ array.
%
  adj_row(2:node_num+1) = adj_row(1:node_num);

  adj_row(1) = 1;
  for i = 2 : node_num+1
    adj_row(i) = adj_row(i-1) + adj_row(i);
  end

  return
end
function adj = tet_mesh_order4_adj_set ( node_num, tetra_num, tetra_node, ...
  adj_num, adj_row )

%*****************************************************************************80
%
%% TET_MESH_ORDER4_ADJ_SET sets the nodal adjacency matrix.
%
%  Discussion:
%
%    A compressed format is used for the nodal adjacency matrix.
%
%    It is assumed that we know ADJ_NUM, the number of adjacency entries
%    and the ADJ_ROW array, which keeps track of the list of slots
%    in ADJ where we can store adjacency information for each row.
%
%    We essentially repeat the work of TET_MESH_ORDER4_ADJ_COUNT, but
%    now we have a place to store the adjacency information.
%
%    A copy of the ADJ_ROW array is useful, as we can use it to keep track
%    of the next available entry in ADJ for adjacencies associated with
%    a given row.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(4,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Input, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Input, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
%
%    Output, integer ADJ(ADJ_NUM), the adjacency information.
%

%
%  Each order 4 tetrahedron defines 6 adjacency pairs.
%
  pair(1,            1:  tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,            1:  tetra_num) = tetra_node(2,1:tetra_num);

  pair(1,  tetra_num+1:2*tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,  tetra_num+1:2*tetra_num) = tetra_node(3,1:tetra_num);

  pair(1,2*tetra_num+1:3*tetra_num) = tetra_node(1,1:tetra_num);
  pair(2,2*tetra_num+1:3*tetra_num) = tetra_node(4,1:tetra_num);

  pair(1,3*tetra_num+1:4*tetra_num) = tetra_node(2,1:tetra_num);
  pair(2,3*tetra_num+1:4*tetra_num) = tetra_node(3,1:tetra_num);

  pair(1,4*tetra_num+1:5*tetra_num) = tetra_node(2,1:tetra_num);
  pair(2,4*tetra_num+1:5*tetra_num) = tetra_node(4,1:tetra_num);

  pair(1,5*tetra_num+1:6*tetra_num) = tetra_node(3,1:tetra_num);
  pair(2,5*tetra_num+1:6*tetra_num) = tetra_node(4,1:tetra_num);

  pair_num = 6 * tetra_num;
%
%  Force the nodes of each pair to be listed in ascending order.
%
  pair = i4col_sort2_a ( 2, pair_num, pair );
%
%  Rearrange the columns in ascending order.
%
  pair = i4col_sort_a ( 2, pair_num, pair );
%
%  Mark all entries of ADJ so we will know later if we missed one.
%
  adj(1:adj_num) = -1;
%
%  Copy the ADJ_ROW array and use it to keep track of the next
%  free entry for each row.
%
  adj_row_copy(1:node_num) = adj_row(1:node_num);
%
%  Now set up the ADJ_ROW counts.
%
  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj(adj_row_copy(i)) = j;
    adj_row_copy(i) = adj_row_copy(i) + 1;
    adj(adj_row_copy(j)) = i;
    adj_row_copy(j) = adj_row_copy(j) + 1;

  end

  return
end
function [ adj_num, adj_row ] = tet_mesh_order10_adj_count ( node_num, ...
  tetra_num, tetra_node )

%*****************************************************************************80
%
%% TET_MESH_ORDER10_ADJ_COUNT counts the number of nodal adjacencies.
%
%  Discussion:
%
%    Assuming that the tet mesh is to be used in a finite element
%    computation, we declare that two distinct nodes are "adjacent" if and
%    only if they are both included in some tetrahedron.
%
%    It is the purpose of this routine to determine the number of
%    such adjacency relationships.
%
%    The initial count gets only the (I,J) relationships, for which
%    node I is strictly less than node J.  This value is doubled
%    to account for symmetry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(10,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Output, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Output, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
%

%
%  Each order 10 tetrahedron defines 45 adjacency pairs.
%
  k = 0;
  for i = 1 : 9
    for j = i + 1 : 10
      pair(1,k*tet_num+1:(k+1)*tet_num) = tet_node(i,1:tet_num);
      pair(2,k*tet_num+1:(k+1)*tet_num) = tet_node(j,1:tet_num);
      k = k + 1;
    end
  end
%
%  Force the nodes of each pair to be listed in ascending order.
%
  pair_num = 45 * tetra_num;
  pair = i4col_sort2_a ( 2, pair_num, pair );
%
%  Rearrange the columns in ascending order.
%
  pair = i4col_sort_a ( 2, pair_num, pair );
%
%  Get the number of unique columns.
%
  pair_unique_num = i4col_sorted_unique_count ( 2, pair_num, pair );
%
%  The number of adjacencies is TWICE this value, plus the number of nodes.
%
  adj_num = 2 * pair_unique_num;
%
%  Now set up the ADJ_ROW counts.
%
  adj_row(1:node_num) = 0;

  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj_row(i) = adj_row(i) + 1;
    adj_row(j) = adj_row(j) + 1;

  end
%
%  We used ADJ_ROW to count the number of entries in each row.
%  Convert it to pointers into the ADJ array.
%
  adj_row(2:node_num+1) = adj_row(1:node_num);

  adj_row(1) = 1;
  for i = 2 : node_num + 1
    adj_row(i) = adj_row(i-1) + adj_row(i);
  end

  return
end
function adj = tet_mesh_order10_adj_set ( node_num, tetra_num, tetra_node, ...
  adj_num, adj_row )

%*****************************************************************************80
%
%% TET_MESH_ORDER10_ADJ_SET sets the nodal adjacency matrix.
%
%  Discussion:
%
%    A compressed format is used for the nodal adjacency matrix.
%
%    It is assumed that we know ADJ_NUM, the number of adjacency entries
%    and the ADJ_ROW array, which keeps track of the list of slots
%    in ADJ where we can store adjacency information for each row.
%
%    We essentially repeat the work of TET_MESH_ORDER4_ADJ_COUNT, but
%    now we have a place to store the adjacency information.
%
%    A copy of the ADJ_ROW array is useful, as we can use it to keep track
%    of the next available entry in ADJ for adjacencies associated with
%    a given row.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(10,TETRA_NUM), the nodes that make up the
%    tetrahedrons.
%
%    Input, integer ADJ_NUM, the total number of adjacency relationships,
%
%    Input, integer ADJ_ROW(NODE_NUM+1), the ADJ pointer array.
%
%    Output, integer ADJ(ADJ_NUM), the adjacency information.
%

%
%  Each order 10 tetrahedron defines 45 adjacency pairs.
%
  k = 0;
  for i = 1 : 9
    for j = i + 1 : 10
      pair(1,k*tet_num+1:(k+1)*tet_num) = tet_node(i,1:tet_num);
      pair(2,k*tet_num+1:(k+1)*tet_num) = tet_node(j,1:tet_num);
      k = k + 1;
    end
  end
%
%  Force the nodes of each pair to be listed in ascending order.
%
  pair_num = 45 * tetra_num;
  pair = i4col_sort2_a ( 2, pair_num, pair );
%
%  Rearrange the columns in ascending order.
%
  pair = i4col_sort_a ( 2, pair_num, pair );
%
%  Mark all entries of ADJ so we will know later if we missed one.
%
  adj(1:adj_num) = -1;
%
%  Copy the ADJ_ROW array and use it to keep track of the next
%  free entry for each row.
%
  adj_row_copy(1:node_num) = adj_row(1:node_num);
%
%  Now set up the ADJ_ROW counts.
%
  for k = 1 : pair_num

    if ( 1 < k )
      if ( pair(1,k-1) == pair(1,k) && pair(2,k-1) == pair(2,k) )
        continue
      end
    end

    i = pair(1,k);
    j = pair(2,k);

    adj(adj_row_copy(i)) = j;
    adj_row_copy(i) = adj_row_copy(i) + 1;
    adj(adj_row_copy(j)) = i;
    adj_row_copy(j) = adj_row_copy(j) + 1;

  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
