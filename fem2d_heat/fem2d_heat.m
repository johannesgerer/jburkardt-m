function fem2d_heat ( prefix )

%*****************************************************************************80
%
%% MAIN is the main routine of FEM2D_HEAT.
%
%  Discussion:
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
%      k = k_coef ( node_num, node_xy, time )
%
%    The user specifies the right hand side
%    by supplying a routine of the form
%
%     f = rhs ( node_num, node_xy, time )
%
%    The user specifies the right hand side of the Dirichlet boundary
%    conditions by supplying a function
%
%      u = dirichlet_condition ( node_num, node_xy, time )
%
%    The user specifies the initial condition by supplying a function
%
%      u = initial_condition ( node_num, node_xy, time )
%
%  Usage:
%
%    fem2d_heat ( 'prefix' )
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
%    07 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, real A(3*IB+1,NODE_NUM), the coefficient matrix.
%
%    Local, integer DIM_NUM, the spatial dimension, which is 2.
%
%    Local, string ELEMENT_FILENAME, the name of the
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
%    Local, integer IB, the half-bandwidth of the matrix.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, logical NODE_BOUNDARY(NODE_NUM), is TRUE if a given
%    node is on the boundary.
%
%    Local, integer NODE_CONDITION(NODE_NUM), indicates the type of
%    boundary condition being applied to nodes on the boundary.
%
%    Local, string NODE_FILENAME, the name of the
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
  quad_num = 7;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_HEAT\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution of the time dependent heat equation\n' );
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
    fprintf ( 1, 'FEM2D_HEAT - Fatal error!\n' );
    fprintf ( 1, '  The input triangulation has order %d.\n', element_order );
    fprintf ( 1, '  However, a triangulation of order 6 is required.' );
    error ( 'FEM2D_HEAT - Fatal error!' );
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

  if ( 0 )
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
%  Determine the bandwidth of the coefficient matrix.
%
  ib = bandwidth ( element_order, element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix half bandwidth is %d\n', ib );
  fprintf ( 1, '  The matrix bandwidth is      %d\n', 2 * ib + 1 );
  fprintf ( 1, '  The storage bandwidth is     %d\n', 3 * ib + 1 );
%
%  Set time stepping quantities.
%
  time_init = 0.0;
  time_final = 0.5;
  time_step_num = 10;
  time_step_size = ( time_final - time_init ) / time_step_num;

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
  u(1:node_num) = u_exact(1:node_num);

  time_unit = fopen ( time_filename, 'wt');
  fprintf ( time_unit, '%14f\n', time );

  r8mat_write ( solution_filename, 1, node_num, u );
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
  [ a, f ] = assemble_heat ( node_num, node_xy, node_condition, ...
    element_order, element_num, element_node, quad_num, ib, time );

  if ( debug )
    dgb_print_some ( node_num, node_num, ib, ib, a, 10, 10, 12, 14, ...
      '  Initial block of matrix A:' );

    r8vec_print_some ( node_num, f, 10, 12, '  Part of right hand side F:' );
  end
%
%  Adjust the linear system for the dU/dT term, which we are treating
%  using the backward Euler formula.
%
    [ a, f ] = assemble_backward_euler ( node_num, node_xy, element_order, ...
      element_num, element_node, quad_num, ib, time, time_step_size, ...
      u_old, a, f );

    if ( debug )

      dgb_print_some ( node_num, node_num, ib, ib, a, 10, 10, 12, 14, ...
        '  A after DT adjustment:' );

      r8vec_print_some ( node_num, f, 10, 12, ...
        '  F after DT adjustment:' );

    end
%
%  Adjust the linear system to account for boundary conditions.
%
    [ a, f ] = assemble_boundary ( node_num, node_xy, node_condition, ib, ...
      time, a, f );

    if ( debug )

      dgb_print_some ( node_num, node_num, ib, ib, a, 10, 10, 12, 14, ...
        '  A after BC adjustment:' );

      r8vec_print_some ( node_num, f, 10, 12, ...
        '  F after BC adjustment:' );

    end
%
%  Solve the linear system using a banded solver.
%
    [ a, pivot, ierr] = dgb_fa ( node_num, ib, ib, a );

    if ( ierr ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FEM2D_HEAT - Fatal error!\n' );
      fprintf ( 1, '  DGB_FA returned an error condition.\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The linear system was not factored, and the\n' );
      fprintf ( 1, '  algorithm cannot proceed.\n' );
      error ( 'FEM2D_HEAT - Fatal error!' );
    end

    job = 0;

    u = dgb_sl ( node_num, ib, ib, a, pivot, f, job );

    if ( debug )
      r8vec_print_some ( node_num, u, 1, 10, ...
        '  Part of the solution vector:' );
    end
%
%  Increment the file name, and write the new solution.
%
    fprintf ( time_unit, '%14f\n', time );

    solution_filename = file_name_inc ( solution_filename );

    r8mat_write ( solution_filename, 1, node_num, u );

  end

  fclose ( time_unit );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_HEAT:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, f ] = assemble_backward_euler ( node_num, node_xy, ...
  element_order, element_num, element_node, quad_num, ib, time, ...
  time_step_size, u_old, a, f )

%*****************************************************************************80
%
%% ASSEMBLE_BACKWARD_EULER adjusts the system for the backward Euler term.
%
%  Discussion:
%
%    The input linear system
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
%    22 July 2007
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
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Input, real TIME, the current time.
%
%    Input, real TIME_STEP_SIZE, the size of the time step.
%
%    Input, real U_OLD(NODE_NUM), the finite element
%    coefficients for the solution at the previous time.
%
%    Input, real A(3*IB+1,NODE_NUM), the NODE_NUM
%    by NODE_NUM coefficient matrix, stored in a compressed format.
%
%    Input, real F(NODE_NUM), the right hand side.
%
%    Output, real A(3*IB+1,NODE_NUM), the updated matrix.
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
%  Map the quadrature points QUAD_XY to points PHYS_XY in the physical triangle.
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

          a(node-j+2*ib+1,j) = a(node-j+2*ib+1,j) ...
            + w(quad) * bi * bj / time_step_size;

        end
      end

    end

  end

  return
end
function [ a, f ] = assemble_boundary ( node_num, node_xy, node_condition, ...
  ib, time, a, f )

%*****************************************************************************80
%
%% ASSEMBLE_BOUNDARY modifies the linear system for the boundary conditions.
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
%    08 January 2007
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
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Input, real TIME, the current time.
%
%    Input, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM coefficient
%    matrix, stored in a compressed format.
%
%    Input, real F(NODE_NUM), the right hand side.
%
%    Output, real A(3*IB+1,NODE_NUM), the matrix has been adjusted for
%    Dirichlet boundary conditions.
%
%    Output, real F(NODE_NUM), the right hand side has been adjusted for
%    Dirichlet boundary conditions.
%
  DIRICHLET = 2;

  bc_value = dirichlet_condition ( node_num, node_xy, time );

  for node = 1 : node_num

    if ( node_condition(node) == DIRICHLET )

      column_low = max ( node - ib, 1 );
      column_high = min ( node + ib, node_num );

      for column = column_low : column_high
        a(node-column+2*ib+1,column) = 0.0;
      end
      a(2*ib+1,node) = 1.0;

      f(node) = bc_value(node);

    end

  end

  return
end
function [ a, f ] = assemble_fem ( node_num, node_xy, node_condition, ...
  element_order, element_num, element_node, quad_num, ib, time )

%*****************************************************************************80
%
%% ASSEMBLE_FEM assembles the finite element system for the heat equation.
%
%  Discussion:
%
%    The matrix is known to be banded.  A special matrix storage format
%    is used to reduce the space required.  Details of this format are
%    discussed in the routine DGB_FA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2006
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
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Output, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format.
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

%
%  Initialize the arrays to zero.
%
  f(1:node_num) = 0.0;
  a(1:3*ib+1,1:node_num) = 0.0;
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
%
%  Consider the QUAD-th quadrature point.
%
    for quad = 1 : quad_num

      k_value = k_coef ( 1, xy(1,quad), xy(2,quad), time );

      rhs_value = rhs  ( 1, xy(1,quad), xy(2,quad), time );
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%  But if a node is associated with a boundary condition, we do nothing.
%
      for test = 1 : element_order

        i = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t6 ( t6, test, xy(1:2,quad) );

        f(i) = f(i) + w(quad) * rhs_value * bi;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for basis = 1 : element_order

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t6 ( t6, basis, xy(1:2,quad) );

          a(i-j+2*ib+1,j) = a(i-j+2*ib+1,j) ...
            + w(quad) * ( dbidx * dbjdx + dbidy * dbjdy + k_value * bj * bi );

        end

      end

    end

  end

  return
end
function [ a, f ] = assemble_heat ( node_num, node_xy, node_condition, ...
  element_order, element_num, element_node, quad_num, ib, time )

%*****************************************************************************80
%
%% ASSEMBLE_HEAT assembles the finite element system for the heat equation.
%
%  Discussion:
%
%    The matrix is known to be banded.  A special matrix storage format
%    is used to reduce the space required.  Details of this format are
%    discussed in the routine DGB_FA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2007
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
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Input, real TIME, the current time.
%
%    Output, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format.
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

%
%  Initialize the arrays to zero.
%
  f(1:node_num) = 0.0;
  a(1:3*ib+1,1:node_num) = 0.0;
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
%  Map the quadrature points QUAD_XY to points PHYS_XY in the physical triangle.
%
    phys_xy(1:2,1:quad_num) = reference_to_physical_t3 ( t3, quad_num, quad_xy );

    area = abs ( triangle_area_2d ( t3 ) );

    w(1:quad_num) = area * quad_w(1:quad_num);
%
%  Consider the QUAD-th quadrature point.
%
    for quad = 1 : quad_num

      k_value = k_coef ( 1, phys_xy(1:2,quad), time );

      rhs_value = rhs  ( 1, phys_xy(1:2,quad), time );
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%  But if a node is associated with a boundary condition, we do nothing.
%
      for test = 1 : element_order

        i = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t6 ( t6, test, phys_xy(1:2,quad) );

        f(i) = f(i) + w(quad) * rhs_value * bi;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for basis = 1 : element_order

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t6 ( t6, basis, phys_xy(1:2,quad) );

          a(i-j+2*ib+1,j) = a(i-j+2*ib+1,j) ...
            + w(quad) * ( dbidx * dbjdx + dbidy * dbjdy + k_value * bj * bi );

        end

      end

    end

  end

  return
end
function nhba = bandwidth ( element_order, element_num, element_node )

%*****************************************************************************80
%
%% BANDWIDTH determines the bandwidth of the coefficient matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Output, integer NHBA, the half bandwidth of the matrix.
%
  nhba = 0;

  for element = 1 : element_num
    for local_i = 1 : element_order
      global_i = element_node(local_i,element);
      for local_j = 1 : element_order
        global_j = element_node(local_j,element);
        nhba = max ( nhba, abs ( global_j - global_i ) );
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
function [ alu, pivot, info ] = dgb_fa ( n, ml, mu, a )

%*****************************************************************************80
%
%% DGB_FA performs a LINPACK-style PLU factorization of a DGB matrix.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "DGB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%    The following program segment will set up the input.
%
%      m = ml + mu + 1
%      do j = 1, n
%        i1 = max ( 1, j-mu )
%        i2 = min ( n, j+ml )
%        do i = i1, i2
%          k = i - j + m
%          a(k,j) = afull(i,j)
%        end do
%      end do
%
%    This uses rows ML+1 through 2*ML+MU+1 of the array A.
%    In addition, the first ML rows in the array are used for
%    elements generated during the triangularization.
%    The total number of rows needed in A is 2*ML+MU+1.
%    The ML+MU by ML+MU upper left triangle and the
%    ML by ML lower right triangle are not referenced.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2003
%
%  Author:
%
%    Original FORTRAN77 version by Dongarra, Bunch, Moler, Stewart.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(2*ML+MU+1,N), the matrix in band storage.  The
%    columns of the matrix are stored in the columns of the array,
%    and the diagonals of the matrix are stored in rows ML+1 through
%    2*ML+MU+1.
%
%    Output, real ALU(2*ML+MU+1,N), the LU factors in band storage.
%    The L and U matrices are stored in a single array.
%
%    Output, integer PIVOT(N), the pivot vector.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  alu = a(1:2*ml+mu+1,1:n);

  m = ml + mu + 1;
  info = 0;
%
%  Zero out the initial fill-in columns.
%
  j0 = mu + 2;
  j1 = min ( n, m ) - 1;

  for jz = j0 : j1
    i0 = m + 1 - jz;
    alu(i0:ml,jz) = 0.0E+00;
  end

  jz = j1;
  ju = 0;

  for k = 1 : n - 1
%
%  Zero out the next fill-in column.
%
    jz = jz + 1;
    if ( jz <= n )
      alu(1:ml,jz) = 0.0E+00;
    end
%
%  Find L = pivot index.
%
    lm = min ( ml, n-k );

    l = m;

    for j = m+1 : m+lm
      if ( abs ( alu(l,k) ) < abs ( alu(j,k) ) )
        l = j;
      end
    end

    pivot(k) = l + k - m;
%
%  Zero pivot implies this column already triangularized.
%
    if ( alu(l,k) == 0.0E+00 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DGB_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return;
    end
%
%  Interchange if necessary.
%
    t = alu(l,k);
    alu(l,k) = alu(m,k);
    alu(m,k) = t;
%
%  Compute multipliers.
%
    alu(m+1:m+lm,k) = - alu(m+1:m+lm,k) / alu(m,k);
%
%  Row elimination with column indexing.
%
    ju = max ( ju, mu+pivot(k) );
    ju = min ( ju, n );
    mm = m;

    for j = k+1 : ju

      l = l - 1;
      mm = mm - 1;

      if ( l ~= mm )
        t = alu(l,j);
        alu(l,j) = alu(mm,j);
        alu(mm,j) = t;
      end

      alu(mm+1:mm+lm,j) = alu(mm+1:mm+lm,j) + alu(mm,j) * alu(m+1:m+lm,k);

    end

  end

  pivot(n) = n;

  if ( alu(m,n) == 0.0E+00 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DGB_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
  end

  return
end
function dgb_print_some ( m, n, ml, mu, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% DGB_PRINT_SOME prints some of a banded matrix.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "DGB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%    Only entries in rows ILO to IHI, columns JLO to JHI are considered.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1..
%
%    Input, real A(2*ML+MU+1,N), the M by N band matrix, stored in LINPACK
%    or LAPACK general band storage mode.
%
%    Input, integer ILO, JLO, IHI, JHI, designate the first row and
%    column, and the last row and column to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  incx = 5;
%
%  Print the columns of the matrix, in strips of 5.
%
  for j2lo = jlo : incx : jhi

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
    fprintf ( 1, '  ---\n' );
%
%  Determine the range of the rows in this strip.
%
    i2lo = max ( ilo, 1 );
    i2lo = max ( i2lo, j2lo - mu - ml );

    i2hi = min ( ihi, m );
    i2hi = min ( i2hi, j2hi + ml );

    for i = i2lo : i2hi
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      fprintf ( 1, '%6i  ', i );
      for j = j2lo: j2hi

        if ( i < j - mu - ml | j + ml < i )
          fprintf ( 1, '              ' );
        else
          fprintf ( 1, '%14f', a(i-j+ml+mu+1,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
function x = dgb_sl ( n, ml, mu, a_lu, pivot, b, job )

%*****************************************************************************80
%
%% DGB_SL solves a system factored by DGB_FA.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "DGB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    Original FORTRAN77 version by Dongarra, Bunch, Moler, Stewart.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(2*ML+MU+1,N), the LU factors from DGB_FA.
%
%    Input, integer PIVOT(N), the pivot vector from DGB_FA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X(N), the solution.
%
  x(1:n) = b(1:n);

  m = mu + ml + 1;
%
%  Solve A * x = b.
%
  if ( job == 0 )
%
%  Solve L * Y = B.
%
    if ( 1 <= ml )

      for k = 1 : n-1

        lm = min ( ml, n-k );
        l = pivot(k);

        if ( l ~= k )
          t = x(l);
          x(l) = x(k);
          x(k) = t;
        end

        for i = 1 : lm
          x(k+i) = x(k+i) + x(k) * a_lu(m+i,k);
        end

      end
    end
%
%  Solve U * X = Y.
%
    for k = n : -1 : 1

      x(k) = x(k) / a_lu(m,k);
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;

      for i = 0: lm-1
        x(lb+i) = x(lb+i) - x(k) * a_lu(la+i,k);
      end

    end
%
%  Solve A' * X = B.
%
  else
%
%  Solve U' * Y = B.
%
    for k = 1 : n
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      for i = 0 : lm - 1
        x(k) = x(k) - a_lu(la+i,k) * x(lb+i);
      end
      x(k) = x(k) / a_lu(m,k);
    end
%
%  Solve L' * X = Y.
%
    if ( 1 <= ml )

      for k = n-1: -1 : 1

        lm = min ( ml, n-k );
        for i = 1 : lm
          x(k) = x(k) + a_lu(m+i,k) * x(k+i);
        end
        l = pivot(k);

        if ( l ~= k )
          t = x(l);
          x(l) = x(k);
          x(k) = t;
        end

      end

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
%    Output, string FILE_NAME_NEW, the incremented string.
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
%% I4COL_COMPARE compares columns I and J of an I4COL.
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
%% I4COL_SWAP swaps columns I and J of an I4COL.
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
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    value = ( a(i) ~= 0 );
    fprintf ( 1, '%6d  %1d\n', i, value );
  end

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
%    Input, string TITLE, a title.
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
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
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
