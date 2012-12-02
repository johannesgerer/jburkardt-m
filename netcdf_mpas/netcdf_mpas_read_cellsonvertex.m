function [ ncells, xcell, ycell, zcell, nvertices, cellsonvertex ] = ...
  netcdf_mpas_read_cellsonvertex ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_READ_CELLSONVERTEX gets vertex info from a NETCDF MPAS grid file.
%
%  Discussion:
%
%    Now we want to extract the (X,Y,Z) locations of cells and
%    the triples of nodes that form the triangles around each vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russ Rew, Glenn Davis, Steve Emmerson, Harvey Davies, Ed Hartne,
%    The NETCDF User's Guide,
%    Unidata Program Center, March 2009.
%
%  Parameters:
%
%    Input, string FILENAME, the name of the NETCDF file to examine.
%
%    Output, integer NCELLS, the number of nodes.
%
%    Output, real XCELL(NCELLS), YCELL(NCELLS), ZCELL(NCELLS), the coordinates
%    of the nodes.
%
%    Output, integer NVERTICES, the number of vertexs.
%
%    Output, integer CELLSONVERTEX(3,NVERTICES), the indices of the three
%    cells that form the triangle around each vertex.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The name of the file is "%s"\n', filename );
%
%  Open the file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Return information about the NETCDF file.
%  In particular, we need the number of dimensions.
%
  [ ndims, nvars, ngatts, unlimdimid ] = netcdf.inq ( ncid );
%
%  We assume dimensions 0 and 2 are "nCells" and "nVertices";
%  I assume there is a better way, namely to get this by NAME
%  rather than INDEX!
%
  [ name, ncells ] = netcdf.inqdim ( ncid, 0 );
  [ name, nvertices ] = netcdf.inqdim ( ncid, 2 );

  fprintf ( '\n' );
  fprintf ( '  Found dimension nCells, extent = %d\n', ncells );
  fprintf ( '  Found dimension nVertices, extent = %d\n', nvertices );
%
%  Read the cell coordinates xCell, yCell, zCell.
%
  xcell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'xCell' ) );
  ycell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'yCell' ) );
  zcell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'zCell' ) );
%
%  Read cellsOnVertex.
%
  cellsonvertex = netcdf.getvar ( ncid, ...
    netcdf.inqVarID ( ncid, 'cellsOnVertex' ) );
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
