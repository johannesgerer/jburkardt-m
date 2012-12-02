function twod_to_vtu_test ( )

%*****************************************************************************80
%
%% TWOD_TO_VTU_TEST tests TWOD_TO_VTU.
%
%  Discussion:
%
%    The data represents a flow solution in a 10 by 3 channel.
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
  fprintf ( 1, 'TWOD_TO_VTU_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TWOD_TO_VTU library.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read in TWOD finite element data.\n' );
  fprintf ( 1, '  Write it out as a VTU file.\n' );
%
%  Load the data from text files.
%
  nodes = load ( 'channel_nodes.txt' );
  elements = load ( 'channel_elements.txt' );
  uvp = load ( 'channel_values.txt' );

  output_filename = 'channel.vtu';

  title = 'UVP for 10x3 2D channel problem';
%
%  Have the data written to a file.
%
  twod_to_vtu ( nodes, elements, uvp, output_filename, title );
%
%  Terminate.
%
  fprintf ( '\n' );
  fprintf ( 1, 'TWOD_TO_VTU_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( '\n' );
  timestamp ( );

  return
end
