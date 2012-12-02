function [ dim, vertices, edges, triangles, quadrilaterals, tetrahedrons, ...
  hexahedrons ] = mesh_size_read ( filename )

%*****************************************************************************80
%
%% MESH_SIZE_READ reads a MESH file defining a mesh and returns sizes only.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Pascal Frey,
%    MEDIT: An interactive mesh visualization software,
%    Technical Report RT-0253,
%    Institut National de Recherche en Informatique et en Automatique,
%    03 December 2001.
%
%  Parameters:
%
%    Input, string FILENAME, the name of the MESH file.
%
%    Output, integer DIM, the spatial dimension, which should be 2 or 3.
%
%    Output, integer VERTICES, the number of vertices.
%
%    Output, integer EDGES, the number of edges (may be 0).
%
%    Output, integer TRIANGLES, the number of triangles (may be 0).
%
%    Output, integer QUADRILATERALS, the number of quadrilaterals (may be 0).
%
%    Output, integer TETRAHEDRONS, the number of tetrahedrons (may be 0).
%
%    Output, integer HEXAHEDRONS, the number of hexahedrons (may be 0).
%

%
%  Initialize everything to nothing.
%
  dim = 0;
  vertices = 0;
  edges = 0;
  triangles = 0;
  quadrilaterals = 0;
  tetrahedrons = 0;
  hexahedrons = 0;
%
%  Open the file.
%
  unit = fopen ( filename, 'rt' );

  if ( unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH_SIZE_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', filename );
    error ( 'MESH_SIZE_READ - Error!' );
    return
  end
%
%  Read lines til you get alphanumerics and determine a "mode"
%
  line_num = 0;
  keyword = 'NONE';

  while ( 1 )

    text = fgetl ( unit );

    if ( text == -1 )
      break
    end

    line_num = line_num + 1;

    if ( s_len_trim ( text ) == 0 )
      keyword = 'NONE';
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Remove initial blanks.
%

%
%  Expecting a keyword.
%
        if ( s_eqi ( text, 'CORNERS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'DIMENSION' ) )

      keyword = 'DIMENSION';

    elseif ( s_eqi ( text, 'EDGES' ) )

      keyword = 'EDGES';

    elseif ( s_eqi ( text, 'END' ) )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  END statement encountered.\n' );
      break

    elseif ( s_eqi ( text, 'HEXAHEDRA' ) || s_eqi ( text, 'HEXAHEDRONS' ) )

      keyword = 'HEXAHEDRONS';

    elseif ( s_begin ( text, 'MESHVERSIONFORMATTED' ) )

    elseif ( s_eqi ( text, 'NORMALATQUADRILATERALVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALATTRIANGLEVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALATVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'NORMALS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'QUADRILATERALS' ) )

      keyword = 'QUADRILATERALS';

    elseif ( s_eqi ( text, 'REQUIREDEDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'REQUIREDVERTICES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'RIDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TANGENTATEDGES' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TANGENTS' ) )

      keyword = 'SKIP';

    elseif ( s_eqi ( text, 'TETRAHEDRA' ) || s_eqi ( text, 'TETRAHEDRONS' ) )

      keyword = 'TETRAHEDRONS';

    elseif ( s_eqi ( text, 'TRIANGLES' ) )

      keyword = 'TRIANGLES';

    elseif ( s_eqi ( text, 'VERTICES' ) )

      keyword = 'VERTICES';
%
%  Presumably, numeric data to be processed by keyword.
%
    elseif ( s_eqi ( keyword, 'DIMENSION' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        dim = value;
      end

      keyword = 'NONE';

    elseif ( s_eqi ( keyword, 'EDGES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        edges = value;
      end

      keyword = 'EDGE_VERTEX';

    elseif ( s_eqi ( keyword, 'EDGE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d' );

    elseif ( s_eqi ( keyword, 'HEXAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        hexahedrons = value;
      end

      keyword = 'HEXAHEDRON_VERTEX';

    elseif ( s_eqi ( keyword, 'HEXAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'QUADRILATERALS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        quadrilaterals = value;
      end

      keyword = 'QUADRILATERAL_VERTEX';

    elseif ( s_eqi ( keyword, 'QUADRILATERAL_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'TETRAHEDRONS' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        tetrahedrons = value;
      end

      keyword = 'TETRAHEDRON_VERTEX';

    elseif ( s_eqi ( keyword, 'TETRAHEDRON_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'TRIANGLES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        triangles = value;
      end

      keyword = 'TRIANGLE_VERTEX';

    elseif ( s_eqi ( keyword, 'TRIANGLE_VERTEX' ) )

      [ value, count ] = sscanf ( text, '%d  %d  %d  %d' );

    elseif ( s_eqi ( keyword, 'VERTICES' ) )

      [ value, count ] = sscanf ( text, '%d' );

      if ( count == 1 )
        vertices = value;
      end

      keyword = 'VERTEX_COORDINATE';

    elseif ( s_eqi ( keyword, 'VERTEX_COORDINATE' ) )

      if ( dim == 2 )
        [ value, count ] = sscanf ( text, '%f  %f  %d' );
      elseif ( dim == 3 )
        [ value, count ] = sscanf ( text, '%f  %f  %f  %d' );
      end

    elseif ( s_eqi ( keyword, 'SKIP' ) )

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'MESH_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Could not find keyword while reading line %d:\n', line_num );
      fprintf ( 1, '"%s"\n', text );
      error ( 'MESH_SIZE_READ - Fatal error!\n' );

    end
  end
%
%  Close the file.
%
  fclose ( unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read %d lines from "%s".\n', line_num, filename );

  return
end

