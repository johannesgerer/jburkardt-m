function [ nodeco, elnode, bdynde ] = mesh3d_extract ( filename )

%*****************************************************************************80
%
%% MESH3D_EXTRACT extracts the information from the mesh file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the MAT file.
%
%    Output, real NODECO(NODE_NUM,3), the node coordinates.
%
%    Output, integer ELNODE(ELEMENT_NUM,20), the node indices that form
%    each element.
%
%    Output, integer BDYNDE(BDY_NUM), the nodes that lie along the boundary.
%

%
%  FILENAME should refer to a MAT file, 
%  containing a single object which is a MATLAB structure.  
%
  mesh = load ( filename );
%
%  The following commands will create ordinary arrays out of the
%  three components of the structure.
%
  nodeco = mesh.nodeco;
  elnode = mesh.elnode;
  bdynde = mesh.bdynde;

  [ node_num, dim_num ] = size ( nodeco );
  [ element_num, element_order ] = size ( elnode );


  return
end

