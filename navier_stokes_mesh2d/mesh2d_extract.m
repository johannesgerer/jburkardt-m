function [ nodeco, nodecotype, elnode, elnodetype, bdynde, bdyndetype ] = ...
  mesh2d_extract ( filename )

%*****************************************************************************80
%
%% MESH2D_EXTRACT extracts the information from the mesh file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the MAT file.
%
%    Output, real NODECO(NODE_NUM,2), the node coordinates.
%
%    Output, integer NODECOTYPE(NODE_NUM,1), the node type.
%
%    Output, integer ELNODE(ELEMENT_NUM,3), the node indices that form
%    each element.
%
%    Output, integer ELNODETYPE(ELEMENT_NUM,1), the element type.
%
%    Output, integer BDYNDE(BDY_NUM,2), pairs of nodes that form the boundary.
%
%    Output, integer BDYNDETYPE(BDY_NUM), the boundary condition type.
%
  input = fopen ( filename );

  if ( input < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH2D_EXTRACT - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'MESH2D_EXTRACT - Error!' );
  end

  line = fgets ( input );
  [ abc, count ] = sscanf ( line, '%d%d%d' );

  node_num = abc(1);
  element_num = abc(2);
  bdy_num = abc(3);

  nodeco = zeros ( node_num, 2 );
  nodecotype = zeros ( node_num, 1 );

  for node = 1 : node_num
    line = fgets ( input );
    [ abc, count ] = sscanf ( line, '%f%f%d' );
    nodeco(node,1) = abc(1);
    nodeco(node,2) = abc(2);
    nodecotype(node) = abc(3);
  end

  elnode = zeros ( element_num, 3 );
  elnodetype = zeros ( element_num,1 );

  for element = 1 : element_num
    line = fgets ( input );
    [ abcd, count ] = sscanf ( line, '%d%d%d%d' );
    elnode(element,1) = abcd(1);
    elnode(element,2) = abcd(2);
    elnode(element,3) = abcd(3);
    elnodetype(element) = abcd(4);
  end

  bdynde = zeros ( bdy_num, 2 );
  bdyndetype = zeros ( bdy_num, 1 );

  for bdy = 1 : bdynde
    line = fgets ( input );
    [ abc, count ] = sscanf ( line, '%d%d%d' );
    bdynde(node,1) = abc(1);
    bdynde(node,2) = abc(2);
    bdyndetype(node) = abc(3);
  end

  fclose ( input );

  return
end

