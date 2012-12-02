function fem2d_sample ( fem_prefix, sample_prefix )

%*****************************************************************************80
%
%% MAIN is the main program for FEM2D_SAMPLE.
%
%  Discussion:
%
%    FEM2D_SAMPLE reads files defining a 2D FEM representation of data,
%    and a set of sample points, and writes out a file containing the 
%    value of the finite element function at the sample points.
%
%  Usage:
%
%    fem2d_sample ( 'fem_prefix', 'sample_prefix' )
%
%    where 'fem_prefix' is the common prefix for the FEM files:
%
%    * fem_prefix_nodes.txt,    the node coordinates.
%    * fem_prefix_elements.txt, the nodes that make up each element;
%    * fem_prefix_values.txt,   the values defined at each node.
%
%    and 'sample_prefix' is the common prefix for the SAMPLE files.
%    (the node file is input, and the values file is created by the program.)
%
%    * sample_prefix_nodes.txt,  the node coordinates where samples are desired.
%    * sample_prefix_values.txt, the values computed at each sample node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_SAMPLE\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read files defining an FEM function of 2 arguments.\n' );
  fprintf ( 1, '  Read a file of sample arguments.\n' );
  fprintf ( 1, '  Write a file of function values at the arguments.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fem_prefix = input ( 'Enter the FEM file prefix:' );

  end

  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    sample_prefix = input ( 'Enter the sample file prefix:' );

  end
%
%  Create the filenames.
%
  fem_node_filename = strcat ( fem_prefix, '_nodes.txt' );
  fem_element_filename = strcat ( fem_prefix, '_elements.txt' );
  fem_value_filename = strcat ( fem_prefix, '_values.txt' );

  sample_node_filename = strcat ( sample_prefix, '_nodes.txt' );
  sample_value_filename = strcat ( sample_prefix, '_values.txt' );
%
%  Read the FEM data.
%
  [ fem_node_dim, fem_node_num ] = r8mat_header_read ( fem_node_filename );

  fem_node_xy = r8mat_data_read ( fem_node_filename, fem_node_dim, fem_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The FEM node dimension is        %d\n', fem_node_dim );
  fprintf ( 1, '  The FEM node number is           %d\n', fem_node_num );

  if ( fem_node_dim ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension of the nodes is not 2.\n' );
    return
  end

  [ fem_element_order, fem_element_num ] = i4mat_header_read ( fem_element_filename );

  fem_element_node = i4mat_data_read ( fem_element_filename, fem_element_order, ...
    fem_element_num );

  fprintf ( 1, '  The FEM element order is         %d\n', fem_element_order );
  fprintf ( 1, '  The FEM element number is        %d\n', fem_element_num );

  [ fem_value_dim, fem_value_num ] = r8mat_header_read ( fem_value_filename );

  fprintf ( 1, '  The FEM value order is           %d\n', fem_value_dim );
  fprintf ( 1, '  the FEM value number is          %d\n', fem_value_num );

  if ( fem_value_num ~= fem_node_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Number of FEM values and nodes differ.\n' );
    return
  end

  fem_value = r8mat_data_read ( fem_value_filename, fem_value_dim, fem_value_num );
%
%  Create the element neighbor array.
%
  if ( fem_element_order == 3 )

    fem_element_neighbor = triangulation_order3_neighbor_triangles ( ...
      fem_element_num, fem_element_node );

  elseif ( fem_element_order == 6 )

    fem_element_neighbor = triangulation_order6_neighbor_triangles ( ...
      fem_element_num, fem_element_node );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  The element order must be 3 or 6.\n' );
    fprintf ( 1, '  But this data has element order = %d\n', fem_element_order );
    return

  end

  fprintf ( 1, '  The element neighbor array has been computed.\n' );
%
%  Read the SAMPLE node data.
%
  [ sample_node_dim, sample_node_num ] = r8mat_header_read ( ...
    sample_node_filename );

  sample_node_xy = r8mat_data_read ( sample_node_filename, sample_node_dim, ...
    sample_node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample node spatial dimension is %d\n', sample_node_dim );
  fprintf ( 1, '  Sample node number is            %d\n', sample_node_num );

  if ( sample_node_dim ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Spatial dimension of the sample nodes is not 2.\n' );
    return
  end
%
%  Compute the SAMPLE values.
%
  sample_value_dim = fem_value_dim;
  sample_value_num = sample_node_num;

  sample_value = fem2d_evaluate ( fem_node_num, fem_node_xy, ...
    fem_element_order, fem_element_num, fem_element_node, ...
    fem_element_neighbor, fem_value_dim, fem_value, ...
    sample_node_num, sample_node_xy );
%
%  Write the sample values.
%
  r8mat_write ( sample_value_filename, sample_value_dim, ...
    sample_value_num, sample_value );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolated FEM data written to "%s".\n', sample_value_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_SAMPLE\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ phi, dphidx, dphidy ] = basis_mn_t3 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_T3: all bases functions at N points for a T3 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices of a triangle.
%    It works directly with these coordinates, and does not refer to a 
%    reference element.
%
%    The sides of the triangle DO NOT have to lie along a coordinate
%    axis.
%
%    The routine evaluates the basis functions associated with each vertex,
%    and their derivatives with respect to X and Y.
%
%  Physical Element T3:
%
%            3
%           / \
%          /   \
%         /     \
%        /       \
%       1---------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the vertices of the triangle.  It is common to list 
%    these points in counter clockwise order.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the coordinates of the evaluation points.
%
%    Output, real PHI(3,N), the basis functions at the evaluation points.
%
%    Output, real DPHIDX(3,N), DPHIDY(3,N), the basis derivatives 
%    at the evaluation points.
%
%  Local parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%
  area = t(1,1) * ( t(2,2) - t(2,3) ) ...
       + t(1,2) * ( t(2,3) - t(2,1) ) ...
       + t(1,3) * ( t(2,1) - t(2,2) );

  phi(1,1:n) =     (  ( t(1,3) - t(1,2) ) * ( p(2,1:n) - t(2,2) )     ...
                    - ( t(2,3) - t(2,2) ) * ( p(1,1:n) - t(1,2) ) );
  dphidx(1,1:n) =   - ( t(2,3) - t(2,2) );
  dphidy(1,1:n) =     ( t(1,3) - t(1,2) );

  phi(2,1:n) =     (  ( t(1,1) - t(1,3) ) * ( p(2,1:n) - t(2,3) )     ...
                    - ( t(2,1) - t(2,3) ) * ( p(1,1:n) - t(1,3) ) );
  dphidx(2,1:n) =   - ( t(2,1) - t(2,3) );
  dphidy(2,1:n) =     ( t(1,1) - t(1,3) );

  phi(3,1:n) =     (  ( t(1,2) - t(1,1) ) * ( p(2,1:n) - t(2,1) )     ...
                    - ( t(2,2) - t(2,1) ) * ( p(1,1:n) - t(1,1) ) );
  dphidx(3,1:n) =   - ( t(2,2) - t(2,1) );
  dphidy(3,1:n) =     ( t(1,2) - t(1,1) );
%
%  Normalize.
%
  phi(1:3,1:n)    = phi(1:3,1:n) / area;
  dphidx(1:3,1:n) = dphidx(1:3,1:n) / area;
  dphidy(1:3,1:n) = dphidy(1:3,1:n) / area;

  return
end
function [ phi, dphidx, dphidy ] = basis_mn_t6 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_T6: all bases for N points in a T6 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices and midside
%    nodes of a triangle.  It works directly with these coordinates, and does 
%    not refer to a reference element.
%
%    This routine requires that the midside nodes be "in line"
%    with the vertices, that is, that the sides of the triangle be
%    straight.  However, the midside nodes do not actually have to
%    be halfway along the side of the triangle.  
%
%  Physical element T6:
%
%    This picture indicates the assumed ordering of the six nodes
%    of the triangle.
%
%             3
%            / \
%           /   \
%          6     5
%         /       \
%        /         \
%       1-----4-----2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the nodal oordinates of the element.
%    It is common to list these points in counter clockwise order.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real PHI(6,N), the basis functions at the evaluation points.
%
%    Output, real DPHIDX(6,N), DPHIDY(6,N), the basis derivatives at the 
%    evaluation points.
%
%  Local Parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%

%
%  Basis function 1: PHI(X,Y) = G(3,2) * H(6,4) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,3)   - t(2,2) ) ...
          - ( t(1,3)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,1) - t(1,2) ) * ( t(2,3) - t(2,2) ) ...
          - ( t(1,3) - t(1,2) ) * ( t(2,1) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,4) ) * ( t(2,6)   - t(2,4) ) ...
          - ( t(1,6)   - t(1,4) ) * ( p(2,1:n) - t(2,4) );

  hn(1:n) = ( t(1,1) - t(1,4) ) * ( t(2,6) - t(2,4) ) ...
          - ( t(1,6) - t(1,4) ) * ( t(2,1) - t(2,4) );

  phi(1,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(1,1:n) =  ( ( t(2,3) - t(2,2) ) * hx(1:n) ...
                    + gx(1:n) * ( t(2,6) - t(2,4) ) ) ...
                  ./ ( gn(1:n) .* hn(1:n) );

  dphidy(1,1:n) = -( ( t(1,3) - t(1,2) ) * hx(1:n) ...
                   + gx * ( t(1,6) - t(1,4) ) ) ...
                  ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 2: PHI(X,Y) = G(3,1) * H(4,5) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,3)   - t(2,1) ) ...
          - ( t(1,3)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );

  gn(1:n) = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
          - ( t(1,3) - t(1,1) ) * ( t(2,2) - t(2,1) );

  hx(1:n) = ( p(1,1:n) - t(1,5) ) * ( t(2,4)   - t(2,5) ) ...
          - ( t(1,4)   - t(1,5) ) * ( p(2,1:n) - t(2,5) );

  hn(1:n) = ( t(1,2) - t(1,5) ) * ( t(2,4) - t(2,5) ) ...
          - ( t(1,4) - t(1,5) ) * ( t(2,2) - t(2,5) );

  phi(2,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(2,1:n) =  ( ( t(2,3) - t(2,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,4) - t(2,5) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(2,1:n) = -( ( t(1,3) - t(1,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,4) - t(1,5) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 3: PHI(X,Y) = G(1,2) * H(5,6) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,1)   - t(2,2) ) ...
          - ( t(1,1)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,3) - t(1,2) ) * ( t(2,1) - t(2,2) ) ...
          - ( t(1,1) - t(1,2) ) * ( t(2,3) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,6) ) * ( t(2,5)   - t(2,6) ) ...
          - ( t(1,5)   - t(1,6) ) * ( p(2,1:n) - t(2,6) );

  hn(1:n) = ( t(1,3) - t(1,6) ) * ( t(2,5) - t(2,6) ) ...
          - ( t(1,5) - t(1,6) ) * ( t(2,3) - t(2,6) );

  phi(3,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(3,1:n) =  ( ( t(2,1) - t(2,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,5) - t(2,6) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(3,1:n) = -( ( t(1,1) - t(1,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,5) - t(1,6) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 4: PHI(X,Y) = G(1,3) * H(2,3) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,3) ) * ( t(2,1)   - t(2,3) ) ...
          - ( t(1,1)   - t(1,3) ) * ( p(2,1:n) - t(2,3) );

  gn(1:n) = ( t(1,4) - t(1,3) ) * ( t(2,1) - t(2,3) ) ...
          - ( t(1,1) - t(1,3) ) * ( t(2,4) - t(2,3) );

  hx(1:n) = ( p(1,1:n) - t(1,3) ) * ( t(2,2)   - t(2,3) ) ...
          - ( t(1,2)   - t(1,3) ) * ( p(2,1:n) - t(2,3) );

  hn(1:n) = ( t(1,4) - t(1,3) ) * ( t(2,2) - t(2,3) ) ...
          - ( t(1,2) - t(1,3) ) * ( t(2,4) - t(2,3) );

  phi(4,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(4,1:n) =  ( ( t(2,1) - t(2,3) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,2) - t(2,3) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(4,1:n) = -( ( t(1,1) - t(1,3) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,2) - t(1,3) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 5: PHI(X,Y) = G(2,1) * H(3,1) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,2)   - t(2,1) ) ...
          - ( t(1,2)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );

  gn(1:n) = ( t(1,5) - t(1,1) ) * ( t(2,2) - t(2,1) ) ...
          - ( t(1,2) - t(1,1) ) * ( t(2,5) - t(2,1) );

  hx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,3)   - t(2,1) ) ...
          - ( t(1,3)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );

  hn(1:n) = ( t(1,5) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
          - ( t(1,3) - t(1,1) ) * ( t(2,5) - t(2,1) );

  phi(5,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(5,1:n) =  ( ( t(2,2) - t(2,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,3) - t(2,1) ) ) ...
               ./ ( gn(1:n) .* hn(1:n) );

  dphidy(5,1:n) = -( ( t(1,2) - t(1,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,3) - t(1,1) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 6: PHI(X,Y) = G(1,2) * H(3,2) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,1)   - t(2,2) ) ...
          - ( t(1,1)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,6) - t(1,2) ) * ( t(2,1) - t(2,2) ) ...
          - ( t(1,1) - t(1,2) ) * ( t(2,6) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,3)   - t(2,2) ) ...
          - ( t(1,3)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  hn(1:n) = ( t(1,6) - t(1,2) ) * ( t(2,3) - t(2,2) ) ...
          - ( t(1,3) - t(1,2) ) * ( t(2,6) - t(2,2) );

  phi(6,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(6,1:n) =  ( ( t(2,1) - t(2,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,3) - t(2,2) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(6,1:n) = -( ( t(1,1) - t(1,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,3) - t(1,2) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  return
end
function sample_value = fem2d_evaluate ( fem_node_num, fem_node_xy, ...
  fem_element_order, fem_element_num, fem_element_node, ...
  fem_element_neighbor, fem_value_dim, fem_value, sample_node_num, ...
  sample_node_xy, sample_value )

%*****************************************************************************80
%
%% FEM2D_EVALUATE samples an FEM function on a T3 or T6 triangulation.
%
%  Discussion:
%
%    Note that the sample values returned are true values of the underlying
%    finite element function.  They are NOT produced by constructing some
%    other function that interpolates the data at the finite element nodes
%    (something which MATLAB's griddata function can easily do.)  Instead, 
%    each sampling node is located within one of the associated finite
%    element triangles, and the finite element function is developed and 
%    evaluated there.  
%
%    MATLAB's scattered data interpolation is wonderful, but it cannot
%    be guaranteed to reproduce the finite element function corresponding
%    to nodal data.  This routine can (or at least tries to%).
% 
%    So if you are using finite elements, then using THIS routine
%    (but not MATLAB's griddata function), what you see is what you have%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FEM_NODE_NUM, the number of nodes.
%
%    Input, real FEM_NODE_XY(2,FEM_NODE_NUM), the coordinates 
%    of the nodes.
%
%    Input, integer FEM_ELEMENT_ORDER, the order of the elements, 
%    either 3 or 6.
%
%    Input, integer FEM_ELEMENT_NUM, the number of triangles.
%
%    Input, integer FEM_ELEMENT_NODE(FEM_ELEMENT_ORDER,FEM_ELEMENT_NUM), the
%    nodes that make up each triangle.
%
%    Input, integer FEM_ELEMENT_NEIGHBOR(3,FEM_ELEMENT_NUM), the 
%    index of the neighboring triangle on each side, or -1 if no neighbor there.
%
%    Input, integer FEM_VALUE_DIM, the "dimension" of the values.
%
%    Input, real FEM_VALUE(FEM_VALUE_DIM,FEM_NODE_NUM), the 
%    finite element coefficient values at each node.
%
%    Input, integer SAMPLE_NODE_NUM, the number of sample nodes.
%
%    Input, real SAMPLE_NODE_XY(2,SAMPLE_NODE_NUM), the sample nodes.
%
%    Output, real SAMPLE_VALUE(FEM_VALUE_DIM,SAMPLE_NODE_NUM),
%    the sampled values.
%

%
%  For each sample point: find the triangle T that contains it,
%  and evaluate the finite element function there.
%
  for j = 1 : sample_node_num

    p_xy(1:2,1) = sample_node_xy(1:2,j);
%
%  Find the triangle T that contains the point.
%
    t = triangulation_search_delaunay ( fem_node_num, fem_node_xy, ...
      fem_element_order, fem_element_num, fem_element_node, ...
      fem_element_neighbor, p_xy );
%
%  Evaluate the finite element basis functions at the point in T.
%
    t_node(1:fem_element_order) = fem_element_node(1:fem_element_order,t);

    t_xy(1:2,1:fem_element_order) = fem_node_xy(1:2,t_node);

    if ( fem_element_order == 3 )
      b = basis_mn_t3 ( t_xy, 1, p_xy );
    elseif ( fem_element_order == 6 )
      b = basis_mn_t6 ( t_xy, 1, p_xy );
    end
%
%  Multiply by the finite element values to get the sample values.
%
    for i = 1 : fem_value_dim
      dot = 0.0;
      for k = 1 : fem_element_order
        dot = dot + fem_value(i,t_node(k)) * b(k);
      end
      sample_value(i,j) = dot;
    end

  end

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
function seed = get_seed ( )

%*****************************************************************************80
%
%% GET_SEED returns a random seed for the random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer SEED, a random seed value.
%
  I_MAX = 2147483647;

  time_array = clock;

  hour = time_array(4);
  minute = time_array(5);
  second = time_array(6);

  seed = second + 60 * ( minute + 60 * hour );
%
%  We want values in [1,43200], not [0,43199].
%
  seed = seed + 1;
%
%  Remap SEED from [1,43200] to [1,I_MAX].
%
  seed = I_MAX * ( seed  / ( 60.0 * 60.0 * 24.0 ) );

  seed = floor ( seed );
%
%  Never use a seed of 0.
%
  if ( seed == 0 )
    seed = 1;
  end

  return
end
function [ c, seed ] = i4_uniform ( a, b, seed )

%*****************************************************************************80
%
%% I4_UNIFORM returns a scaled pseudorandom I4.
%
%  Discussion:
%
%    The pseudorandom number will be scaled to be uniformly distributed
%    between A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer A, B, the minimum and maximum acceptable values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C, the randomly chosen integer.
%
%    Output, integer SEED, the updated seed.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4_UNIFORM - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

  seed = mod ( seed, i4_huge );

  if ( seed < 0 ) 
    seed = seed + i4_huge;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + i4_huge;
  end

  r = seed * 4.656612875E-10;
%
%  Scale R to lie between A-0.5 and B+0.5.
%
  r = ( 1.0 - r ) * ( min ( a, b ) - 0.5 ) ...
    +         r   * ( max ( a, b ) + 0.5 );
%
%  Use rounding to convert R to an integer between A and B.
%
  value = round ( r );

  value = max ( value, min ( a, b ) );
  value = min ( value, max ( a, b ) );

  c = value;

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
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
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
%  Discussion:
%
%    An I4MAT is an array of I4's.
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
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
function triangle_neighbor = triangulation_order3_neighbor_triangles ( ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_NEIGHBOR_TRIANGLES determines triangle neighbors.
%
%  Discussion:
%
%    A triangulation of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each triangle.  However, in some cases, it is necessary to know
%    triangle adjacency information, that is, which triangle, if any,
%    is adjacent to a given triangle on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items.
%
%    This routine was modified to use columns instead of rows.
%
%  Example:
%
%    The input information from TRIANGLE_NODE:
%
%    Triangle   Nodes
%    --------   ---------------
%     1         3      4      1
%     2         3      1      2
%     3         3      2      8
%     4         2      1      5
%     5         8      2     13
%     6         8     13      9
%     7         3      8      9
%     8        13      2      5
%     9         9     13      7
%    10         7     13      5
%    11         6      7      5
%    12         9      7      6
%    13        10      9      6
%    14         6      5     12
%    15        11      6     12
%    16        10      6     11
%
%    The output information in TRIANGLE_NEIGHBOR:
%
%    Triangle  Neighboring Triangles
%    --------  ---------------------
%
%     1        -1     -1      2
%     2         1      4      3
%     3         2      5      7
%     4         2     -1      8
%     5         3      8      6
%     6         5      9      7
%     7         3      6     -1
%     8         5      4     10
%     9         6     10     12
%    10         9      8     11
%    11        12     10     14
%    12         9     11     13
%    13        -1     12     16
%    14        11     -1     15
%    15        16     14     -1
%    16        13     15     -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up each triangle.
%
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the three triangles that are direct
%    neighbors of a given triangle.  TRIANGLE_NEIGHBOR(1,I) is the index of the triangle
%    which touches side 1, defined by nodes 2 and 3, and so on.  TRIANGLE_NEIGHBOR(1,I)
%    is negative if there is no neighbor on that side.  In this case, that
%    side of the triangle lies on the boundary of the triangulation.
%

%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,1,T) or (J,I,1,T),
%    (J,K,2,T) or (K,J,2,T),
%    (K,I,3,T) or (I,K,3,T)
%
%  where we choose (I,J,1,T) if I < J, or else (J,I,1,T)
%
  col = zeros ( 4, 3 * triangle_num );
  
  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:4,1+3*(tri-1)) = [ i, j, 1, tri ]';
    else
      col(1:4,1+3*(tri-1)) = [ j, i, 1, tri ]';
    end

    if ( j < k )
      col(1:4,2+3*(tri-1)) = [ j, k, 2, tri ]';
    else
      col(1:4,2+3*(tri-1)) = [ k, j, 2, tri ]';
    end

    if ( k < i )
      col(1:4,3+3*(tri-1)) = [ k, i, 3, tri ]';
    else
      col(1:4,3+3*(tri-1)) = [ i, k, 3, tri ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1 and 2; the routine we call here
%  sorts on rows 1 through 4 but that won't hurt us.
%
%  What we need is to find cases where two triangles share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two columns of COL that start out ( I, J, ?, ? ).  By sorting COL,
%  we make sure that these two columns occur consecutively.  That will
%  make it easy to notice that the triangles are neighbors.
%
  col = i4col_sort_a ( 4, 3*triangle_num, col );
%
%  Step 3. Neighboring triangles show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in TRIANGLE_NEIGHBOR.
%
  triangle_neighbor(1:3,1:triangle_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 3 * triangle_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) || col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(3,icol);
    tri1 =  col(4,icol);
    side2 = col(3,icol+1);
    tri2 =  col(4,icol+1);

    triangle_neighbor(side1,tri1) = tri2;
    triangle_neighbor(side2,tri2) = tri1;

    icol = icol + 2;

  end

  return
end
function triangle_neighbor = triangulation_order6_neighbor_triangles ( ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_NEIGHBOR_TRIANGLES determines triangle neighbors.
%
%  Discussion:
%
%    A triangulation of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each triangle.  However, in some cases, it is necessary to know
%    triangle adjacency information, that is, which triangle, if any,
%    is adjacent to a given triangle on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items.
%
%    This routine was modified to use columns instead of rows.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_ORDER(6,TRIANGLE_NUM), the nodes that make up 
%    each triangle.
%
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the three triangles that
%    are direct neighbors of a given triangle.  TRIANGLE_NEIGHBOR(1,I) is 
%    the index of the triangle which touches side 1, defined by nodes 2 and 3,
%    and so on.  TRIANGLE_NEIGHBOR(1,I) is negative if there is no neighbor
%    on that side.  In this case, that side of the triangle lies on the 
%    boundary of the triangulation.
%

%
%  Step 1.
%  From the list of vertices for triangle T, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,1,T) or (J,I,1,T),
%    (J,K,2,T) or (K,J,2,T),
%    (K,I,3,T) or (I,K,3,T)
%
%  where we choose (I,J,1,T) if I < J, or else (J,I,1,T)
%
  col = zeros ( 4, 3 * triangle_num );
  
  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:4,3*(tri-1)+1) = [ i, j, 1, tri ]';
    else
      col(1:4,3*(tri-1)+1) = [ j, i, 1, tri ]';
    end

    if ( j < k )
      col(1:4,3*(tri-1)+2) = [ j, k, 2, tri ]';
    else
      col(1:4,3*(tri-1)+2) = [ k, j, 2, tri ]';
    end

    if ( k < i )
      col(1:4,3*(tri-1)+3) = [ k, i, 3, tri ]';
    else
      col(1:4,3*(tri-1)+3) = [ i, k, 3, tri ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on columns 1 and 2; the routine we call here
%  sorts on columns 1 through 4 but that won't hurt us.
%
%  What we need is to find cases where two triangles share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two columns of COL that start out ( I, J, ?, ? ).  By sorting COL,
%  we make sure that these two columns occur consecutively.  That will
%  make it easy to notice that the triangles are neighbors.
%
  col = i4col_sort_a ( 4, 3*triangle_num, col );
%
%  Step 3. Neighboring triangles show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in TRIANGLE_NEIGHBOR.
%
  triangle_neighbor(1:3,1:triangle_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 3 * triangle_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) || col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(icol,3);
    tri1 = col(icol,4);
    side2 = col(icol+1,3);
    tri2 = col(icol+1,4);

    triangle_neighbor(side1,tri1) = tri2;
    triangle_neighbor(side2,tri2) = tri1;

    icol = icol + 2;

  end

  return
end
function [ triangle_index, edge ] = triangulation_search_delaunay ( node_num, ...
  node_xy, triangle_order, triangle_num, triangle_node, triangle_neighbor, p )

%*****************************************************************************80
%
%% TRIANGULATION_SEARCH_DELAUNAY searches a Delaunay triangulation for a point.
%
%  Purpose:
%
%    The algorithm "walks" from one triangle to its neighboring triangle,
%    and so on, until a triangle is found containing point P, or P is found 
%    to be outside the convex hull. 
%
%    The algorithm computes the barycentric coordinates of the point with 
%    respect to the current triangle.  If all three quantities are positive,
%    the point is contained in the triangle.  If the I-th coordinate is
%    negative, then P lies on the far side of edge I, which is opposite
%    from vertex I.  This gives a hint as to where to search next.
%
%    For a Delaunay triangulation, the search is guaranteed to terminate.
%    For other triangulations, a cycle may occur.
%
%    Note the surprising fact that, even for a Delaunay triangulation of
%    a set of points, the nearest point to P need not be one of the
%    vertices of the triangle containing P.  
%
%    The code can be called for triangulations of any order, but only
%    the first three nodes in each triangle are considered.  Thus, if
%    higher order triangles are used, and the extra nodes are intended
%    to give the triangle a polygonal shape, these will have no effect,
%    and the results obtained here might be misleading.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2006
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
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
%    Input, real NODE_XY(2,NODE_NUM), the vertices.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), 
%    the nodes that make up each triangle.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle 
%    neighbor list.
%
%    Input, real P(2), the coordinates of a point.
%
%    Output, integer TRIANGLE_INDEX, the index of the triangle where the 
%    search ended.  If a cycle occurred, then TRIANGLE_INDEX = -1.
%
%    Output, integer EDGE, indicates the position of the point P in
%    triangle TRIANGLE_INDEX:
%    0, the interior or boundary of the triangle;
%    -1, outside the convex hull of the triangulation, past edge 1;
%    -2, outside the convex hull of the triangulation, past edge 2;
%    -3, outside the convex hull of the triangulation, past edge 3.
%
  count = 0;
  edge = 0;

  seed = get_seed ( );

  triangle = i4_uniform ( 1, triangle_num, seed );

  while ( 1 )

    count = count + 1;

    if ( triangle_num < count )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGULATION_SEARCH_DELAUNAY - Fatal error!\n' );
      fprintf ( 1, '  The algorithm seems to be cycling.\n' );
      triangle_index = -1;
      edge = -1;
      return
    end
%
%  Get the vertices of triangle TRIANGLE.
%
    a = triangle_node(1,triangle);
    b = triangle_node(2,triangle);
    c = triangle_node(3,triangle);
%
%  Using vertex C as a base, compute the distances to vertices A and B,
%  and the point P.
%
    dxa = node_xy(1,a) - node_xy(1,c);
    dya = node_xy(2,a) - node_xy(2,c);

    dxb = node_xy(1,b) - node_xy(1,c);
    dyb = node_xy(2,b) - node_xy(2,c);

    dxp = p(1)         - node_xy(1,c);
    dyp = p(2)         - node_xy(2,c);

    det = dxa * dyb - dya * dxb;
%
%  Compute the barycentric coordinates of the point P with respect
%  to this triangle.
%
    alpha = ( dxp * dyb - dyp * dxb ) / det;
    beta =  ( dxa * dyp - dya * dxp ) / det;
    gamma = 1.0 - alpha - beta;
%
%  If the barycentric coordinates are all positive, then the point
%  is inside the triangle and we're done.
%
    if ( 0.0 <= alpha && 0.0 <= beta && 0.0 <= gamma )
      break
    end
%
%  At least one barycentric coordinate is negative.
%
%  If there is a negative barycentric coordinate for which there exists
%  an opposing triangle neighbor closer to the point, move to that triangle.
%
%  (Two coordinates could be negative, in which case we could go for the
%  most negative one, or the most negative one normalized by the actual
%  distance it represents).
%
    if ( alpha < 0.0 && 0 < triangle_neighbor(2,triangle) )
      triangle = triangle_neighbor(2,triangle);
      continue;
    elseif ( beta < 0.0 && 0 < triangle_neighbor(3,triangle) )
      triangle = triangle_neighbor(3,triangle);
      continue;
    elseif ( gamma < 0.0 && 0 < triangle_neighbor(1,triangle) )
      triangle = triangle_neighbor(1,triangle);
      continue;
    end
%
%  All negative barycentric coordinates correspond to vertices opposite
%  sides on the convex hull.
%
%  Note the edge and exit.
%
    if ( alpha < 0.0 )
      edge = -2;
      break
    elseif ( beta < 0.0 )
      edge = -3;
      break
    elseif ( gamma < 0.0 )
      edge = -1;
      break
    end

  end

  triangle_index = triangle;

  return
end
