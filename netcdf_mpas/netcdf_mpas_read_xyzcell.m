function [ ncells, xcell, ycell, zcell ] = netcdf_mpas_read_xyzcell ( ...
  filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_READ_XYZCELL reads xCell, yCell and zCell.
%
%  Discussion:
%
%    In this example, we know that the NETCDF file contains a dimension
%    called "nCells", and vector variables of that dimension called
%    "xCell, yCell, zCell".  These points lie on a sphere, so
%    once the data is recovered, it should be plotted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2010
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
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The name of the file is "%s"\n', filename );
%
%  Open the file.
%
  ncid = netcdf.open ( filename, 'NOWRITE' );
%
%  Get NCELLS, which is a NETCDF dimension.
%
  [ useless, ncells ] = netcdf.inqDim ( ncid, netcdf.inqDimID ( ncid, 'nCells' ) );
%
%  Get the cell coordinates, which are NETCDF variables.
%
  xcell = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'xCell' ) );
  ycell = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'yCell' ) );
  zcell = netcdf.getVar ( ncid, netcdf.inqVarID ( ncid, 'zCell' ) );
%
%  Close the file.
%
  netcdf.close ( ncid );

  return
end
