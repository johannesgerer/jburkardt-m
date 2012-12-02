function [ ncells, xcell, ycell, zcell, nedges, cellsonedge ] = ...
  netcdf_mpas_read_cellsonedge ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_READ_CELLSONEDGE gets edge information from a NETCDF MPAS grid file.
%
%  Discussion:
%
%    Now we want to extract the (X,Y,Z) locations of nodes and
%    the pairs of nodes that form edges of the triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2010
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
%    Output, integer NEDGES, the number of edges.
%
%    Output, integer CELLSONEDGE(2,NEDGES), the indices of pairs of cells
%    that are joined by a Delaunay edge.
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
%  We assume dimensions 0 and 1 are "nCells" and "nEdges";
%
  [ name, ncells ] = netcdf.inqdim ( ncid, 0 );
  [ name, nedges ] = netcdf.inqdim ( ncid, 1 );

  fprintf ( '\n' );
  fprintf ( '  Found dimension nCells, extent = %d\n', ncells );
  fprintf ( '  Found dimension nEdges, extent = %d\n', nedges );
%
%  Read the cell coordinates xCell, yCell, zCell.
%
  xcell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'xCell' ) );
  ycell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'yCell' ) );
  zcell = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'zCell' ) );
%
%  Read cellsOnEdge.
%
  cellsonedge = netcdf.getvar ( ncid, netcdf.inqVarID ( ncid, 'cellsOnEdge' ) );
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
