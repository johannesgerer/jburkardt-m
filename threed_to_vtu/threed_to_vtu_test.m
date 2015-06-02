function threed_to_vtu_test ( )

%*****************************************************************************80
%
%% THREED_TO_VTU_TEST tests the THREED_TO_VTU library.
%
%  Discussion:
%
%    The data represents a flow solution in a 1x1x5 region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( '\n' );
  fprintf ( 1, 'THREED_TO_VTU_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the THREED_TO_VTU library.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read in THREED finite element data.\n' );
  fprintf ( 1, '  Write it out as a VTU file.\n' );
%
%  Load the data from text files.
%
  nodes = load ( 'case1_nodes.txt' );
  elements = load ( 'case1_elements.txt' );
  uvwp = load ( 'case1_values.txt' );

  output_filename = 'case1.vtu';

  title = 'UVWP for 3D problem';
%
%  Have the data written to a file.
%
  threed_to_vtu ( nodes, elements, uvwp, output_filename, title );
%
%  Terminate.
%
  fprintf ( '\n' );
  fprintf ( 1, 'THREED_TO_VTU_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( '\n' );
  timestamp ( );

  return
end
