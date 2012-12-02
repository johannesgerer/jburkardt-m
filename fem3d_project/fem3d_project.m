function fem3d_project ( sample_prefix, fem_prefix )

%*****************************************************************************80
%
%% MAIN is the main program for FEM3D_PROJECT.
%
%  Discussion:
%
%    FEM2D_PROJECT reads files defining a sampling of a (scalar or vector)
%    function of 3 arguments, and a list of nodes and tetrahedral elements
%    to use for a finite element representation of the data.
%
%    It computes a set of finite element coefficients to be associated with
%    the given finite element mesh, and writes that information to a file
%    so that an FEM representation is formed by the node, element and value
%    files.
%
%  Usage:
%
%    fem3d_project ( 'sample_prefix', 'fem_prefix' )
%
%    where 'sample_prefix' is the common prefix for the SAMPLE files:
%
%    * sample_prefix_nodes.txt,     the node coordinates where samples were taken;
%    * sample_prefix_elements.txt,  the 4 nodes that make up each element;
%    * sample_prefix_values.txt,    the sample values.
%
%    and 'fem_prefix' is the common prefix for the FEM files:
%
%    * fem_prefix_nodes.txt,    the node coordinates;
%    * fem_prefix_elements.txt, the 4 nodes that make up each element;
%    * fem_prefix_values.txt,   the values defined at each node (output).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string SAMPLE_PREFIX, the common prefix for sample files.
%
%    Input, string FEM_PREFIX, the common prefix for FEM files.
%
  timestamp ( );

  fprintf ( '\n' );
  fprintf ( 'FEM3D_PROJECT\n' );
  fprintf ( '  MATLAB version.\n' );
  fprintf ( '\n' );
  fprintf ( '  Read files defining a sampling of a function of 3 arguments.\n' );
  fprintf ( '  Read files defining a finite element mesh.\n' );
  fprintf ( '  Project the sample data onto the mesh, and\n' );
  fprintf ( '  write a file of FEM coefficient values.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( '\n' );
    sample_prefix = input ( 'Enter the sample file prefix:' );

  else

  end

  if ( nargin < 2 )

    fprintf ( '\n' );
    fem_prefix = input ( 'Enter the FEM file prefix:' );

  else

  end
%
%  Create the filenames.
%
  sample_node_filename    = strcat ( sample_prefix, '_nodes.txt' );
  sample_element_filename = strcat ( sample_prefix, '_elements.txt' );
  sample_value_filename   = strcat ( sample_prefix, '_values.txt' );

  fem_node_filename       = strcat ( fem_prefix, '_nodes.txt' );
  fem_element_filename    = strcat ( fem_prefix, '_elements.txt' );
  fem_value_filename      = strcat ( fem_prefix, '_values.txt' );
%
%  Read the SAMPLE NODE, ELEMENT and VALUE data.
%
  [ sample_node_dim, sample_node_num ] = r8mat_header_read ( ...
    sample_node_filename );

  fprintf ( '\n' );
  fprintf ( '  Sample node spatial dimension is %d\n', sample_node_dim );
  fprintf ( '  Sample node number is            %d\n', sample_node_num );

  if ( sample_node_dim ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'FEM3D_PROJECT - Fatal error!\n' );
    fprintf ( '  Spatial dimension of the sample nodes is not 3.\n' );
    return
  end

  sample_node_xyz = r8mat_data_read ( sample_node_filename, sample_node_dim, ...
    sample_node_num );

  [ sample_element_order, sample_element_num ] = i4mat_header_read ( ...
    sample_element_filename );

  fprintf ( '\n' );
  fprintf ( '  Sample element order is  %d\n', sample_element_order );
  fprintf ( '  Sample element number is %d\n', sample_element_num );

  if ( sample_element_order ~= 4 )
    fprintf ( '\n' );
    fprintf ( 'FEM3D_PROJECT - Fatal error!\n' );
    fprintf ( '  The sample element order must be 4.\n' );
    return
  end

  sample_element_node = i4mat_data_read ( sample_element_filename, ...
    sample_element_order, sample_element_num );

  [ sample_value_dim, sample_value_num ] = r8mat_header_read ( ...
    sample_value_filename );

  fprintf ( '\n' );
  fprintf ( '  Sample value dimension is        %d\n', sample_value_dim );
  fprintf ( '  Sample value number is           %d\n', sample_value_num );

  if ( sample_value_num ~= sample_node_num )
    fprintf ( '\n' );
    fprintf ( 'FEM3D_PROJECT - Fatal error!\n' );
    fprintf ( '  Number of sample nodes and values are not equal.\n' );
    return
  end

  sample_value = r8mat_data_read ( sample_value_filename, sample_value_dim, ...
    sample_value_num );
%
%  Create the sample element neighbor array.
%
  sample_element_neighbor = tet_mesh_neighbor_tets ( sample_element_order, ...
    sample_element_num, sample_element_node );

  fprintf ( '\n' );
  fprintf ( '  The element neighbor array has been computed.\n' );
%
%  Read the FEM NODE and ELEMENT data.
%
  [ fem_node_dim, fem_node_num ] = r8mat_header_read ( fem_node_filename );

  fprintf ( '\n' );
  fprintf ( '  The FEM node dimension is        %d\n', fem_node_dim );
  fprintf ( '  The FEM node number is           %d\n', fem_node_num );

  if ( fem_node_dim ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'FEM3D_PROJECT - Fatal error!\n' );
    fprintf ( '  Spatial dimension of the nodes is not 3.\n' );
    return
  end

  fem_node_xyz = r8mat_data_read ( fem_node_filename, fem_node_dim, ...
    fem_node_num );

  [ fem_element_order, fem_element_num ] = i4mat_header_read ( ...
    fem_element_filename );

  fprintf ( '  The FEM element order is         %d\n', fem_element_order );
  fprintf ( '  The FEM element number is        %d\n', fem_element_num );

  if ( fem_element_order ~= 4 )
    fprintf ( '\n' );
    fprintf ( 'FEM3D_PROJECT - Fatal error!\n' );
    fprintf ( '  The FEM element order must be 4.\n' );
    return
  end

  fem_element_node = i4mat_data_read ( fem_element_filename, ...
    fem_element_order, fem_element_num );
%
%  Compute the FEM values.
%
  fem_value_dim = sample_value_dim;
  fem_value_num = fem_node_num;

  fem_value = fem3d_transfer ( sample_element_order, ...
    sample_element_num, sample_value_dim, ...
    sample_node_xyz, sample_element_node, sample_element_neighbor, sample_value, ...
    fem_node_num, ...
    fem_element_num, fem_value_dim, fem_value_num, ...
    fem_node_xyz, fem_element_node );
%
%  Write the FEM values.
%
  r8mat_write ( fem_value_filename, fem_value_dim, fem_value_num, fem_value );

  fprintf ( '\n' );
  fprintf ( '  FEM value data written to "%s".\n',  fem_value_filename );
%
%  Terminate.
%
  fprintf ( '\n' );
  fprintf ( 'FEM3D_PROJECT\n' );
  fprintf ( '  Normal end of execution.\n' );

  fprintf ( '\n' );
  timestamp ( );

  return
end
function phi = basis_mn_tet4 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_TET4: all bases at N points for a TET4 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices of a tetrahedron.
%
%    It works directly with these coordinates, and does not refer to a
%    reference element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Olgierd Zienkiewicz,
%    The Finite Element Method,
%    Sixth Edition,
%    Butterworth-Heinemann, 2005,
%    ISBN: 0750663200,
%    LC: TA640.2.Z54.
%
%  Parameters:
%
%    Input, real T(3,4), the coordinates of the vertices.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(3,N), the points where the basis functions
%    are to be evaluated.
%
%    Output, real PHI(4,N), the value of the basis functions
%    at the evaluation points.
%
  phi(1:4,1:n) = 0.0;
%
%           | x1 x2 x3 x4 |
%  Volume = | y1 y2 y3 y4 |
%           | z1 z2 z3 z4 |
%           |  1  1  1  1 |
%
  volume =                             ...
      t(1,1) * (                       ...
        t(2,2) * ( t(3,3) - t(3,4) )   ...
      - t(2,3) * ( t(3,2) - t(3,4) )   ...
      + t(2,4) * ( t(3,2) - t(3,3) ) ) ...
    - t(1,2) * (                       ...
        t(2,1) * ( t(3,3) - t(3,4) )   ...
      - t(2,3) * ( t(3,1) - t(3,4) )   ...
      + t(2,4) * ( t(3,1) - t(3,3) ) ) ...
    + t(1,3) * (                       ...
        t(2,1) * ( t(3,2) - t(3,4) )   ...
      - t(2,2) * ( t(3,1) - t(3,4) )   ...
      + t(2,4) * ( t(3,1) - t(3,2) ) ) ...
    - t(1,4) * (                       ...
        t(2,1) * ( t(3,2) - t(3,3) )   ...
      - t(2,2) * ( t(3,1) - t(3,3) )   ...
      + t(2,3) * ( t(3,1) - t(3,2) ) );

  if ( volume == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_MN_TET3 - Fatal error!\n' );
    fprintf ( 1, '  Element has zero volume.\n' );
    error ( 'BASIS_MN_TET4 - Fatal error!\n' );
  end
%
%             | xp x2 x3 x4 |
%  Phi(1,P) = | yp y2 y3 y4 | / volume
%             | zp z2 z3 z4 |
%             |  1  1  1  1 |
%
  phi(1,1:n) = (                           ...
      p(1,1:n) * (                         ...
        t(2,2)   * ( t(3,3)   - t(3,4) )   ...
      - t(2,3)   * ( t(3,2)   - t(3,4) )   ...
      + t(2,4)   * ( t(3,2)   - t(3,3) ) ) ...
    - t(1,2) * (                           ...
        p(2,1:n) * ( t(3,3)   - t(3,4) )   ...
      - t(2,3)   * ( p(3,1:n) - t(3,4) )   ...
      + t(2,4)   * ( p(3,1:n) - t(3,3) ) ) ...
    + t(1,3) * (                           ...
        p(2,1:n) * ( t(3,2)   - t(3,4) )   ...
      - t(2,2)   * ( p(3,1:n) - t(3,4) )   ...
      + t(2,4)   * ( p(3,1:n) - t(3,2) ) ) ...
    - t(1,4) * (                           ...
        p(2,1:n) * ( t(3,2)   - t(3,3) )   ...
      - t(2,2)   * ( p(3,1:n) - t(3,3) )   ...
      + t(2,3)   * ( p(3,1:n) - t(3,2) ) ) ) / volume;
%
%             | x1 xp x3 x4 |
%  Phi(2,P) = | y1 yp y3 y4 | / volume
%             | z1 zp z3 z4 |
%             |  1  1  1  1 |
%
  phi(2,1:n) = (                             ...
      t(1,1) * (                             ...
        p(2,1:n) * ( t(3,3)   - t(3,4) )     ...
      - t(2,3)   * ( p(3,1:n) - t(3,4) )     ...
      + t(2,4)   * ( p(3,1:n) - t(3,3) ) )   ...
    - p(1,1:n)   * (                         ...
        t(2,1)   * ( t(3,3)   - t(3,4) )     ...
      - t(2,3)   * ( t(3,1)   - t(3,4) )     ...
      + t(2,4)   * ( t(3,1)   - t(3,3) ) )   ...
    + t(1,3) * (                             ...
        t(2,1)   * ( p(3,1:n) - t(3,4) )     ...
      - p(2,1:n) * ( t(3,1)   - t(3,4) )     ...
      + t(2,4)   * ( t(3,1)   - p(3,1:n) ) ) ...
    - t(1,4) * (                             ...
        t(2,1)   * ( p(3,1:n) - t(3,3) )     ...
      - p(2,1:n) * ( t(3,1)   - t(3,3) )     ...
      + t(2,3)   * ( t(3,1)   - p(3,1:n) ) ) ) / volume;
%
%             | x1 x2 xp x4 |
%  Phi(3,P) = | y1 y2 yp y4 | / volume
%             | z1 z2 zp z4 |
%             |  1  1  1  1 |
%
  phi(3,1:n) = (                             ...
      t(1,1) * (                             ...
        t(2,2)   * ( p(3,1:n) - t(3,4) )     ...
      - p(2,1:n) * ( t(3,2)   - t(3,4) )     ...
      + t(2,4)   * ( t(3,2)   - p(3,1:n) ) ) ...
    - t(1,2) * (                             ...
        t(2,1)   * ( p(3,1:n) - t(3,4) )     ...
      - p(2,1:n) * ( t(3,1)   - t(3,4) )     ...
      + t(2,4)   * ( t(3,1)   - p(3,1:n) ) ) ...
    + p(1,1:n) * (                           ...
        t(2,1)   * ( t(3,2)   - t(3,4) )     ...
      - t(2,2)   * ( t(3,1)   - t(3,4) )     ...
      + t(2,4)   * ( t(3,1)   - t(3,2) ) )   ...
    - t(1,4) * (                             ...
        t(2,1)   * ( t(3,2)   - p(3,1:n) )   ...
      - t(2,2)   * ( t(3,1)   - p(3,1:n) )   ...
      + p(2,1:n) * ( t(3,1)   - t(3,2) ) ) ) / volume;
%
%             | x1 x2 x3 xp |
%  Phi(4,P) = | y1 y2 y3 yp | / volume
%             | z1 z2 z3 zp |
%             |  1  1  1  1 |
%
  phi(4,1:n) = (                             ...
      t(1,1) * (                             ...
        t(2,2)   * ( t(3,3)   - p(3,1:n) )   ...
      - t(2,3)   * ( t(3,2)   - p(3,1:n) )   ...
      + p(2,1:n) * ( t(3,2)   - t(3,3) ) )   ...
    - t(1,2) * (                             ...
        t(2,1)   * ( t(3,3)   - p(3,1:n) )   ...
      - t(2,3)   * ( t(3,1)   - p(3,1:n) )   ...
      + p(2,1:n) * ( t(3,1)   - t(3,3) ) )   ...
    + t(1,3) * (                             ...
        t(2,1)   * ( t(3,2)   - p(3,1:n) )   ...
      - t(2,2)   * ( t(3,1)   - p(3,1:n) )   ...
      + p(2,1:n) * ( t(3,1)   - t(3,2) ) )   ...
    - p(1,1:n) * (                           ...
        t(2,1)   * ( t(3,2)   - t(3,3) )     ...
      - t(2,2)   * ( t(3,1)   - t(3,3) )     ...
      + t(2,3)   * ( t(3,1)   - t(3,2) ) ) ) / volume;

  return
end
function fem_value = fem3d_transfer ( sample_element_order, ...
  sample_element_num, sample_value_dim, ...
  sample_node_xyz, sample_element_node, sample_element_neighbor, sample_value, ...
  fem_node_num, ...
  fem_element_num, fem_value_dim, fem_value_num, ...
  fem_node_xyz, fem_element_node )

%*****************************************************************************80
%
%% FEM3D_TRANSFER "transfers" from one finite element mesh to another.
%
%  BAD THINGS:
%
%    1) the linear system A*X=B is defined with A being a full storage matrix.
%    2) the quadrature rule used is low order.
%    3) theelements are assumed to be linear.
%
%  Discussion:
%
%    We are given a set of "sample" finite element function defined
%    by SAMPLE_NODE_XYZ, SAMPLE_ELEMENT, and SAMPLE_VALUE.
%
%    We are given a second finite element mesh, FEM_NODE_XYZ and
%    FEM_ELEMENT_NODE.
%
%    Our aim is to "project" the sample data values into the finite element
%    space, that is, to come up with a finite element function FEM_VALUE which
%    well approximates the sample data.
%
%    Now let W(x,y,z) represent a function interpolating the sample data, and
%    let Vijk(x,y,z) represent the finite element basis function associated with
%    node IJK.
%
%    Then we seek the coefficient vector U corresponding to a finite element
%    function U(x,y,z) of the form:
%
%      U(x,y,z) = sum ( 1 <= IJK <= N ) Uijk * Vijk(x,y,z)
%
%    To determine the coefficent vector entries U, we form a set of
%    projection equations.  For node IJK at grid point (I,J,K), the associated
%    basis function Vk(x,y,z) is used to pose the equation:
%
%      Integral U(x,y,z) Vijk(x,y,z) dx dy dz 
%        = Integral W(x,y,z) Vijk(x,y,z) dx dy dz
%
%    The left hand side is the usual stiffness matrix times the desired
%    coefficient vector U.  To complete the system, we simply need to
%    determine the right hand side, that is, the integral of the data function
%    W against the basis function Vk.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SAMPLE_NODE_NUM, the number of nodes.
%
%    Input, integer SAMPLE_ELEMENT_ORDER, the element order.
%
%    Input, integer SAMPLE_ELEMENT_NUM, the number of elements.
%
%    Input, integer SAMPLE_VALUE_DIM, the value dimension.
%
%    Input, integer SAMPLE_VALUE_NUM, the number of values.
%
%    Input, real SAMPLE_NODE_XYZ(3,SAMPLE_NODE_NUM), the nodes.
%
%    Input, integer SAMPLE_ELEMENT_NODE(SAMPLE_ELEMENT_ORDER,SAMPLE_ELEMENT_NUM),
%    the nodes that make up each element.
%
%    Input, integer SAMPLE_ELEMENT_NEIGHBOR(3,SAMPLE_ELEMENT_NUM),
%    the neighbor triangles.
%
%    Input, real SAMPLE_VALUE(SAMPLE_VALUE_DIM,SAMPLE_NODE_NUM),
%    the values.
%
%    Input, integer FEM_NODE_NUM, the number of nodes.
%
%    Input, integer FEM_ELEMENT_ORDER, the element order.
%
%    Input, integer FEM_ELEMENT_NUM, the number of elements.
%
%    Input, integer FEM_VALUE_DIM, the value dimension.
%
%    Input, integer FEM_VALUE_NUM, the number of values.
%
%    Input, real FEM_NODE_XYZ(3,FEM_NODE_NUM), the nodes.
%
%    Input, integer FEM_ELEMENT_NODE(FEM_ELEMENT_ORDER,FEM_ELEMENT_NUM),
%    the nodes that make up each element.
%
%    Output, real FEM_VALUE(FEM_VALUE_DIM,FEM_VALUE_NUM),
%    the values.
%
  quad_num = 4;
%
%  Assemble the coefficient matrix A and the right-hand side B.
%
  b = zeros ( fem_node_num, fem_value_dim );
  a = zeros ( fem_node_num, fem_node_num);

  for element = 1 : fem_element_num

    tet_xyz(1:3,1:4) = fem_node_xyz(1:3,fem_element_node(1:4,element));

    volume = tetrahedron_volume ( tet_xyz );

    [ ref_weight, ref_quad ] = tetrahedron_unit_quad04 ( );

    tet_quad(1:3,1:quad_num) = tet_xyz(1:3,1:4) * ref_quad(1:4,1:quad_num);
%
%  Consider each quadrature point.
%  Here, we use the midside nodes as quadrature points.
%
    for quad = 1 : quad_num
%
%  Evaluate the basis functions at the quadrature point.
%
      project_node_num = 1;
      project_node_xyz(1:3,1) = tet_quad(1:3,quad);
      phi = basis_mn_tet4 ( tet_xyz, 1, project_node_xyz );
%
%  Consider each test function in the element.
%
      for i = 1 : 4

        ni = fem_element_node(i,element);
%
%  The projection takes place here.  The finite element code needs the value
%  of the sample function at the point (XQ,YQ,ZQ).  The call to PROJECTION
%  locates (XQ,YQ,ZQ) in the tet mesh of sample data, and returns a
%  value produced by piecewise linear interpolation.
%
        project_value = projection ( sample_node_xyz, ...
          sample_element_order, sample_element_num, sample_element_node, ...
          sample_element_neighbor, sample_value_dim, sample_value, ...
          project_node_num, project_node_xyz );

        b(ni,1:fem_value_dim) = b(ni,1:fem_value_dim) ...
          + volume * ref_weight(quad) * project_value(1:fem_value_dim,1)' * phi(i);
%
%  Consider each basis function in the element.
%
        for j = 1 : 4

          nj = fem_element_node(j,element);

          a(ni,nj) = a(ni,nj) + volume * ref_weight(quad) * phi(i) * phi(j);

        end

      end

    end

  end
%
%  SOLVE the linear system A * X = B.
%
  fem_value(1:fem_value_dim,1:fem_value_num) = ( a \ b )';

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
  end

  column_num = s_word_count ( line );

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function isgn = i4col_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_COMPARE compares columns I and J of a integer array.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      ISGN = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an array of N columns of vectors of length M.
%
%    Input, integer I, J, the columns to be compared.
%    I and J must be between 1 and N.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, column I < column J,
%     0, column I = column J,
%    +1, column J < column I.
%

%
%  Check.
%
  if ( i < 1)
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index I = %d < 1.\n', i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index I = %d.\n', n, i );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( j < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index J = %d < 1.\n', j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  N = %d < column index J = %d.\n', n, j );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  isgn = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= m )

    if ( a(k,i) < a(k,j) )
      isgn = -1;
      return
    elseif ( a(k,j) < a(k,i) )
      isgn = +1;
      return
    end

    k = k + 1;

  end

  return
end
function a = i4col_sort_a ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORT_A ascending sorts an I4COL.
%
%  Discussion:
%
%    In lexicographic order, the statement "X < Y", applied to two real
%    vectors X and Y of length M, means that there is some index I, with
%    1 <= I <= M, with the property that
%
%      X(J) = Y(J) for J < I,
%    and
%      X(I) < Y(I).
%
%    In other words, the first time they differ, X is smaller.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A, and the length of
%    a vector of data.
%
%    Input, integer N, the number of columns of A.
%
%    Input, integer A(M,N), the array of N columns of M-vectors.
%
%    Output, integer A(M,N), the columns of A have been sorted in ascending
%    lexicographic order.
%
  if ( m <= 0 )
    return
  end

  if ( n <= 1 )
    return
  end
%
%  Initialize.
%
  indx = 0;
  isgn = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      a = i4col_swap ( m, n, a, i, j );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = i4col_compare ( m, n, a, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
function a = i4col_swap ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4COL_SWAP swaps columns I and J of a integer array of column data.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1  2  3  4
%        5  6  7  8
%        9 10 11 12 )
%
%    Output:
%
%      A = (
%        1  4  3  2
%        5  8  7  6
%        9 12 11 10 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer A(M,N), an array of N columns of length M.
%
%    Input, integer I, J, the columns to be swapped.
%
%    Output, integer A(M,N), the array, with columns I and J swapped.
%
  if ( i < 1 || n < i || j < 1 || n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_SWAP - Fatal error!\n' );
    fprintf ( 1, '  I or J is out of bounds.\n' );
    fprintf ( 1, '  I =    %d\n', i );
    fprintf ( 1, '  J =    %d\n', j );
    fprintf ( 1, '  N =    %d\n', n );
    error ( 'I4COL_SWAP - Fatal error!' );
  end

  if ( i == j )
    return
  end

  col(1:m) = a(1:m,i)';
  a(1:m,i) = a(1:m,j);
  a(1:m,j) = col(1:m)';

  return
end
function [ j1, j2, j3 ] = i4i4i4_sort_a ( i1, i2, i3 )

%*****************************************************************************80
%
%% I4I4I4_SORT_A ascending sorts a triple of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2, I3, the values to sort.
%
%    Output, integer J1, J2, J3, the sorted values.
%
  j1 = min ( min ( i1, i2 ), min ( i2, i3 ) );
  j2 = min ( max ( i1, i2 ), ...
       min ( max ( i2, i3 ), max ( i3, i1 ) ) );
  j3 = max ( max ( i1, i2 ), max ( i2, i3 ) );

  return
end
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function sample_value = projection ( fem_node_xyz, ...
  fem_element_order, fem_element_num, fem_element_node, ...
  fem_element_neighbor, fem_value_dim, fem_value, sample_node_num, ...
  sample_node_xyz )

%*****************************************************************************80
%
%% PROJECTION evaluates an FEM function on a TET4 triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FEM_NODE_NUM, the number of nodes.
%
%    Input, real FEM_NODE_XYZ(3,FEM_NODE_NUM), the coordinates
%    of the nodes.
%
%    Input, integer FEM_ELEMENT_ORDER, the order of the elements.
%
%    Input, integer FEM_ELEMENT_NUM, the number of elements.
%
%    Input, integer FEM_ELEMENT_NODE(FEM_ELEMENT_ORDER,FEM_ELEMENT_NUM), the
%    nodes that make up each element.
%
%    Input, integer FEM_ELEMENT_NEIGHBOR(4,FEM_ELEMENT_NUM), the
%    index of the neighboring element on each side, or -1 if no neighbor there.
%
%    Input, integer FEM_VALUE_DIM, the "dimension" of the values.
%
%    Input, real FEM_VALUE(FEM_VALUE_DIM,FEM_NODE_NUM), the
%    finite element coefficient values at each node.
%
%    Input, integer SAMPLE_NODE_NUM, the number of sample nodes.
%
%    Input, real SAMPLE_NODE_XYZ(2,SAMPLE_NODE_NUM), the sample nodes.
%
%    Output, real SAMPLE_VALUE(FEM_VALUE_DIM,SAMPLE_NODE_NUM),
%    the sampled values.
%
  sample_value = zeros(fem_value_dim,sample_node_num);
%
%  For each sample point: find the triangle T that contains it,
%  and evaluate the finite element function there.
%
  for j = 1 : sample_node_num

    p_xyz(1:3,1) = sample_node_xyz(1:3,j);
%
%  Find the element T that contains the point.
%
    t = tet_mesh_search_delaunay ( ...
      fem_node_xyz, fem_element_num, fem_element_node, ...
      fem_element_neighbor, p_xyz );

    if ( t == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PROJECTION - Fatal error!\n' );
      fprintf ( 1, '  Search failed!\n' );
      error ( 'PROJECTION - Fatal error!' );
    end
%
%  Evaluate the finite element basis functions at the point in T.
%
    t_node(1:fem_element_order) = fem_element_node(1:fem_element_order,t);

    t_xyz(1:3,1:fem_element_order) = fem_node_xyz(1:3,t_node);

    b = basis_mn_tet4 ( t_xyz, 1, p_xyz );
%
%  Multiply by the finite element values to get the sample values.
%
    for i = 1 : fem_value_dim
      sample_value(i,j) = fem_value(i,t_node(1:fem_element_order)) ...
        * b(1:fem_element_order);
    end

  end

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%
  table = zeros ( m, n );
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function det = r8mat_det_4d ( a )

%*****************************************************************************80
%
%% R8MAT_DET_4D computes the determinant of a 4 by 4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(4,4), the matrix whose determinant is desired.
%
%    Output, real DET, the determinant of the matrix.
%
  det = ...
      a(1,1) * ( ...
        a(2,2) * ( a(3,3) * a(4,4) - a(3,4) * a(4,3) ) ...
      - a(2,3) * ( a(3,2) * a(4,4) - a(3,4) * a(4,2) ) ...
      + a(2,4) * ( a(3,2) * a(4,3) - a(3,3) * a(4,2) ) ) ...
    - a(1,2) * ( ...
        a(2,1) * ( a(3,3) * a(4,4) - a(3,4) * a(4,3) ) ...
      - a(2,3) * ( a(3,1) * a(4,4) - a(3,4) * a(4,1) ) ...
      + a(2,4) * ( a(3,1) * a(4,3) - a(3,3) * a(4,1) ) ) ...
    + a(1,3) * ( ...
        a(2,1) * ( a(3,2) * a(4,4) - a(3,4) * a(4,2) ) ...
      - a(2,2) * ( a(3,1) * a(4,4) - a(3,4) * a(4,1) ) ...
      + a(2,4) * ( a(3,1) * a(4,2) - a(3,2) * a(4,1) ) ) ...
    - a(1,4) * ( ...
        a(2,1) * ( a(3,2) * a(4,3) - a(3,3) * a(4,2) ) ...
      - a(2,2) * ( a(3,1) * a(4,3) - a(3,3) * a(4,1) ) ...
      + a(2,3) * ( a(3,1) * a(4,2) - a(3,2) * a(4,1) ) );

  return
end
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

  end

  return
end
function [ indx, i, j ] = sort_heap_external ( n, indx, isgn )

%*****************************************************************************80
%
%% SORT_HEAP_EXTERNAL externally sorts a list of items into ascending order.
%
%  Discussion:
%
%    The actual list of data is not passed to the routine.  Hence this
%    routine may be used to sort integers, reals, numbers, names,
%    dates, shoe sizes, and so on.  After each call, the routine asks
%    the user to compare or interchange two items, until a special
%    return value signals that the sorting is completed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf.
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of items to be sorted.
%
%    Input, integer INDX, the main communication signal.
%    The user must set INDX to 0 before the first call.
%    Thereafter, the user should set the input value of INDX
%    to the output value from the previous call.
%
%    Input, integer ISGN, results of comparison of elements I and J.
%    (Used only when the previous call returned INDX less than 0).
%    ISGN <= 0 means I is less than or equal to J;
%    0 <= ISGN means I is greater than or equal to J.
%
%    Output, integer INDX, the main communication signal.
%    If INDX is
%
%      greater than 0, the user should:
%      * interchange items I and J;
%      * call again.
%
%      less than 0, the user should:
%      * compare items I and J;
%      * set ISGN = -1 if I < J, ISGN = +1 if J < I;
%      * call again.
%
%      equal to 0, the sorting is done.
%
%    Output, integer I, J, the indices of two items.
%    On return with INDX positive, elements I and J should be interchanged.
%    On return with INDX negative, elements I and J should be compared, and
%    the result reported in ISGN on the next call.
%
  persistent i_save;
  persistent j_save;
  persistent k;
  persistent k1;
  persistent n1;
  
  if ( isempty ( i_save ) )
    i_save = -1;
  end
  if ( isempty ( j_save ) )
    j_save = -1;
  end
%
%  INDX = 0: This is the first call.
%
  if ( indx == 0 )
      
    k = floor ( n / 2 );
    k1 = k;
    n1 = n;
%
%  INDX < 0: The user is returning the results of a comparison.
%
  elseif ( indx < 0 )

    if ( indx == -2 )

      if ( isgn < 0 )
        i_save = i_save + 1;
      end

      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    end

    if ( 0 < isgn )
      indx = 2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )

      if ( n1 == 1 )
        i_save = 0;
        j_save = 0;
        indx = 0;
      else
        i_save = n1;
        n1 = n1 - 1;
        j_save = 1;
        indx = 1;
      end

      i = i_save;
      j = j_save;
      return;

    end

    k = k - 1;
    k1 = k;
%
%  0 < INDX, the user was asked to make an interchange.
%
  elseif ( indx == 1 )

    k1 = k;

  end

  while ( 1 )

    i_save = 2 * k1;

    if ( i_save == n1 )
      j_save = k1;
      k1 = i_save;
      indx = -1;
      i = i_save;
      j = j_save;
      return;
    elseif ( i_save <= n1 )
      j_save = i_save + 1;
      indx = -2;
      i = i_save;
      j = j_save;
      return;
    end

    if ( k <= 1 )
      break;
    end

    k = k - 1;
    k1 = k;

  end

  if ( n1 == 1 )
    i_save = 0;
    j_save = 0;
    indx = 0;
    i = i_save;
    j = j_save;
  else
    i_save = n1;
    n1 = n1 - 1;
    j_save = 1;
    indx = 1;
    i = i_save;
    j = j_save;
  end

  return
end
function tetra_neighbor = tet_mesh_neighbor_tets ( tetra_order, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
% TET_MESH_NEIGHBOR_TETS determines tetrahedron neighbors.
%
%  Discussion:
%
%    A tet mesh of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each tetrahedron.  In the most common case, four nodes are used.
%    There is also a 10 node case, where nodes are also placed on
%    the midsides of the tetrahedral edges.
%
%    This routine can handle 4 or 10-node tetrahedral meshes.  The
%    10-node case is handled simply by ignoring the six midside nodes,
%    which are presumed to be listed after the vertices.
%
%    The tetrahedron adjacency information records which tetrahedron
%    is adjacent to a given tetrahedron on a particular face.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 4 * TETRA_NUM
%    data items.
%
%    The neighbor tetrahedrons are indexed by the face they share with
%    the tetrahedron.
%
%    Each face of the tetrahedron is indexed by the node which is NOT
%    part of the face.  That is:
%
%    * Neighbor 1 shares face 1 defined by nodes 2, 3, 4.
%    * Neighbor 2 shares face 2 defined by nodes 1, 3, 4;
%    * Neighbor 3 shares face 3 defined by nodes 1, 2, 4;
%    * Neighbor 4 shares face 4 defined by nodes 1, 2, 3.
%
%    For instance, if the (transposed) TETRA_NODE array was:
%
%    Row       1      2      3      4
%    Col
%
%      1       4      3      5      1
%      2       4      2      5      1
%      3       4      7      3      5
%      4       4      7      8      5
%      5       4      6      2      5
%      6       4      6      8      5
%
%    then the (transposed) TETRA_NEIGHBOR array should be:
%
%    Row       1      2      3      4
%    Col
%
%      1      -1      2     -1      3
%      2      -1      1     -1      5
%      3      -1      1      4     -1
%      4      -1      6      3     -1
%      5      -1      2      6     -1
%      6      -1      4      5     -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the nodes that make up
%    each tetrahedron.
%
%    Output, integer TETRA_NEIGHBOR(4,TETRA_NUM), the four tetrahedrons that
%    are direct neighbors of a given tetrahedron.  If there is no neighbor
%    sharing a given face, the index is set to -1.
%

%
%  Step 1.
%  From the list of nodes for tetrahedron T, of the form: (I,J,K,L)
%  construct the four face relations:
%
%    (J,K,L,1,T)
%    (I,K,L,2,T)
%    (I,J,L,3,T)
%    (I,J,K,4,T)
%
%  In order to make matching easier, we reorder each triple of nodes
%  into ascending order.
%
  faces = zeros ( 5, tetra_order * tetra_num );
  
  for tetra = 1 : tetra_num

    i = tetra_node(1,tetra);
    j = tetra_node(2,tetra);
    k = tetra_node(3,tetra);
    l = tetra_node(4,tetra);

    [ a, b, c ] = i4i4i4_sort_a ( j, k, l );

    faces(1:5,4*(tetra-1)+1) = [ a, b, c, 1, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, k, l );

    faces(1:5,4*(tetra-1)+2) = [ a, b, c, 2, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, l );

    faces(1:5,4*(tetra-1)+3) = [ a, b, c, 3, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, k );

    faces(1:5,4*(tetra-1)+4) = [ a, b, c, 4, tetra ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:3; the routine we call here
%  sorts on rows 1 through 5 but that won't hurt us.
%
%  What we need is to find cases where two tetrahedrons share a face.
%  By sorting the columns of the FACES array, we will put shared faces
%  next to each other.
%
  faces = i4col_sort_a ( 5, 4*tetra_num, faces );
%
%  Step 3. Neighboring tetrahedrons show up as consecutive columns with
%  identical first three entries.  Whenever you spot this happening,
%  make the appropriate entries in TETRA_NEIGHBOR.
%
  tetra_neighbor(1:4,1:tetra_num) = -1;

  face = 1;

  while ( 1 )

    if ( 4 * tetra_num <= face )
      break
    end

    if ( faces(1:3,face) == faces(1:3,face+1) )
      face1 = faces(4,face);
      tetra1 = faces(5,face);
      face2 = faces(4,face+1);
      tetra2 = faces(5,face+1);
      tetra_neighbor(face1,tetra1) = tetra2;
      tetra_neighbor(face2,tetra2) = tetra1;
      face = face + 2;
    else
      face = face + 1;
    end

  end

  return
end
function [ tet_index, face, step_num ] = tet_mesh_search_delaunay ( ...
  node_xyz, tet_num, tet_node, tet_neighbor, p )

%*****************************************************************************80
%
%% TET_MESH_SEARCH_DELAUNAY searches a Delaunay tet mesh for a point.
%
%  Discussion:
%
%    The algorithm "walks" from one tetrahedron to its neighboring tetrahedron,
%    and so on, until a tetrahedron is found containing point P, or P is found
%    to be outside the convex hull.
%
%    The algorithm computes the barycentric coordinates of the point with
%    respect to the current tetrahedron.  If all 4 quantities are positive,
%    the point is contained in the tetrahedron.  If the I-th coordinate is
%    negative, then P lies on the far side of edge I, which is opposite
%    from vertex I.  This gives a hint as to where to search next.
%
%    For a Delaunay tet mesh, the search is guaranteed to terminate.
%    For other meshes, a cycle may occur.
%
%    Note the surprising fact that, even for a Delaunay tet mesh of
%    a set of nodes, the nearest node to P need not be one of the
%    vertices of the tetrahedron containing P.
%
%    The code can be called for tet meshes of any order, but only
%    the first 4 nodes in each tetrahedron are considered.  Thus, if
%    higher order tetrahedrons are used, and the extra nodes are intended
%    to give the tetrahedron a polygonal shape, these will have no effect,
%    and the results obtained here might be misleading.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2009
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of
%    the nodes.
%
%    Input, integer TET_ORDER, the order of the tetrahedrons.
%
%    Input, intege TET_NUM, the number of tetrahedrons.
%
%    Input, integer TET_NODE(TET_ORDER,TET_NUM),
%    the nodes that make up each tetrahedron.
%
%    Input, integer TET_NEIGHBOR(4,TET_NUM), the
%    tetrahedron neighbor list.
%
%    Input, real P(3), the coordinates of a point.
%
%    Output, integer TET_INDEX, the index of the tetrahedron
%    where the search ended.  If a cycle occurred, then TET_INDEX = -1.
%
%    Output, integer FACE, indicates the position of the point P in
%    face TET_INDEX:
%    0, the interior or boundary of the tetrahedron;
%    -1, outside the convex hull of the tet mesh, past face 1;
%    -2, outside the convex hull of the tet mesh, past face 2;
%    -3, outside the convex hull of the tet mesh, past face 3.
%    -4, outside the convex hull of the tet mesh, past face 4.
%
%    Output, integer STEP_NUM, the number of steps taken.
%
  persistent tet_index_save;

  if ( isempty ( tet_index_save ) )
    tet_index_save = -1;
  end
%
%  If possible, start with the previous successful value of TET_INDEX.
%
  if ( tet_index_save < 1 || tet_num < tet_index_save )
    tet_index = floor ( ( tet_num + 1 ) / 2 );
  else
    tet_index = tet_index_save;
  end

  step_num = -1;
  face = 0;

  while ( 1 )

    step_num = step_num + 1;

    if ( tet_num < step_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TET_MESH_SEARCH_DELAUNAY - Fatal error!\n' );
      fprintf ( 1, '  The algorithm seems to be cycling.\n' );
      error ( 'TET_MESH_SEARCH_DELAUNAY - Fatal error!' );
    end

    alpha = tetrahedron_barycentric ( node_xyz(1:3,tet_node(1:4,tet_index)), p );
%
%  If the barycentric coordinates are all positive, then the point
%  is inside the tetrahedron and we're done.
%
    if ( 0.0 <= alpha(1) && 0.0 <= alpha(2) && 0.0 <= alpha(3) && 0.0 <= alpha(4) )
      break
    end
%
%  At least one barycentric coordinate is negative.
%
%  If there is a negative barycentric coordinate for which there exists an
%  opposing tetrahedron neighbor closer to the point, move to that tetrahedron.
%
    if ( alpha(1) < 0.0 && 0 < tet_neighbor(1,tet_index) )
      tet_index = tet_neighbor(1,tet_index);
      continue
    elseif ( alpha(2) < 0.0 && 0 < tet_neighbor(2,tet_index) )
      tet_index = tet_neighbor(2,tet_index);
      continue
    elseif ( alpha(3) < 0.0 && 0 < tet_neighbor(3,tet_index) )
      tet_index = tet_neighbor(3,tet_index);
      continue
    elseif ( alpha(4) < 0.0 && 0 < tet_neighbor(4,tet_index) )
      tet_index = tet_neighbor(4,tet_index);
      continue
    end
%
%  All negative barycentric coordinates correspond to vertices opposite
%  faces on the convex hull.
%
%  Note the face and exit.
%
    if ( alpha(1) < 0.0 )
      face = -1;
      break
    elseif ( alpha(2) < 0.0 )
      face = -2;
      break
    elseif ( alpha(3) < 0.0 )
      face = -3;
      break
    elseif ( alpha(4) < 0.0 )
      face = -4;
      break
    end

  end

  tet_index_save = tet_index;

  return
end
function c = tetrahedron_barycentric ( tetra, p )

%*****************************************************************************80
%
%% TETRAHEDRON_BARYCENTRIC returns the barycentric coordinates of a point.
%
%  Discussion:
%
%    The barycentric coordinates of a point (X,Y,Z) with respect to
%    a tetrahedron are a set of four values C(1:4), each associated
%    with a vertex of the tetrahedron.  The values must sum to 1.
%    If all the values are between 0 and 1, the point is contained
%    within the tetrahedron.
%
%    The barycentric coordinate of point X related to vertex A can be
%    interpreted as the ratio of the volume of the tetrahedron with 
%    vertex A replaced by vertex X to the volume of the original 
%    tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Input, real P(3), the point to be checked.
%
%    Output, real C(4), the barycentric coordinates of (X,Y,Z) with
%    respect to the tetrahedron.
%

%
%  Set up the linear system
%
%    ( X2-X1  X3-X1  X4-X1 ) C1    X - X1
%    ( Y2-Y1  Y3-Y1  Y4-Y1 ) C2  = Y - Y1
%    ( Z2-Z1  Z3-Z1  Z4-Z1 ) C3    Z - Z1
%
%  which is satisfied by the barycentric coordinates of (X,Y,Z).
%
  a(1:dim_num,1:3) = tetra(1:dim_num,2:4);
  b(1:dim_num,1) = p(1:dim_num,1) - tetra(1:dim_num,1);

  for i = 1 : dim_num
    a(i,1:3) = a(i,1:3) - tetra(i,1);
  end
%
%  Solve the linear system.
%
  b = a \ b;

  c(2:4) = b(1:3);

  c(1) = 1.0 - sum ( c(2:4) );

  return
end
function [ w, xyz ] = tetrahedron_unit_quad04 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_QUAD04: 4 point quadrature rule for the unit tetrahedron.
%
%  Discussion:
%
%    The integration region is:
%
%      0 <= X
%      0 <= Y
%      0 <= Z
%      X + Y + Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carlos Felippa,
%    A compendium of FEM integration formulas for symbolic work,
%    Engineering Computation,
%    Volume 21, Number 8, 2004, pages 867-890.
%
%  Parameters:
%
%    Output, real W(4), the weights.
%
%    Output, real XYZ(4,4), the barycentric coordinates of the abscissas.
%
  w(1:4) = [ ...
    0.25000000000000000000, ...
    0.25000000000000000000, ...
    0.25000000000000000000, ...
    0.25000000000000000000 ];

  xyz(1:4,1:4) = [ ...
    0.58541019662496845446,  0.13819660112501051518, ...
    0.13819660112501051518,  0.13819660112501051518; ...
    0.13819660112501051518,  0.58541019662496845446, ...
    0.13819660112501051518,  0.13819660112501051518; ...
    0.13819660112501051518,  0.13819660112501051518, ...
    0.58541019662496845446,  0.13819660112501051518; ...
    0.13819660112501051518,  0.13819660112501051518, ...
    0.13819660112501051518,  0.58541019662496845446 ]';

  return
end
function volume = tetrahedron_volume ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_VOLUME computes the volume of a tetrahedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real VOLUME, the volume of the tetrahedron.
%
  dim_num = 3;

  a(1:dim_num,1:4) = tetra(1:dim_num,1:4);
  a(4,1:4) = 1.0;

  volume = abs ( r8mat_det_4d ( a ) ) / 6.0;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
