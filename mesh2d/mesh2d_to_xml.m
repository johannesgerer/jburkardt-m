function mesh2d_to_xml ( xml_filename, p, t )

%*****************************************************************************80
%
%% MESH2D_TO_XML writes a MESH2D mesh as a DOLFIN XML file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anders Logg, Kent-Andre Mardal, Garth Wells,
%    Automated Solution of Differential Equations by the Finite Element
%    Method: The FEniCS Book,
%    Lecture Notes in Computational Science and Engineering,
%    Springer, 2011,
%    ISBN13: 978-3642230981
%
%  Parameters:
%
%    Input, string XML_FILENAME, the name of the DOLFIN XML file to create.
%
%    Input, real P(*,2), the node coordinates.
%
%    Input, integer T(*,3), the nodes
%    that make up each element.
%
  [ p_num, ~ ] = size ( p );
  [ t_num, ~ ] = size ( t );
%
%  Enforce 0-based indexing.
%
  t = t - 1;
%
%  Open the file.
%
  xml = fopen ( xml_filename, 'wt' );

  if ( xml < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MESH2D_TO_XML - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'MESH2D_TO_XML - Error!' );
  end
%
%  Write the data.
%
  fprintf ( xml, '<?xml version="1.0" encoding="UTF-8"?>\n' );
  fprintf ( xml, '\n' );
  fprintf ( xml, '<dolfin xmlns:dolfin="http://www.fenics.org/dolfin/">\n' );
  fprintf ( xml, '  <mesh celltype="triangle" dim="2">\n' );

  fprintf ( xml, '    <vertices size="%d">\n', p_num );
  for node = 1 : p_num
    fprintf ( xml, '      <vertex index ="%d" x ="%g" y ="%g"/>\n', ...
      node - 1, p(node,1:2) );
  end
  fprintf ( xml, '    </vertices>\n' );

  fprintf ( xml, '    <cells size="%d">\n', t_num );
  for element = 1 : t_num
    fprintf ( xml, ...
      '      <triangle index ="%d" v0 ="%d" v1 ="%d" v2 ="%d"/>\n', ...
      element - 1, t(element,1:3) );
  end
  fprintf ( xml, '    </cells>\n' );
  fprintf ( xml, '  </mesh>\n' );
  fprintf ( xml, '</dolfin>\n' );

  fclose ( xml );

  return
end
