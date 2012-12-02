function tec_to_vtk ( )

%*****************************************************************************80
%
%% TEC_TO_VTK converts a particular TECPLOT file to VTK files.
%
%  Discussion:
%
%    This program was written for a specific purpose, but some of its
%    structure might be useful for other situations.
%
%    The program needed to read a single TECPLOT file, containing 80
%    "snapshots" of the surface of a 3D object.  The object was defined
%    by 500 nodes and 996 triangles.
%
%    By converting each snapshot to a VTK unstructured grid file, it
%    was possible to read the data into the Paraview program.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
  input_filename = 'rbc.plt';
  input_unit = fopen ( input_filename, 'rt' );

  output_num = 0;
  output_filename = 'rbc_000.vtk';

  point_num = 500;
  cell_num = 996;
  order = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_TO_VTK\n' );
  fprintf ( 1, '  Read the TECPLOT file "%s"\n', input_filename );
  fprintf ( 1, '  which contains multiple images of a 3d triangular mesh\n' );
  fprintf ( 1, '  using %d nodes and %d triangles.\n', point_num, cell_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write each image to a separate VTK Unstructured Grid file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  #  VTK filename  TECPLOT title\n' );
  fprintf ( 1, '\n' );

  while ( 1 )
%
%  Read three text lines (TITLE, VARIABLES, ZONE) and ignore them.
%
    text = fgetl ( input_unit );

    if ( text == -1 )
      break
    end

    output_num = output_num + 1;
    output_filename = file_name_inc ( output_filename );

    fprintf ( 1, '%3d  %s  %s\n', output_num, output_filename, text );

    fgetl ( input_unit );
    fgetl ( input_unit );

    output_unit = fopen ( output_filename, 'wt' );
%
%  Write header.
%
    fprintf ( output_unit, '# vtk DataFile Version 1.0\n' );
    fprintf ( output_unit, '%s  3D Unstructured Grid of Triangles\n', output_filename );
    fprintf ( output_unit, 'ASCII\n' );
    fprintf ( output_unit, '\n' );
    fprintf ( output_unit, 'DATASET UNSTRUCTURED_GRID\n' );
%   
%  Copy 500 X Y Z lines.
%
    fprintf ( output_unit, 'POINTS %d float\n', point_num );
    for i = 1 : point_num
      text = fgetl ( input_unit );
      fprintf ( output_unit, '%s\n', text );
    end
%
%  Copy the connectivity information.
%  VTK will want 0-based indices, so actually read the data as integers.
%
    fprintf ( output_unit, 'CELLS %d %d\n', cell_num, ( order + 1 ) * cell_num );
    for i = 1 : cell_num
      text = fgetl ( input_unit );
      cell = sscanf ( text, '%d' );
      cell = cell - 1;
      fprintf ( output_unit, '%d  %d  %d  %d\n', order, cell );
    end
%
%  Write the cell types.
%
    fprintf ( output_unit, 'CELL_TYPES %d\n', cell_num );
    for i = 1 : cell_num
      fprintf ( output_unit, '5\n' );
    end

    fclose ( output_unit );

  end

  fclose ( input_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_TO_VTK:\n' );
  fprintf ( 1, '  Created %d output files.\n', output_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_TO_VTK:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function file_name = file_name_inc ( file_name )

%*****************************************************************************80
%
%% FILE_NAME_INC generates the next filename in a series.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the string to be incremented.
%
%    Output, string FILE_NAME, the incremented string.
%
  lens = length ( file_name );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_INC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_INC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = file_name(i);

    if ( '0' <= c && c <= '8' )

      c = c + 1;
      
      file_name(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      file_name(i) = c;

    end

  end

  if ( change == 0 )
    file_name = ' ';
  end

  return
end
