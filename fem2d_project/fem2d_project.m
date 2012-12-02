function fem2d_project ( sample_prefix, fem_prefix )

%*****************************************************************************80
%
%% MAIN is the main program for FEM2D_PROJECT.
%
%  Discussion:
%
%    FEM2D_PROJECT reads files defining a sampling of a (scalar or vector)
%    function of 2 arguments, and a list of nodes and triangular elements
%    to use for a finite element representation of the data.
%
%    It computes a set of finite element coefficients to be associated with
%    the given finite element mesh, and writes that information to a file
%    so that an FEM representation is formed by the node, element and value
%    files.
%
%  Usage:
%
%    fem2d_project ( 'sample_prefix', 'fem_prefix' )
%
%    where 'sample_prefix' is the common prefix for the SAMPLE files:
%
%    * sample_prefix_nodes.txt,     the node coordinates where samples were taken;
%    * sample_prefix_elements.txt,  the nodes that make up each element;
%    * sample_prefix_values.txt,    the sample values.
%
%    and 'fem_prefix' is the common prefix for the FEM files:
%
%    * fem_prefix_nodes.txt,    the node coordinates;
%    * fem_prefix_elements.txt, the nodes that make up each element;
%    * fem_prefix_values.txt,   the values defined at each node, 
%                               (computed by this program).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2010
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
  fprintf ( 'FEM2D_PROJECT\n' );
  fprintf ( '  MATLAB version.\n' );
  fprintf ( '\n' );
  fprintf ( '  Read files defining a sampling of a function of 2 arguments.\n' );
  fprintf ( '  Read files defining a finite element mesh.\n' );
  fprintf ( '  Project the sample data onto the mesh, and\n' );
  fprintf ( '  write a file of FEM coefficient values.\n' );
%
%  Get the number of command line arguments.
%
  if ( nargin < 1 )

    fprintf ( '\n' );
    sample_prefix = input ( 'Enter the sample file prefix:  ' );

  else

  end

  if ( nargin < 2 )

    fprintf ( '\n' );
    fem_prefix = input ( 'Enter the FEM file prefix:  ' );

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
  sample_node_xy = load ( sample_node_filename );
  sample_node_xy = sample_node_xy';
  [sample_node_dim, sample_node_num ] = size ( sample_node_xy );

  fprintf ( '\n' );
  fprintf ( '  Sample node spatial dimension is %d\n', sample_node_dim );
  fprintf ( '  Sample node number is            %d\n', sample_node_num );

  if ( sample_node_dim ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'FEM2D_PROJECT - Fatal error!\n' );
    fprintf ( '  Spatial dimension of the sample nodes is not 2.\n' );
    return
  end

  sample_element_node = load ( sample_element_filename );
  sample_element_node = sample_element_node';
  [ sample_element_order, sample_element_num ] = size ( sample_element_node );

  fprintf ( '\n' );
  fprintf ( '  Sample element order is  %d\n', sample_element_order );
  fprintf ( '  Sample element number is %d\n', sample_element_num );

  if ( sample_element_order ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'FEM2D_PROJECT - Fatal error!\n' );
    fprintf ( '  The sample elements must be of order 3.\n' );
    return
  end

  sample_value = load ( sample_value_filename );
  sample_value = sample_value';
  [ sample_value_dim, sample_value_num ] = size ( sample_value );

  fprintf ( '\n' );
  fprintf ( '  Sample value dimension is        %d\n', sample_value_dim );
  fprintf ( '  Sample value number is           %d\n', sample_value_num );

  if ( sample_value_num ~= sample_node_num )
    fprintf ( '\n' );
    fprintf ( 'FEM2D_PROJECT - Fatal error!\n' );
    fprintf ( '  Number of sample nodes and values are not equal.\n' );
    return
  end

  sample_value_min = min ( sample_value, [], 2 );
  sample_value_max = max ( sample_value, [], 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Index      SAMPLE Min      SAMPLE Max\n' );
  fprintf ( 1, '\n' );
  for i = 1 : sample_value_dim
    fprintf ( 1, '  %8d  %14f  %14f\n', i, sample_value_min(i), sample_value_max(i) );
  end
%
%  Create the sample element neighbor array.
%
  sample_element_neighbor = triangulation_order3_neighbor_triangles ( ...
    sample_element_num, sample_element_node );

  fprintf ( '\n' );
  fprintf ( '  The element neighbor array has been computed.\n' );
%
%  Read the FEM NODE and ELEMENT data.
%
  fem_node_xy = load ( fem_node_filename );
  fem_node_xy = fem_node_xy';
  [ fem_node_dim, fem_node_num ] = size ( fem_node_xy );

  fprintf ( '\n' );
  fprintf ( '  The FEM node dimension is        %d\n', fem_node_dim );
  fprintf ( '  The FEM node number is           %d\n', fem_node_num );

  if ( fem_node_dim ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'FEM2D_PROJECT - Fatal error!\n' );
    fprintf ( '  Spatial dimension of the nodes is not 2.\n' );
    return
  end

  fem_element_node = load ( fem_element_filename );
  fem_element_node = fem_element_node';
  [ fem_element_order, fem_element_num ] = size ( fem_element_node );

  fprintf ( '  The FEM element order is         %d\n', fem_element_order );
  fprintf ( '  The FEM element number is        %d\n', fem_element_num );

  if ( fem_element_order ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'FEM2D_PROJECT - Fatal error!\n' );
    fprintf ( '  The FEM elements must be of order 3.\n' );
    return
  end
%
%  Compute the FEM values.
%
  fem_value_dim = sample_value_dim;
  fem_value_num = fem_node_num;

  fem_value = fem2d_transfer ( sample_element_order, ...
    sample_element_num, sample_value_dim, ...
    sample_node_xy, sample_element_node, sample_element_neighbor, sample_value, ...
    fem_node_num, fem_element_num, fem_value_dim, fem_node_xy, fem_element_node );
%
%  Print Min, Max.
%
  fem_value_min = min ( fem_value, [], 2 );
  fem_value_max = max ( fem_value, [], 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Index         FEM Min         FEM Max\n' );
  fprintf ( 1, '\n' );
  for i = 1 : fem_value_dim
    fprintf ( 1, '  %8d  %14f  %14f\n', i, fem_value_min(i), fem_value_max(i) );
  end
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
  fprintf ( 'FEM2D_PROJECT\n' );
  fprintf ( '  Normal end of execution.\n' );

  fprintf ( '\n' );
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
function fem_value = fem2d_transfer ( sample_element_order, ...
  sample_element_num, sample_value_dim, sample_node_xy, ...
  sample_element_node, sample_element_neighbor, sample_value, fem_node_num, ...
  fem_element_num, fem_value_dim, fem_node_xy, fem_element_node )

%*****************************************************************************80
%
%% FEM2D_TRANSFER "transfers" from one finite element mesh to another.
%
%  Discussion:
%
%    1) the linear system A*X=B is defined with A being a full storage matrix.
%       This can easily be fixed using MATLAB's SPARSE facility.
%
%    2) the quadrature rule used is low order.
%
%    3) the triangular elements are assumed to be linear.
%
%
%    We are also given a set of "sample" finite element function defined
%    by SAMPLE_NODE_XY, SAMPLE_ELEMENT, and SAMPLE_VALUE.
%
%    We are given a second finite element mesh, FEM_NODE_XY and
%    FEM_ELEMENT_NODE.
%
%    Our aim is to "project" the sample data values into the finite element
%    space, that is, to come up with a finite element function FEM_VALUE which
%    well approximates the sample data.
%
%    Now let W(x,y) represent a function interpolating the sample data, and
%    let Vk(x,y) represent the finite element basis function associated with
%    node K.
%
%    Then we seek the coefficient vector U corresponding to a finite element
%    function U(x,y) of the form:
%
%      U(x,y) = sum ( 1 <= K <= N ) Uk * Vk(x,y)
%
%    To determine the coefficent vector entries U, we form a set of
%    projection equations.  For node K at grid point (I,J), the associated
%    basis function Vk(x,y) is used to pose the equation:
%
%      Integral U(x,y) Vk(x,y) dx dy = Integral W(x,y) Vk(x,y) dx dy
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
%    12 February 2010
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
%    Input, real SAMPLE_NODE_XY(2,SAMPLE_NODE_NUM), the nodes.
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
%    Input, real FEM_NODE_XY(2,FEM_NODE_NUM), the nodes.
%
%    Input, integer FEM_ELEMENT_NODE(FEM_ELEMENT_ORDER,FEM_ELEMENT_NUM),
%    the nodes that make up each element.
%
%    Output, real FEM_VALUE(FEM_VALUE_DIM,FEM_VALUE_NUM),
%    the values.
%
  project_node_num = 1;
  quad_num = 3;
%
%  Assemble the coefficient matrix A and the right-hand side B.
%
  b = zeros (fem_node_num,fem_value_dim);
%
%  Define A as a sparse matrix.
%
  a = sparse ( [], [], [], fem_node_num, fem_node_num );

% a = zeros (fem_node_num,fem_node_num);

  for element = 1 : fem_element_num

    i1 = fem_element_node(1,element);
    i2 = fem_element_node(2,element);
    i3 = fem_element_node(3,element);

    area = 0.5 * ...
      ( fem_node_xy(1,i1) * ( fem_node_xy(2,i2) - fem_node_xy(2,i3) ) ...
      + fem_node_xy(1,i2) * ( fem_node_xy(2,i3) - fem_node_xy(2,i1) ) ...
      + fem_node_xy(1,i3) * ( fem_node_xy(2,i1) - fem_node_xy(2,i2) ) );
%
%  Consider each quadrature point.
%  Here, we use the midside nodes as quadrature points.
%
    for quad = 1 : quad_num

      q1 =       quad;
      q2 = mod ( quad, quad_num ) + 1;

      nq1 = fem_element_node(q1,element);
      nq2 = fem_element_node(q2,element);

      xq = 0.5 * ( fem_node_xy(1,nq1) + fem_node_xy(1,nq2) );
      yq = 0.5 * ( fem_node_xy(2,nq1) + fem_node_xy(2,nq2) );
      wq = 1.0 / 3.0;
%
%  Consider each test function in the element.
%
      for ti1 = 1 : 3

        ti2 = mod ( ti1,     3 ) + 1;
        ti3 = mod ( ti1 + 1, 3 ) + 1;

        nti1 = fem_element_node(ti1,element);
        nti2 = fem_element_node(ti2,element);
        nti3 = fem_element_node(ti3,element);

        qi = 0.5 * ( ...
            ( fem_node_xy(1,nti3) - fem_node_xy(1,nti2) ) ...
          * ( yq - fem_node_xy(2,nti2) ) ...
          - ( fem_node_xy(2,nti3) - fem_node_xy(2,nti2) ) ...
          * ( xq - fem_node_xy(1,nti2) ) ) / area;
%
%  The projection takes place here.  The finite element code needs the value
%  of the sample function at the point (XQ,YQ).  The call to PROJECTION
%  locates (XQ,YQ) in the triangulated mesh of sample data, and returns a
%  value produced by piecewise linear interpolation.
%
        project_node_xy(1,1) = xq;
        project_node_xy(2,1) = yq;

        project_value = projection ( sample_node_xy, ...
          sample_element_order, sample_element_num, sample_element_node, ...
          sample_element_neighbor, sample_value_dim, sample_value, ...
          project_node_num, project_node_xy );

        b(nti1,1:fem_value_dim) = b(nti1,1:fem_value_dim) ...
          + area * wq * ( project_value(1:fem_value_dim,1)' * qi );
%
%  Consider each basis function in the element.
%
        for tj1 = 1 : 3

          tj2 = mod ( tj1,     3 ) + 1;
          tj3 = mod ( tj1 + 1, 3 ) + 1;

          ntj1 = fem_element_node(tj1,element);
          ntj2 = fem_element_node(tj2,element);
          ntj3 = fem_element_node(tj3,element);

          qj = 0.5 * ( ...
              ( fem_node_xy(1,ntj3) - fem_node_xy(1,ntj2) ) ...
            * ( yq - fem_node_xy(2,ntj2) ) ...
            - ( fem_node_xy(2,ntj3) - fem_node_xy(2,ntj2) ) ...
            * ( xq - fem_node_xy(1,ntj2) ) ) / area;

          a(nti1,ntj1) = a(nti1,ntj1) + area * wq * ( qi * qj );

        end

      end

    end

  end
%
%  Solve the linear system A * X = B.
%
  fem_value = ( a \ b )';

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
function sample_value = projection ( fem_node_xy, ...
  fem_element_order, fem_element_num, fem_element_node, ...
  fem_element_neighbor, fem_value_dim, fem_value, sample_node_num, ...
  sample_node_xy )

%*****************************************************************************80
%
%% PROJECTION evaluates an FEM function on a T3 or T6 triangulation.
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
%    30 June 2009
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
  sample_value = zeros(fem_value_dim,sample_node_num);
%
%  For each sample point: find the triangle T that contains it,
%  and evaluate the finite element function there.
%
  for j = 1 : sample_node_num

    p_xy(1:2,1) = sample_node_xy(1:2,j);
%
%  Find the triangle T that contains the point.
%
    t = triangulation_search_delaunay ( ...
      fem_node_xy, fem_element_num, fem_element_node, ...
      fem_element_neighbor, p_xy );

    if ( t == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PROJECTION - Fatal error!\n' );
      fprintf ( 1, '  Triangulation search failed!\n' );
      error ( 'PROJECTION - Fatal error!' );
    end
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
      sample_value(i,j) = fem_value(i,t_node(1:fem_element_order)) ...
        * b(1:fem_element_order);
    end

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
%    29 June 2009
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
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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
%    12 February 2004
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
function [ triangle_index, edge ] = ...
  triangulation_search_delaunay ( node_xy, ...
  triangle_num, triangle_node, triangle_neighbor, p )

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
%    13 January 2010
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
  persistent triangle_index_save;

  if ( isempty ( triangle_index_save ) )
    triangle_index_save = -1;
  end

  count = 0;
  edge = 0;

  if ( triangle_index_save < 1 || triangle_num < triangle_index_save )
    triangle_index = floor ( ( triangle_num + 1 ) / 2 );
  else
    triangle_index = triangle_index_save;
  end

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
%  Get the vertices of triangle TRIANGLE_INDEX.
%
    a = triangle_node(1,triangle_index);
    b = triangle_node(2,triangle_index);
    c = triangle_node(3,triangle_index);
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
    if ( alpha < 0.0 && 0 < triangle_neighbor(2,triangle_index) )
      triangle_index = triangle_neighbor(2,triangle_index);
      continue;
    elseif ( beta < 0.0 && 0 < triangle_neighbor(3,triangle_index) )
      triangle_index = triangle_neighbor(3,triangle_index);
      continue;
    elseif ( gamma < 0.0 && 0 < triangle_neighbor(1,triangle_index) )
      triangle_index = triangle_neighbor(1,triangle_index);
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

  triangle_index_save = triangle_index;

  return
end
