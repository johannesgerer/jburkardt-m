function fem2d_heat_sparse ( prefix )

%*****************************************************************************80
%
%% MAIN is the main routine of FEM2D_HEAT_SPARSE.
%
%  Discussion:
%
%    This program is a variant of FREE_FEM_HEAT.  That program is
%    particularly limited because of its use of banded matrix storage and
%    solving routines.
%
%    This program discards the banded approach.  Instead, it uses MATLAB's
%    sparse matrix storage, factorization and solution facilities,
%    which allow this program to solve larger problems faster.
%
%    Routines that must be changed include:
%    * FREE_FEM_HEAT is replaced by FFS_HEAT.
%    * ASSEMBLE_HEAT is replaced by ASSEMBLE_HEAT_SPARSE.
%    * ASSEMBLE_BOUNDARY is replaced by ASSEMBLE_BOUNDARY_SPARSE.
%    * ASSEMBLE_BACKWARD_EULER is replaced by ASSEMBLE_BACKWARD_EULER_SPARSE.
%
%    This also means that the following routines are NOT needed:
%    * BANDWIDTH
%    * DGB_FA
%    * DGB_SL.
%    * DGB_PRINT_SOME.
%
%    This program solves the heat equation
%
%      dUdT - Laplacian U(X,Y,T) + K(X,Y,T) * U(X,Y,T) = F(X,Y,T)
%
%    in a triangulated region in the plane.
%
%    Along the boundary of the region, Dirichlet conditions
%    are imposed:
%
%      U(X,Y,T) = G(X,Y,T)
%
%    At the initial time T_INIT, the value of U is given
%    at all points in the region:
%
%      U(X,Y,T_INIT) = H(X,Y)
%
%    The code uses continuous piecewise linear basis functions on
%    triangles.
%
%    The backward Euler approximation is used for the time derivatives.
%
%  Problem specification:
%
%    The user defines the geometry by supplying two data files
%    which list the node coordinates, and list the nodes that make up
%    each element.
%
%    The user specifies the coefficient function K(X,Y,T)
%    by supplying a routine of the form
%
%      function k = k_coef ( node_num, node_xy, time )
%
%    The user specifies the right hand side
%    by supplying a routine of the form
%
%     function f = rhs ( node_num, node_xy, time )
%
%    The user specifies the right hand side of the Dirichlet boundary
%    conditions by supplying a function
%
%      function u = dirichlet_condition ( node_num, node_xy, time )
%
%    The user specifies the initial condition by supplying a function
%
%      function u = initial_condition ( node_num, node_xy, time )
%
%  Usage:
%
%    fem2d_heat_sparse ( 'prefix' )
%
%    where:
%
%    'prefix' is the common prefix for the node and element files:
%
%    * 'prefix'_nodes.txt,     the node coordinates.
%    * 'prefix'_elements.txt,  the nodes that make up each element.
%
%    Files created include:
%
%    * "nodes.eps", an image of the nodes;
%    * "elements.eps", an image of the elements;
%    * "u0000.txt", the value of the solution at the initial condition.
%    * "u0001.txt" through "UNNNN.txt", the value of the solution at
%      each time step;
%    * "time.txt", the value of time at each step, from the initial to
%      final times.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, real sparse A, the coefficient matrix.
%
%    Local, integer DIM_NUM, the spatial dimension, which is 2.
%
%    Local, string ELEMENT_FILE_NAME, the name of the
%    input file containing the element information.
%
%    Local, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Local, integer ELEMENT_NUM, the number of elements.
%
%    Local, integer ELEMENT_ORDER, the order of each element.
%
%    Local, real F(NODE_NUM), the right hand side.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, logical NODE_BOUNDARY(NODE_NUM), is TRUE if a given
%    node is on the boundary.
%
%    Local, integer NODE_CONDITION(NODE_NUM), indicates the type of
%    boundary condition being applied to nodes on the boundary.
%
%    Local, string NODE_FILE_NAME, the name of the
%    input file containing the node coordinate information.
%
%    Local, real NODE_U(NODE_NUM), the finite element coefficients.
%
%    Local, real NODE_XY(2,NODE_NUM), the coordinates of nodes.
%
%    Local, integer QUAD_NUM, the number of quadrature points used for
%    assembly.  This is currently set to 3, the lowest reasonable value.
%    Legal values are 1, 3, 4, 6, 7, 9, 13, and for some problems, a value
%    of QUAD_NUM greater than 3 may be appropriate.
%
  debug = 0;
  quad_num = 3;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_HEAT_SPARSE:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  A version of FEM2D_HEAT using MATLAB''s \n' );
  fprintf ( 1, '  sparse matrix storage, factor and solve facilities.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Finite element solution of the \n' );
  fprintf ( 1, '  time dependent heat equation\n' );
  fprintf ( 1, '  on an arbitrary triangulated region D in 2 dimensions.n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Ut - Uxx - Uyy + K(x,y,t) * U = F(x,y,t) in D;\n' );
  fprintf ( 1, '                              U = G(x,y,t) on boundary;\n' );
  fprintf ( 1, '                              U = H(x,y,t) at initial time.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The finite element method is used, with\n' );
  fprintf ( 1, '  6 node quadratic triangular elements ("T6").\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The time derivative is approximated using the\n' );
  fprintf ( 1, '  backward Euler formula.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current status:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * Time step information currently set internally!\n' );
  fprintf ( 1, '  * Would be easy to do linear triangles as well.\n' );
  fprintf ( 1, '  * Do you want ability to compare to an exact solution?\n' );
  fprintf ( 1, '\n' );
%
%  Create the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node file is "%s".\n', node_filename );
  fprintf ( 1, '  Element file is "%s".\n', element_filename );
%
%  Read the node coordinate file.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  fprintf ( 1, '  Number of nodes =          %d\n', node_num );

  node_xy = r8mat_data_read ( node_filename, dim_num, node_num );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, 2, 10, ...
    '  First 10 nodes' );
%
%  Read the element description file.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order =            %d\n', element_order );
  fprintf ( 1, '  Number of elements =       %d\n', element_num );

  if ( element_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_HEAT_SPARSE - Fatal error!\n' );
    fprintf ( 1, '  The input triangulation has order %d.\n', element_order );
    fprintf ( 1, '  However, a triangulation of order 6 is required.' );
    error ( 'FEM2D_HEAT_SPARSE - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  i4mat_transpose_print_some ( element_order, element_num, ...
    element_node, 1, 1, element_order, 10, '  First 10 elements' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature order =          %d\n', quad_num );
%
%  Determine which nodes are boundary nodes and which have a
%  finite element unknown.  Then set the boundary values.
%
  node_boundary = triangulation_order6_boundary_node ( node_num, ...
    element_num, element_node );

  if ( debug )
    lvec_print ( node_num, node_boundary, '    Node  Boundary?' );
  end
%
%  Determine the node conditions.
%  For now, we'll just assume all boundary nodes are Dirichlet.
%
  node_condition(1:node_num) = 1;

  for node = 1 : node_num
    if ( node_boundary(node) )
      node_condition(node) = 2;
    end
  end
%
%  Make a picture of the nodes.
%
  if ( node_num <= 1000 )

    node_filename = 'nodes.eps';

    if ( node_num <= 100 )
      node_label = 1;
    else
      node_label = 0;
    end

    points_plot ( node_filename, node_num, node_xy, node_label );

  end
%
%  Make a picture of the elements.
%
  if ( node_num <= 1000 )

    triangulation_eps_filename = 'elements.eps';

    if ( node_num <= 100 )
      node_show = 2;
    elseif ( node_num <= 250 )
      node_show = 1;
    else
      node_show = 0;
    end

    if ( element_num <= 100 )
      element_show = 2;
    else
      element_show = 1;
    end

    triangulation_order6_plot ( triangulation_eps_filename, node_num, ...
      node_xy, element_num, element_node, node_show, element_show );

  end
%
%  Set time stepping quantities.
%
  time_init = 0.0;
  time_final = 0.5;
  time_step_num = 10;
  time_step_size = ( time_final - time_init ) / time_step_num;
  time_vector = linspace ( time_init, time_final, time_step_num + 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial time = %f\n', time_init );
  fprintf ( 1, '  Final time =   %f\n', time_final );
  fprintf ( 1, '  Step size =    %f\n', time_step_size );
  fprintf ( 1, '  Number of steps = %d\n', time_step_num );
%
%  Initialize the names of the time and solution file.
%
  time_filename = 'time.txt';
  solution_filename = 'u0000.txt';
%
%  Set the value of U at the initial time.
%
  time = time_init;
  u_exact(1:node_num) = initial_condition ( node_num, node_xy, time );
  u(1:node_num,1) = u_exact(1:node_num);

  time_unit = fopen ( time_filename, 'wt');
  fprintf ( time_unit, '%14f\n', time );

  r8mat_write ( solution_filename, 1, node_num, u' );
%
%  Determine the element neighbor array, just so we can estimate
%  the nonzeros.
%
  element_neighbor = triangulation_neighbor_triangles ( ...
    element_order, element_num, element_node );
%
%  Determine the maximum number of nonzeros.
%
  [ nz_num, adj_col ] = triangulation_order6_adj_count ( node_num, ...
    element_num, element_node, element_neighbor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_ADJ_COUNT returns NZ_NUM = %d\n', ...
    nz_num );
%
%  Time looping.
%
  for time_step = 1 : time_step_num

    time_old = time;
    u_old(1:node_num) = u(1:node_num);

    time = ( ( time_step_num - time_step ) * time_init    ...
           + (                 time_step ) * time_final ) ...
           / ( time_step_num             );
%
%  Assemble the finite element coefficient matrix A and the right-hand side F.
%
  [ a, f ] = assemble_heat_sparse ( node_num, node_xy, node_condition, ...
    element_order, element_num, element_node, quad_num, nz_num, time );

  if ( debug )

    r8mat_print_some ( node_num, node_num, a, 1, 1, 10, 10, ...
      '  Initial block of stiffness matrix A:' );

    r8vec_print_some ( node_num, f, 1, 10, ...
      '  Part of finite element right hand side vector F:' );

  end
%
%  Adjust the linear system for the dU/dT term, which we are treating
%  using the backward Euler formula.
%
    [ a, f ] = assemble_backward_euler_sparse ( node_num, node_xy, ...
      element_order, element_num, element_node, quad_num, time, ...
      time_step_size, u_old, a, f );

    if ( debug )

      r8mat_print_some ( node_num, node_num, a, 1, 1, 10, 10, ...
        '  A after DT adjustment:' );

      r8vec_print_some ( node_num, f, 1, 10, ...
        '  F after DT adjustment:' );

    end
%
%  Adjust the linear system to account for boundary conditions.
%
    [ a, f ] = assemble_boundary_sparse ( node_num, node_xy, node_condition, ...
      time, a, f );

    if ( debug )

      r8mat_print_some ( node_num, node_num, a, 1, 1, 10, 10, ...
        '  A after BC adjustment:' );

      r8vec_print_some ( node_num, f, 1, 10, ...
        '  F after BC adjustment:' );

    end
%
%  Solve the linear system using MATLAB's sparse solver.
%
    u = a \ f';

    if ( debug )

      r8vec_print_some ( node_num, u, 1, 10, ...
        '  Part of the solution vector:' );

    end
%
%  You could compute the L2 norm of the difference between the computed
%  solution and a known exact solution here, if the user could supply
%  a function for the exact solution.
%

%
%  Increment the file name, and write the new solution.
%
    fprintf ( time_unit, '%14f\n', time );

    solution_filename = file_name_inc ( solution_filename );

    r8mat_write ( solution_filename, 1, node_num, u' );

  end

  fclose ( time_unit );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_HEAT_SPARSE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, f ] = assemble_backward_euler_sparse ( node_num, ...
  node_xy, element_order, element_num, element_node, quad_num, time, ...
  time_step_size, u_old, a, f )

%*****************************************************************************80
%
%% ASSEMBLE_BACKWARD_EULER_SPARSE adjusts for the backward Euler term.
%
%  Discussion:
%
%    The input linear system, stored in MATLAB's sparse matrix format,
%
%      A * U = F
%
%    is appropriate for the equation
%
%      -Uxx - Uyy - K * U = RHS
%
%    We need to modify the matrix A and the right hand side F to
%    account for the approximation of the time derivative in
%
%      Ut - Uxx - Uyy - K * U = RHS
%
%    by the backward Euler approximation:
%
%      Ut approximately equal to ( U - Uold ) / dT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_ORDER, the number of nodes used to form one element.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, real TIME, the current time.
%
%    Input, real TIME_STEP_SIZE, the size of the time step.
%
%    Input, real U_OLD(NODE_NUM), the finite element
%    coefficients for the solution at the previous time.
%
%    Input, real sparse A, the NODE_NUM by NODE_NUM coefficient
%    matrix, stored in MATLAB's sparse format.
%
%    Input, real F(NODE_NUM), the right hand side.
%
%    Output, real sparse A, the updated matrix.
%
%    Output, real F(NODE_NUM), the updated right hand side.
%

%
%  Get the quadrature rule weights and nodes.
%
  [ quad_w, quad_xy ] = quad_rule ( quad_num );

  for element = 1 : element_num
%
%  Make two copies of the triangle.
%
    t3(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
    t6(1:2,1:6) = node_xy(1:2,element_node(1:6,element));
%
%  Map the quadrature points QUAD_XY to points XY in the physical triangle.
%
    xy = reference_to_physical_t3 ( t3, quad_num, quad_xy );

    area = abs ( triangle_area_2d ( t3 ) );

    w(1:quad_num) = area * quad_w(1:quad_num);

    for quad = 1 : quad_num

      for test = 1 : element_order

        node = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t6 ( t6, test, xy(1:2,quad) );
%
%  Carry the U_OLD term to the right hand side.
%
        f(node) = f(node) + w(quad) * bi * u_old(node) / time_step_size;
%
%  Modify the diagonal entries of A.
%
        for basis = 1 : element_order

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t6 ( t6, basis, xy(1:2,quad) );

          a(node,j) = a(node,j) + w(quad) * bi * bj / time_step_size;

        end
      end

    end

  end

  return
end
function [ a, f ] = assemble_boundary_sparse ( node_num, node_xy, ...
  node_condition, time, a, f )

%*****************************************************************************80
%
%% ASSEMBLE_BOUNDARY_SPARSE modifies the linear system for the boundary conditions.
%
%  Discussion:
%
%    For now, we are only working with Dirichlet boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of nodes.
%
%    Input, integer NODE_CONDITION(NODE_NUM), reports the condition
%    used to set the unknown associated with the node.
%    0, unknown.
%    1, finite element equation.
%    2, Dirichlet condition;
%    3, Neumann condition.
%
%    Input, real TIME, the current time.
%
%    Input, real sparse A, the NODE_NUM by NODE_NUM coefficient
%    matrix, stored in a compressed format.
%
%    Input, real F(NODE_NUM), the right hand side.
%
%    Output, real sparse A, the matrix has been adjusted for
%    Dirichlet boundary conditions.
%
%    Output, real F(NODE_NUM), the right hand side has been adjusted for
%    Dirichlet boundary conditions.
%
  DIRICHLET = 2;

  node_bc = dirichlet_condition ( node_num, node_xy, time );

  for node = 1 : node_num

    if ( node_condition(node) == DIRICHLET )

      a(node,:) = 0.0;
      a(node,node) = 1.0;

      f(node) = node_bc(node);

    end

  end

  return
end
function [ a, f ] = assemble_heat_sparse ( node_num, node_xy, node_condition, ...
  element_order, element_num, element_node, quad_num, nz_num, time )

%*****************************************************************************80
%
%% ASSEMBLE_HEAT_SPARSE assembles the finite element system for the heat equation.
%
%  Discussion:
%
%    MATLAB's built-in sparse matrix storage is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of nodes.
%
%    Input, integer NODE_CONDITION(NODE_NUM), reports the condition
%    used to set the unknown associated with the node.
%    0, unknown.
%    1, finite element equation.
%    2, Dirichlet condition;
%    3, Neumann condition.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, integer NZ_NUM, the (maximum) number of nonzeros in the matrix.
%    If set to 0 on input, we hope MATLAB's sparse utility will be able
%    to take over the task of reallocating space as necessary.
%
%    Input, real TIME, the current time.
%
%    Output, real sparse A, the NODE_NUM by NODE_NUM coefficient matrix,
%    stored in MATLAB's sparse format.
%
%    Output, real F(NODE_NUM), the right hand side.
%
%  Local parameters:
%
%    Local, real BI, DBIDX, DBIDY, the value of some basis function
%    and its first derivatives at a quadrature point.
%
%    Local, real BJ, DBJDX, DBJDY, the value of another basis
%    function and its first derivatives at a quadrature point.
%
  debug = 0;
%
%  Initialize the arrays to zero.
%
  f(1:node_num) = 0.0;

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ASSEMBLE_HEAT_SPARSE:\n' );
    fprintf ( 1, '  Setting up sparse heat matrix with NZ_NUM = %d\n', nz_num );
  end

  a = sparse ( [], [], [], node_num, node_num, nz_num );
%
%  Get the quadrature weights and nodes.
%
  [ quad_w, quad_xy ] = quad_rule ( quad_num );
%
%  Add up all quantities associated with the TRIANGLE-th triangle.
%
  for element = 1 : element_num
%
%  Make a copy of the triangle.
%
    t3(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
    t6(1:2,1:6) = node_xy(1:2,element_node(1:6,element));
%
%  Map the quadrature points QUAD_XY to points XY in the physical triangle.
%
    xy(1:2,1:quad_num) = reference_to_physical_t3 ( t3, quad_num, quad_xy );

    area = abs ( triangle_area_2d ( t3 ) );

    w(1:quad_num) = area * quad_w(1:quad_num);

    k_quad = k_coef ( quad_num, xy, time );

    rhs_quad = rhs  ( quad_num, xy, time );
%
%  Consider the QUAD-th quadrature point.
%
    for quad = 1 : quad_num
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%
      for test = 1 : element_order

        i = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t6 ( t6, test, xy(1:2,quad) );

        f(i) = f(i) + w(quad) * rhs_quad(quad) * bi;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for basis = 1 : element_order

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t6 ( t6, basis, xy(1:2,quad) );

          a(i,j) = a(i,j) ...
            + w(quad) * ( dbidx * dbjdx + dbidy * dbjdy + k_quad(quad) * bj * bi );

        end

      end

    end

  end

  return
end
function [ bi, dbidx, dbidy ] = basis_11_t6 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T6: one basis at one point for the T6 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the nodes of a triangle.
%
%           3
%          / \
%         6   5
%        /     \
%       1---4---2
%
%    It evaluates the quadratic basis function B(I)(X,Y) associated with
%    node I, which has the property that it is a quadratic function
%    which is 1 at node I and zero at the other five nodes.
%
%    This routine assumes that the sides of the triangle are straight,
%    so that the midside nodes fall on the line between two vertices.
%
%    This routine relies on the fact that each basis function can be
%    written as the product of two linear factors, which are easily
%    computed and normalized.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the coordinates of the nodes.
%
%    Input, integer I, the index of the desired basis function.
%    I should be between 1 and 6.
%
%    Input, real P(2), the coordinates of a point at which the basis
%    function is to be evaluated.
%
%    Output, real BI, DBIDX, DBIDY, the values of the basis function
%    and its X and Y derivatives.
%
  if ( i < 1 | 6 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T6 - Fatal error!\n' );
    fprintf ( 1, '  Basis index I is not between 1 and 6.\n' );
    fprintf ( 1, '  I = ', i );
    error ( 'BASIS_11_T6 - Fatal error!' );
  end
%
%  Determine the pairs of nodes.
%
  if ( i <= 3 )
    j1 = i4_wrap ( i + 1, 1, 3 );
    j2 = i4_wrap ( i + 2, 1, 3 );
    k1 = i + 3;
    k2 = i4_wrap ( i + 5, 4, 6 );
  else
    j1 = i - 3;
    j2 = i4_wrap ( i - 3 + 2, 1, 3 );
    k1 = i4_wrap ( i - 3 + 1, 1, 3 );
    k2 = i4_wrap ( i - 3 + 2, 1, 3 );
  end
%
%  Evaluate the two linear factors GF and HF,
%  and their normalizers GN and HN.
%
  gf = ( p(1)    - t(1,j1) ) * ( t(2,j2) - t(2,j1) ) ...
     - ( t(1,j2) - t(1,j1) ) * ( p(2)    - t(2,j1) );

  gn = ( t(1,i)  - t(1,j1) ) * ( t(2,j2) - t(2,j1) ) ...
     - ( t(1,j2) - t(1,j1) ) * ( t(2,i)  - t(2,j1) );

  hf = ( p(1)    - t(1,k1) ) * ( t(2,k2) - t(2,k1) ) ...
     - ( t(1,k2) - t(1,k1) ) * ( p(2)    - t(2,k1) );

  hn = ( t(1,i)  - t(1,k1) ) * ( t(2,k2) - t(2,k1) ) ...
     - ( t(1,k2) - t(1,k1) ) * ( t(2,i)  - t(2,k1) );
%
%  Construct the basis function and its derivatives.
%
  bi =        ( gf                  / gn ) * (   hf                  / hn );

  dbidx =   ( ( t(2,j2) - t(2,j1) ) / gn ) * (   hf                  / hn ) ...
          + (   gf                  / gn ) * ( ( t(2,k2) - t(2,k1) ) / hn );

  dbidy = - ( ( t(1,j2) - t(1,j1) ) / gn ) * (   hf                  / hn ) ...
          - (   gf                  / gn ) * ( ( t(1,k2) - t(1,k1) ) / hn );

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
    column_num = -1;
    return;
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
function file_name = file_name_inc ( file_name )

%*****************************************************************************80
%
% FILE_NAME_INC generates the next filename in a series.
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

    if ( '0' <= c & c <= '8' )

      change = change + 1;

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
    row_num = -1;
    return;
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
function value = i4_modp ( i, j )

%*****************************************************************************80
%
%% I4_MODP returns the nonnegative remainder of I4 division.
%
%  Discussion:
%
%    If
%      NREM = I4_MODP ( I, J )
%      NMULT = ( I - NREM ) / J
%    then
%      I = J * NMULT + NREM
%    where NREM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, I4_MODP(A,360) is between 0 and 360, always.
%
%  Example:
%
%        I     J     MOD  I4_MODP    Factorization
%
%      107    50       7       7    107 =  2 *  50 + 7
%      107   -50       7       7    107 = -2 * -50 + 7
%     -107    50      -7      43   -107 = -3 *  50 + 43
%     -107   -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be divided.
%
%    Input, integer J, the number that divides I.
%
%    Output, integer VALUE, the nonnegative remainder when I is
%    divided by J.
%
  if ( j == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODP - Fatal error!\n' );
    fprintf ( 1, '  Illegal divisor J = %d\n', j );
    error ( 'I4_MODP - Fatal error!' );
  end

  value = mod ( i, j );

  if ( value < 0 )
    value = value + abs ( j );
  end

  return
end
function value = i4_wrap ( ival, ilo, ihi )

%*****************************************************************************80
%
%% I4_WRAP forces an integer to lie between given limits by wrapping.
%
%  Example:
%
%    ILO = 4, IHI = 8
%
%    I   Value
%
%    -2     8
%    -1     4
%     0     5
%     1     6
%     2     7
%     3     8
%     4     4
%     5     5
%     6     6
%     7     7
%     8     8
%     9     4
%    10     5
%    11     6
%    12     7
%    13     8
%    14     4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IVAL, an integer value.
%
%    Input, integer ILO, IHI, the desired bounds for the integer value.
%
%    Output, integer I4_WRAP, a "wrapped" version of IVAL.
%
  jlo = min ( ilo, ihi );
  jhi = max ( ilo, ihi );

  wide = jhi - jlo + 1;

  if ( wide == 1 )
    value = jlo;
  else
    value = jlo + i4_modp ( ival - jlo, wide );
  end

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
  i = 0;
  indx = 0;
  isgn = 0;
  j = 0;
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
  if ( i < 1 | n < i | j < 1 | n < j )
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
  table = [];
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
    return;
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
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
function lvec_print ( n, a, title )

%*****************************************************************************80
%
%% LVEC_PRINT prints a logical vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, logical A(N), the vector to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  for i = 1 : n
    value = ( a(i) ~= 0 );
    fprintf ( 1, '%6d  %1d\n', i, value );
  end

  return
end
function points_plot ( file_name, node_num, node_xy, node_label )

%*****************************************************************************80
%
%% POINTS_PLOT plots the nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file to create.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, logical NODE_LABEL, is TRUE if the nodes should be labeled.
%
  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;
%
%  We need to do some figuring here, so that we can determine
%  the range of the data, and hence the height and width
%  of the piece of paper.
%
  x_max = max ( node_xy(1,1:node_num) );
  x_min = min ( node_xy(1,1:node_num) );
  x_scale = x_max - x_min;

  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

  y_max = max ( node_xy(2,1:node_num) );
  y_min = min ( node_xy(2,1:node_num) );
  y_scale = y_max - y_min;

  y_max = y_max + 0.05 * y_scale;
  y_min = y_min - 0.05 * y_scale;
  y_scale = y_max - y_min;

  if ( x_scale < y_scale )

    delta = round ( ( x_ps_max - x_ps_min ) ...
      * ( y_scale - x_scale ) / ( 2.0 * y_scale ) );

    x_ps_max = x_ps_max - delta;
    x_ps_min = x_ps_min + delta;

    x_ps_max_clip = x_ps_max_clip - delta;
    x_ps_min_clip = x_ps_min_clip + delta;

    x_scale = y_scale;

  elseif ( y_scale < x_scale )

    delta = round ( ( y_ps_max - y_ps_min ) ...
      * ( x_scale - y_scale ) / ( 2.0 * x_scale ) );

    y_ps_max      = y_ps_max - delta;
    y_ps_min      = y_ps_min + delta;

    y_ps_max_clip = y_ps_max_clip - delta;
    y_ps_min_clip = y_ps_min_clip + delta;

    y_scale = x_scale;

  end

  file_unit = fopen ( file_name, 'wt' );

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINTS_PLOT - Fatal error!\n');
    fprintf ( 1, '  Could not open the output EPS file.\n' );
    error ( 'POINTS_PLOT - Fatal error!' );
  end

  fprintf ( file_unit, '%!PS-Adobe-3.0 EPSF-3.0\n');
  fprintf ( file_unit, '%%Creator: points_plot.m\n');
  fprintf ( file_unit, '%%Title: %s\n', file_name );
  fprintf ( file_unit, '%%Pages: 1\n');
  fprintf ( file_unit, '%%BoundingBox:  %d  %d  %d  %d\n', ...
    x_ps_min, y_ps_min, x_ps_max, y_ps_max );
  fprintf ( file_unit, '%%Document-Fonts: Times-Roman\n');
  fprintf ( file_unit, '%%LanguageLevel: 1\n');
  fprintf ( file_unit, '%%EndComments\n');
  fprintf ( file_unit, '%%BeginProlog\n');
  fprintf ( file_unit, '/inch {72 mul} def\n');
  fprintf ( file_unit, '%%EndProlog\n');
  fprintf ( file_unit, '%%Page:      1     1\n');
  fprintf ( file_unit, 'save\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '% Set RGB line color to very light gray.\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, ' 0.9000 0.9000 0.9000 setrgbcolor\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '% Draw a gray border around the page.\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, 'newpath\n');
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, 'stroke\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '% Set RGB line color to black.\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '% Set the font and its size.\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '/Times-Roman findfont\n');
  fprintf ( file_unit, '0.50 inch scalefont\n');
  fprintf ( file_unit, 'setfont\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%  Print a title:\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%  210  702  moveto\n');
  fprintf ( file_unit, '%  (Pointset)  show\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%  Define a clipping polygon\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%newpath\n');
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, 'clip newpath\n');
%
%  Draw the nodes.
%
  if ( node_num <= 200 )
    circle_size = 5;
  elseif ( node_num <= 500 )
    circle_size = 4;
  elseif ( node_num <= 1000 )
    circle_size = 3;
  elseif ( node_num <= 5000 )
    circle_size = 2;
  else
    circle_size = 1;
  end

  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%  Draw filled dots at each node:\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%  Set the RGB color to blue:\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, ' 0.000 0.150 0.750 setrgbcolor\n');

  for node = 1 : node_num

    x_ps = floor ( ...
      ( ( x_max - node_xy(1,node)         ) * x_ps_min   ...
      + (       + node_xy(1,node) - x_min ) * x_ps_max ) ...
      / ( x_max                   - x_min ) );

    y_ps = floor ( ...
      ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
      + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
      / ( y_max                   - y_min ) );

    fprintf ( file_unit, ...
      'newpath  %d  %d  %d  0 360 arc closepath fill\n', ...
      x_ps, y_ps, circle_size );

  end
%
%  Label the nodes.
%
  if ( node_label )
    fprintf ( file_unit, '%\n');
    fprintf ( file_unit, '%  Label the nodes:\n');
    fprintf ( file_unit, '%\n');
    fprintf ( file_unit, '%  Set the RGB color to darker blue:\n');
    fprintf ( file_unit, '%\n');
    fprintf ( file_unit, ' 0.000 0.250 0.850 setrgbcolor\n');

    fprintf ( file_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n');
    fprintf ( file_unit, '/Times-Roman findfont\n');
    fprintf ( file_unit, '0.20 inch scalefont\n');
    fprintf ( file_unit, 'setfont\n');

    for node = 1 : node_num

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min   ...
        + (       + node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, '%d  %d  moveto (%d) show\n', x_ps, y_ps+5, node );

    end

  end

  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, 'restore showpage\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '% End of page\n');
  fprintf ( file_unit, '%\n');
  fprintf ( file_unit, '%%Trailer\n');
  fprintf ( file_unit, '%%EOF\n');

  fclose ( file_unit );

  return
end
function [ quad_w, quad_xy ] = quad_rule ( quad_num )

%*****************************************************************************80
%
%% QUAD_RULE sets the quadrature rule for assembly.
%
%  Discussion:
%
%    The quadrature rule is given for a reference element, points (X,Y) such that
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%      ^
%    1 | *
%      | |\
%    Y | | \
%      | |  \
%    0 | *---*
%      +------->
%        0 X 1
%
%    The rules have the following precision:
%
%    QUAD_NUM  Precision
%
%     1        1
%     3        2
%     4        3
%     6        4
%     7        5
%     9        6
%    13        7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer QUAD_NUM, the number of quadrature nodes.
%    Legal values are 1, 3, 4, 6, 7, 9, 13.
%
%    Output, real QUAD_W(QUAD_NUM), the quadrature weights.
%
%    Output, real QUAD_XY(2,QUAD_NUM), the quadrature nodes.
%
  if ( quad_num == 1 )

    quad_xy(1:2,1:quad_num) = [ 1.0 / 3.0, 1.0 / 3.0 ]';

    quad_w(1:quad_num) = 1.0;

  elseif ( quad_num == 3 )

    quad_xy(1:2,1:quad_num) = [ ...
      0.5, 0.0; ...
      0.5, 0.5; ...
      0.0, 0.5 ]';

    quad_w(1:quad_num) = 1.0 / 3.0;

  elseif ( quad_num == 4 )

    a =   6.0;
    b =  10.0;
    c =  18.0;
    d =  25.0;
    e = -27.0;
    f =  30.0;
    g =  48.0;

    quad_xy(1:2,1:quad_num) = [ ...
      b, b; ...
      c, a; ...
      a, c; ...
      a, a ]' / f;

    quad_w(1:quad_num) = [ e, d, d, d ] / g;

  elseif ( quad_num == 6 )

    a = 0.816847572980459;
    b = 0.091576213509771;
    c = 0.108103018168070;
    d = 0.445948490915965;
    v = 0.109951743655322;
    w = 0.223381589678011;

    quad_xy(1:2,1:quad_num) = [
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      d, c; ...
      d, d ]';

    quad_w(1:6) = [ v, v, v, w, w, w ];

  elseif ( quad_num == 7 )

    a = 1.0 / 3.0;
    b = ( 9.0 + 2.0 * sqrt ( 15.0 ) ) / 21.0;
    c = ( 6.0 -       sqrt ( 15.0 ) ) / 21.0;
    d = ( 9.0 - 2.0 * sqrt ( 15.0 ) ) / 21.0;
    e = ( 6.0 +       sqrt ( 15.0 ) ) / 21.0;
    u = 0.225;
    v = ( 155.0 - sqrt ( 15.0 ) ) / 1200.0;
    w = ( 155.0 + sqrt ( 15.0 ) ) / 1200.0;

    quad_xy(1:2,1:quad_num) = [ ...
      a, a; ...
      b, c; ...
      c, b; ...
      c, c; ...
      d, e; ...
      e, d; ...
      e, e ]';

    quad_w(1:quad_num) = [ u, v, v, v, w, w, w ];

  elseif ( quad_num == 9 )

    a = 0.124949503233232;
    b = 0.437525248383384;
    c = 0.797112651860071;
    d = 0.165409927389841;
    e = 0.037477420750088;

    u = 0.205950504760887;
    v = 0.063691414286223;

    quad_xy(1:2,1:quad_num) = [ ...
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      c, e; ...
      d, c; ...
      d, e; ...
      e, c; ...
      e, d ]';

    quad_w(1:quad_num) = [ u, u, u, v, v, v, v, v, v ];

  elseif ( quad_num == 13 )

    h = 1.0 / 3.0;
    a = 0.479308067841923;
    b = 0.260345966079038;
    c = 0.869739794195568;
    d = 0.065130102902216;
    e = 0.638444188569809;
    f = 0.312865496004875;
    g = 0.048690315425316;

    w = -0.149570044467670;
    t =  0.175615257433204;
    u =  0.053347235608839;
    v =  0.077113760890257;

    quad_xy(1:2,1:quad_num) = [
      h, h; ...
      a, b; ...
      b, a; ...
      b, b; ...
      c, d; ...
      d, c; ...
      d, d; ...
      e, f; ...
      e, g; ...
      f, e; ...
      f, g; ...
      g, e; ...
      g, f ]';

    quad_w(1:quad_num) = [ w, t, t, t, u, u, u, v, v, v, v, v, v ];

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUAD_RULE - Fatal error!\n' );
    fprintf ( 1, '  No rule is available of order QUAD_NUM = %d\n', ...
      quad_num );
    error ( 'QUAD_RULE - Fatal error!\n' );

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
  table = [];
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
    return;
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
function r8mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_PRINT_SOME prints out a portion of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%7d  ', i );

      for j = j2lo : j2hi

        if ( a(i,j) == floor ( a(i,j) ) )
          fprintf ( 1, '%8d      ', a(i,j) );
        else
          fprintf ( 1, '%12g  ', a(i,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, character ( len = * ) TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

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
%    08 February 2010
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
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function r8vec_print_some ( n, a, i_lo, i_hi, title )

%*****************************************************************************80
%
%% R8VEC_PRINT_SOME prints "some" of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, integer MAX_PRINT, the maximum number of lines to print.
%
%    Input, string TITLE, an optional title.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  for i = max ( 1, i_lo ) : min ( n, i_hi )
    fprintf ( 1, '  %8d  %12f\n', i, a(i) );
  end

  return
end
function phy = reference_to_physical_t3 ( t, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_T3 maps a reference point to a physical point.
%
%  Discussion:
%
%    Given the vertices of an order 3 physical triangle and a point
%    (XSI,ETA) in the reference triangle, the routine computes the value
%    of the corresponding image point (X,Y) in physical space.
%
%    Note that this routine may also be appropriate for an order 6
%    triangle, if the mapping between reference and physical space
%    is linear.  This implies, in particular, that the sides of the
%    image triangle are straight and that the "midside" nodes in the
%    physical triangle are literally halfway along the sides of
%    the physical triangle.
%
%  Reference Element T3:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  |   \
%    |  |    \
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the vertices.  The vertices are assumed
%    to be the images of (0,0), (1,0) and (0,1) respectively.
%
%    Input, integer N, the number of objects to transform.
%
%    Input, real REF(2,N), the coordinates of points in the reference space.
%
%    Output, real PHY(2,N), the coordinates of the corresponding points in the
%    physical space.
%
  for i = 1 : 2

    phy(i,1:n) = t(i,1) * ( 1.0 - ref(1,1:n) - ref(2,1:n) ) ...
               + t(i,2) *        ref(1,1:n)                ...
               + t(i,3) *                     ref(2,1:n);
  end

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
%    12 February 2010
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
function area = triangle_area_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_2D computes the area of a triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real AREA, the absolute area of the triangle.
%
  area = 0.5 * abs ( ...
      t(1,1) * ( t(2,2) - t(2,3) ) ...
    + t(1,2) * ( t(2,3) - t(2,1) ) ...
    + t(1,3) * ( t(2,1) - t(2,2) ) );

  return
end
function triangle_neighbor = triangulation_neighbor_triangles ( ...
  triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_NEIGHBOR_TRIANGLES determines triangle neighbors.
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
%    07 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the nodes that
%    make up each triangle.
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
%    (I,J,3,T) or (J,I,3,T),
%    (J,K,1,T) or (K,J,1,T),
%    (K,I,2,T) or (I,K,2,T)
%
%  where we choose (I,J,3,T) if I < J, or else (J,I,3,T)
%
  col = zeros ( 4, triangle_order * triangle_num );

  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:4,1+3*(tri-1)) = [ i, j, 3, tri ]';
    else
      col(1:4,1+3*(tri-1)) = [ j, i, 3, tri ]';
    end

    if ( j < k )
      col(1:4,2+3*(tri-1)) = [ j, k, 1, tri ]';
    else
      col(1:4,2+3*(tri-1)) = [ k, j, 1, tri ]';
    end

    if ( k < i )
      col(1:4,3+3*(tri-1)) = [ k, i, 2, tri ]';
    else
      col(1:4,3+3*(tri-1)) = [ i, k, 2, tri ]';
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
function [ adj_num, adj_col ] = triangulation_order6_adj_count ( node_num, ...
  tri_num, triangle_node, triangle_neighbor )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_ADJ_COUNT counts adjacencies in a triangulation.
%
%  Discussion:
%
%    This routine is called to count the adjacencies, so that the
%    appropriate amount of memory can be set aside for storage when
%    the adjacency structure is created.
%
%    The triangulation is assumed to involve 6-node triangles.
%
%    Two nodes are "adjacent" if they are both nodes in some triangle.
%    Also, a node is considered to be adjacent to itself.
%
%  Diagram:
%
%       3
%    s  |\
%    i  | \
%    d  |  \
%    e  6   5  side 2
%       |    \
%    3  |     \
%       |      \
%       1---4---2
%
%         side 1
%
%    The local node numbering
%
%
%   21-22-23-24-25
%    |\    |\    |
%    | \   | \   |
%   16 17 18 19 20
%    |   \ |   \ |
%    |    \|    \|
%   11-12-13-14-15
%    |\    |\    |
%    | \   | \   |
%    6  7  8  9 10
%    |   \ |   \ |
%    |    \|    \|
%    1--2--3--4--5
%
%    A sample grid.
%
%
%    Below, we have a chart that lists the nodes adjacent to each node, with
%    an asterisk to indicate the adjacency of the node to itself
%    (in some cases, you want to count this self adjacency and in some
%    you don't).
%
%    N   Adjacencies
%
%    1:  *  2  3  6  7 11
%    2:  1  *  3  6  7 11
%    3:  1  2  *  4  5  6  7  8  9 11 12 13
%    4:  3  *  5  8  9 13
%    5:  3  4  *  8  9 10 13 14 15
%    6:  1  2  3  *  7 11
%    7:  1  2  3  6  *  8 11 12 13
%    8:  3  4  5  7  *  9 11 12 13
%    9:  3  4  5  8  * 10 13 14 15
%   10:  5  9  * 13 14 15
%   11:  1  2  3  6  7  8  * 12 13 16 17 21
%   12:  3  7  8 11  * 13 16 17 21
%   13:  3  4  5  7  8  9 10 11 12  * 14 15 16 17 18 19 21 22 23
%   14:  5  9 10 13  * 15 18 19 23
%   15:  5  9 10 13 14  * 18 19 20 23 24 25
%   16: 11 12 13  * 17 21
%   17: 11 12 13 16  * 18 21 22 23
%   18: 13 14 15 17  * 19 21 22 23
%   19: 13 14 15 18  * 20 23 24 25
%   20: 15 19  * 23 24 25
%   21: 11 12 13 16 17 18  * 22 23
%   22: 13 17 18 21  * 23
%   23: 13 14 15 17 18 19 20 21 22  * 24 25
%   24: 15 19 20 23  * 25
%   25: 15 19 20 23 24  *
%
%    Below, we list the number of adjancencies to lower-indexed nodes, to
%    the node itself, to higher-indexed nodes, the total number of
%    adjacencies for this node, and the location of the first and last
%    entries required to list this set of adjacencies in a single list
%    of all the adjacencies.
%
%    N   Below  Self   Above   Total First  Last
%
%   --      --    --      --      --   ---     0
%    1:      0     1       5       6     1     6
%    2:      1     1       4       6     7    12
%    3:      2     1       9      12    13    24
%    4:      1     1       4       6    25    30
%    5:      2     1       6       9    31    39
%    6:      3     1       2       6    40    45
%    7:      4     1       4       9    46    54
%    8:      4     1       4       9    55    63
%    9:      4     1       4       9    62    72
%   10:      2     1       3       6    73    78
%   11:      6     1       5      12    79    90
%   12:      4     1       4       9    91    99
%   13:      9     1       9      19   100   118
%   14:      4     1       4       9   119   127
%   15:      5     1       6      12   128   139
%   16:      3     1       2       6   140   145
%   17:      4     1       4       9   146   154
%   18:      4     1       4       9   155   163
%   19:      4     1       4       9   164   172
%   20:      2     1       3       6   173   178
%   21:      6     1       2       9   179   187
%   22:      4     1       1       6   188   193
%   23:      9     1       2      12   194   205
%   24:      4     1       1       6   206   211
%   25:      5     1       0       6   212   217
%   --      --    --      --      --   218   ---
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRI_NUM), lists the nodes that
%    make up each triangle.  The first three nodes are the vertices,
%    in counterclockwise order.  The fourth value is the midside
%    node between nodes 1 and 2; the fifth and sixth values are
%    the other midside nodes in the logical order.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRI_NUM), for each side of
%    a triangle, lists the neighboring triangle, or -1 if there is
%    no neighbor.
%
%    Output, integer ADJ_NUM, the number of adjacencies.
%
%    Output, integer ADJ_COL(NODE_NUM+1).  Information about column J is stored
%    in entries ADJ_COL(J) through ADJ_COL(J+1)-1 of ADJ.
%
  triangle_order = 6;
  adj_num = 0;
%
%  Set every node to be adjacent to itself.
%
  adj_col(1:node_num) = 1;
%
%  Examine each triangle.
%
  for triangle = 1 : tri_num

    n1 = triangle_node(1,triangle);
    n2 = triangle_node(2,triangle);
    n3 = triangle_node(3,triangle);
    n4 = triangle_node(4,triangle);
    n5 = triangle_node(5,triangle);
    n6 = triangle_node(6,triangle);
%
%  For sure, we add the adjacencies:
%    43 / (34)
%    51 / (15)
%    54 / (45)
%    62 / (26)
%    64 / (46)
%    65 / (56)
%
    adj_col(n3) = adj_col(n3) + 1;
    adj_col(n4) = adj_col(n4) + 1;
    adj_col(n1) = adj_col(n1) + 1;
    adj_col(n5) = adj_col(n5) + 1;
    adj_col(n4) = adj_col(n4) + 1;
    adj_col(n5) = adj_col(n5) + 1;
    adj_col(n2) = adj_col(n2) + 1;
    adj_col(n6) = adj_col(n6) + 1;
    adj_col(n4) = adj_col(n4) + 1;
    adj_col(n6) = adj_col(n6) + 1;
    adj_col(n5) = adj_col(n5) + 1;
    adj_col(n6) = adj_col(n6) + 1;
%
%  Add edges (1,2), (1,4), (2,4) if this is the first occurrence,
%  that is, if the edge (1,4,2) is on a boundary (TRIANGLE2 <= 0)
%  or if this triangle is the first of the pair in which the edge
%  occurs (TRIANGLE < TRIANGLE2).
%
%  Maybe add
%    21 / 12
%    41 / 14
%    42 / 24
%
    triangle2 = triangle_neighbor(1,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n4) = adj_col(n4) + 1;
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n4) = adj_col(n4) + 1;
    end
%
%  Maybe add
%    32 / 23
%    52 / 25
%    53 / 35
%
    triangle2 = triangle_neighbor(2,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n3) = adj_col(n3) + 1;
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n5) = adj_col(n5) + 1;
      adj_col(n3) = adj_col(n3) + 1;
      adj_col(n5) = adj_col(n5) + 1;
    end
%
%  Maybe add
%    31 / 13
%    61 / 16
%    63 / 36
%
    triangle2 = triangle_neighbor(3,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n3) = adj_col(n3) + 1;
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n6) = adj_col(n6) + 1;
      adj_col(n3) = adj_col(n3) + 1;
      adj_col(n6) = adj_col(n6) + 1;
    end

  end
%
%  We used ADJ_COL to count the number of entries in each column.
%  Convert it to pointers into the ADJ array.
%
  adj_col(2:node_num+1) = adj_col(1:node_num);

  adj_col(1) = 1;
  for i = 2 : node_num+1
    adj_col(i) = adj_col(i-1) + adj_col(i);
  end

  adj_num = adj_col(node_num+1) - 1;

  return
end
function node_boundary = triangulation_order6_boundary_node ( node_num, ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_BOUNDARY_NODE indicates which nodes are on the boundary.
%
%  Discussion:
%
%    This routine is given an order 6 triangulation, an abstract list of sets
%    of six nodes.  The vertices are listed clockwise, then the
%    midside nodes.
%
%    It is assumed that each edge of the triangulation is either
%    * an INTERIOR edge, which is listed twice, once with positive
%      orientation and once with negative orientation, or;
%    * a BOUNDARY edge, which will occur only once.
%
%    This routine should work even if the region has holes - as long
%    as the boundary of the hole comprises more than 3 edges!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), the nodes that make up the
%    triangles.
%
%    Output, logical NODE_BOUNDARY(NODE_NUM), is TRUE if the node
%    is on a boundary edge.
%
  m = 3;
  n = 3 * triangle_num;
%
%  Set up the edge array.  The midside node is listed last, as
%  it is not needed for the sorting process.
%
  edge(1,               1:  triangle_num) = triangle_node(1,1:triangle_num);
  edge(2,               1:  triangle_num) = triangle_node(4,1:triangle_num);
  edge(3,               1:  triangle_num) = triangle_node(2,1:triangle_num);

  edge(1,  triangle_num+1:2*triangle_num) = triangle_node(2,1:triangle_num);
  edge(2,  triangle_num+1:2*triangle_num) = triangle_node(5,1:triangle_num);
  edge(3,  triangle_num+1:2*triangle_num) = triangle_node(3,1:triangle_num);

  edge(1,2*triangle_num+1:3*triangle_num) = triangle_node(3,1:triangle_num);
  edge(2,2*triangle_num+1:3*triangle_num) = triangle_node(6,1:triangle_num);
  edge(3,2*triangle_num+1:3*triangle_num) = triangle_node(1,1:triangle_num);
%
%  In each column, force the smaller of the two vertices to appear first.
%
  e1(1:n) = min ( edge(1:2:3,1:n) );
  e2(1:n) = max ( edge(1:2:3,1:n) );

  edge(1,1:n) = e1(1:n);
  edge(3,1:n) = e2(1:n);
%
%  Ascending sort the column array.
%
  edge = i4col_sort_a ( m, n, edge );
%
%  Records which appear twice are internal edges and can be ignored.
%
  node_boundary(1:node_num) = 0;

  i = 0;

  while ( i < 3 * triangle_num )

    i = i + 1;

    if ( i == 3 * triangle_num )
      node_boundary(edge(1:m,i)) = 1;
    elseif ( all ( edge(1:m,i) == edge(1:m,i+1) ) )
      i = i + 1;
    else
      node_boundary(edge(1:m,i)) = 1;
    end

  end

  return
end
function triangulation_order6_plot ( file_name, node_num, node_xy, ...
  triangle_num, triangle_node, node_show, triangle_show )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_PLOT plots a 6-node triangulation of a pointset.
%
%  Discussion:
%
%    The triangulation is most usually a Delaunay triangulation,
%    but this is not necessary.
%
%    In a six node triangulation, it is assumed that nodes 1, 2, and 3
%    are the vertices of the triangles, and that nodes 4, 5, and 6
%    lie between 1 and 2, 2 and 3, and 3 and 1 respectively.
%
%    This routine has been specialized to deal correctly ONLY with
%    a mesh of 6 node elements, with the property that starting
%    from local node 1 and traversing the edges of the element will
%    result in encountering local nodes 1, 4, 2, 5, 3, 6 in that order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME(*), the name of the output file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), lists, for each triangle,
%    the indices of the points that form the vertices and midsides
%    of the triangle.
%
%    Input, logical NODE_SHOW:
%    0, do not show the nodes.
%    1, show the nodes.
%    2, show the nodes, and label them.
%
%    Input, logical TRIANGLE_SHOW,
%    0, do not show the trangles.
%    1, show the triangles.
%    2, show the triangles, and label them.
%
  order = [ 1, 4, 2, 5, 3, 6 ];
  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;
%
%  We need to do some figuring here, so that we can determine
%  the range of the data, and hence the height and width
%  of the piece of paper.
%
  x_max = max ( node_xy(1,1:node_num) );
  x_min = min ( node_xy(1,1:node_num) );
  x_scale = x_max - x_min;

  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

  y_max = max ( node_xy(2,1:node_num) );
  y_min = min ( node_xy(2,1:node_num) );
  y_scale = y_max - y_min;

  y_max = y_max + 0.05 * y_scale;
  y_min = y_min - 0.05 * y_scale;
  y_scale = y_max - y_min;

  if ( x_scale < y_scale )

    delta = round ( ( x_ps_max - x_ps_min ) ...
      * ( y_scale - x_scale ) / ( 2.0 * y_scale ) );

    x_ps_max = x_ps_max - delta;
    x_ps_min = x_ps_min + delta;

    x_ps_max_clip = x_ps_max_clip - delta;
    x_ps_min_clip = x_ps_min_clip + delta;

    x_scale = y_scale;

  elseif ( y_scale < x_scale )

    delta = round ( ( y_ps_max - y_ps_min ) ...
      * ( x_scale - y_scale ) / ( 2.0 * x_scale ) );

    y_ps_max      = y_ps_max - delta;
    y_ps_min      = y_ps_min + delta;

    y_ps_max_clip = y_ps_max_clip - delta;
    y_ps_min_clip = y_ps_min_clip + delta;

    y_scale = x_scale;

  end
%
%  Plot the triangulation.
%
  file_unit = fopen ( file_name, 'wt' );

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER6_PLOT - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'TRIANGULATION_ORDER6_PLOT - Fatal error!' );
  end

  fprintf ( file_unit, '%%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%%%Creator: triangulation_order6_plot.m\n' );
  fprintf ( file_unit, '%%%%Title: %s\n', file_name );
  fprintf ( file_unit, '%%%%Pages: 1\n' );
  fprintf ( file_unit, '%%%%BoundingBox:  %d  %d  %d  %d\n', ...
    x_ps_min, y_ps_min, x_ps_max, y_ps_max );
  fprintf ( file_unit, '%%%%Document-Fonts: Times-Roman\n' );
  fprintf ( file_unit, '%%%%LanguageLevel: 1\n' );
  fprintf ( file_unit, '%%%%EndComments\n' );
  fprintf ( file_unit, '%%%%BeginProlog\n' );
  fprintf ( file_unit, '/inch {72 mul} def\n' );
  fprintf ( file_unit, '%%%%EndProlog\n' );
  fprintf ( file_unit, '%%%%Page: 1 1\n' );
  fprintf ( file_unit, 'save\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to very light gray.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.900  0.900  0.900 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Draw a gray border around the page.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'newpath\n' );
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, 'stroke\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to black.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.000  0.000  0.000 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the font and its size.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '/Times-Roman findfont\n' );
  fprintf ( file_unit, '0.50 inch scalefont\n' );
  fprintf ( file_unit, 'setfont\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Print a title.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%210  702  moveto\n' );
  fprintf ( file_unit, '%%(Triangulation)  show\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Define a clipping polygon.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'newpath\n' );
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, 'clip newpath\n' );
%
%  Draw the nodes.
%
  if ( node_num <= 200 )
    circle_size = 5;
  elseif ( node_num <= 500 )
    circle_size = 4;
  elseif ( node_num <= 1000 )
    circle_size = 3;
  elseif ( node_num <= 5000 )
    circle_size = 2;
  else
    circle_size = 1;
  end

  if ( 1 <= node_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Draw filled dots at the nodes.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to blue.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.000  0.150  0.750 setrgbcolor\n' );
    fprintf ( file_unit, '%%\n' );

    for node = 1 : node_num

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
        + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, ...
        '  newpath  %d  %d  %d 0 360 arc closepath fill\n', ...
        x_ps, y_ps, circle_size );

    end

  end
%
%  Label the nodes.
%
  if ( 2 <= node_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the nodes.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker blue.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.000  0.250  0.850 setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.20 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );
    fprintf ( file_unit, '%%\n' );

    for node = 1 : node_num

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
        + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        x_ps, y_ps+5, node );

    end

  end
%
%  Draw the triangles.
%
  if ( 1 <= triangle_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.900  0.200  0.100 setrgbcolor\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%  Draw the triangles.\n' );
    fprintf ( file_unit, '%%\n' );

    for  triangle = 1 : triangle_num

      fprintf ( file_unit, 'newpath\n' );

      node = triangle_node(order(1),triangle);

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
        + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, '%d  %d  moveto\n', x_ps, y_ps );

      for i = 1 : 6

        ip1 = mod ( i, 6 ) + 1;
        node = triangle_node(order(ip1),triangle);

        x_ps = floor ( ...
          ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
          + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
          / ( x_max                   - x_min ) );

        y_ps = floor ( ...
          ( ( y_max - node_xy(2,node)         ) * y_ps_min ...
          + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
          / ( y_max                   - y_min ) );

        fprintf ( file_unit, '%d  %d  lineto\n', x_ps, y_ps );

      end

      fprintf ( file_unit, 'stroke\n' );

    end

  end
%
%  Label the triangles.
%
  if ( 2 <= triangle_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the triangles:\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker red:\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, ' 0.950  0.250  0.150  setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.30 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );

    for triangle = 1 : triangle_num

      ave_x = 0.0;
      ave_y = 0.0;

      for i = 1 : 6
        node = triangle_node(i,triangle);
        ave_x = ave_x + node_xy(1,node);
        ave_y = ave_y + node_xy(2,node);
      end

      ave_x = ave_x / 6.0;
      ave_y = ave_y / 6.0;

      x_ps = floor ( ...
        ( ( x_max - ave_x         ) * x_ps_min ...
        + (         ave_x - x_min ) * x_ps_max ) ...
        / ( x_max         - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - ave_y         ) * y_ps_min ...
        + (         ave_y - y_min ) * y_ps_max ) ...
        / ( y_max         - y_min ) );

      fprintf ( file_unit, '%d  %d  moveto\n', x_ps, y_ps );
      fprintf ( file_unit, '(%d) show\n', triangle );

    end

  end

  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'restore showpage\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%% End of page\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%%%Trailer\n' );
  fprintf ( file_unit, '%%%%EOF\n' );

  fclose ( file_unit );

  return
end
