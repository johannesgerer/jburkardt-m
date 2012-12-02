function fem2d_stokes_sparse ( prefix )

%*****************************************************************************80
%
%% MAIN is the main routine of FEM2D_STOKES_SPARSE.
%
%  Discussion:
%
%    This program is a variant of FEM2D_STOKES.  That program is
%    particularly limited because of its use of banded matrix storage and
%    solving routines.
%
%    This program discards the banded approach.  Instead, it uses MATLAB's
%    sparse matrix storage, factorization and solution facilities,
%    which allow this program to solve larger problems faster.
%
%    Only three routines needed to be changed:
%    * the main program FEM2D_STOKES is replaced by FEM2D_STOKES_SPARSE.
%    * the routine ASSEMBLE_STOKES is replaced by ASSEMBLE_STOKES_SPARSE.
%    * the routine DIRICHLET_APPLY is replaced by
%      DIRICHLET_APPLY_SPARSE.
%
%    This also means that the following routines are NOT needed:
%    * BANDWIDTH
%    * DGB_FA
%    * DGB_SL.
%    * DGB_PRINT_SOME.
%
%
%    This program solves the steady incompressible Stokes equations
%    for velocity vector V and scalar pressure P:
%
%      - nu * Laplacian W(X,Y) + Grad P(X,Y) = F(X,Y)
%
%                                 Div W(X,Y) = G(X,Y)
%
%    in an arbitrary triangulated region in the plane.
%
%    Let U and V denote the scalar components of the velocity vector W.
%
%    Along the boundary of the region, the user controls the type of
%    boundary condition to be imposed, if any.  Currently, these
%    conditions may be of Dirichlet form:
%
%      U(X,Y) = U_BC(X,Y)
%      V(X,Y) = V_BC(X,Y)
%      P(X,Y) = P_BC(X,Y)
%
%    or Neumann form with ZERO right hand side:
%
%      dU/dn(X,Y) = 0
%      dV/dn(X,Y) = 0
%      dP/dn(X,Y) = 0
%
%    The code uses the finite element method.  The Taylor-Hood element
%    is used, in which a single reference triangle is used to define
%    both a piecewise quadratic representation of velocity, and a piecewise
%    linear representation of pressure.
%
%  Geometry specification:
%
%    The user defines the geometry by supplying two data files
%    which list the node coordinates, and list the nodes that make up
%    each element.
%
%  Equation specification:
%
%    The user specifies
%
%    * the kinematic viscosity NU;
%
%      function nu = constants ( 'DUMMY' )
%
%    * the right hand side of the Stokes equations:
%
%      function [ u_rhs, v_rhs, p_rhs ] = rhs ( node_num, node_xy )
%
%    * the type of boundary conditions imposed:
%
%      [ node_u_condition, node_v_condition, node_p_condition ] =
%        boundary_type ( node_num, node_xy, node_boundary, node_type,
%        node_u_condition, node_v_condition, node_p_condition )
%
%    * the right hand side of any Dirichlet boundary conditions:
%
%      function [ u_bc, v_bc, p_bc ] = dirichlet_condition ( node_num, node_xy )
%
%    * the right hand side of any Neumann boundary conditions:
%      (currently, nonzero values will be ignored)
%
%      function [ u_bc, v_bc, p_bc ] = neumann_condition ( node_num, node_xy )
%
%  Usage:
%
%    fem2d_stokes_sparse ( 'prefix' )
%
%    where:
%
%    'prefix' is the common prefix for the node and element files:
%
%    * prefix_nodes.txt,     the node coordinates.
%    * prefix_elements.txt,  the nodes that make up each element.
%
%    Graphics files created include:
%
%    * "nodes6.eps", an image of the nodes;
%    * "triangles6.eps", an image of the elements;
%
%    Data files created include:
%
%    * "nodes3.txt", the nodes associated with pressure;
%    * "triangles3.txt", the linear triangles associated with pressure;
%    * "pressure3.txt", the pressure at the pressure nodes;
%    * "velocity6.txt", the velocity at the velocity nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.  If
%    this argument is not supplied, it will be requested.
%
%    Input, string ELEMENT_FILE_NAME, the name of the element file.  If
%    this argument is not supplied, it will be requested.
%
%  Local parameters:
%
%    Local, real sparse A, the finite element coefficient matrix, in
%    MATLAB's sparse matrix storage.
%
%    Local, integer ELEMENT_NODE(6,ELEMENT_NUM), the nodes that form each
%    element.  Nodes 1, 2, and 3 are the vertices.  Node 4 is between 1
%    and 2, and so on.
%
%    Local, integer ELEMENT_NUM, the number of elements.
%
%    Local, integer ELEMENT_ORDER, the element order.
%
%    Local, real F(VARIABLE_NUM), the finite element right hand side.
%
%    Local, logical NODE_BOUNDARY(NODE_NUM), is TRUE if the node is
%    found to lie on the boundary of the region.
%
%    Local, real NODE_C(NODE_NUM), the finite element coefficients.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, integer NODE_P_CONDITION(NODE_NUM),
%    indicates the condition used to determine pressure at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Local, integer NODE_P_VARIABLE(NODE_NUM), the index of the pressure
%    variable associated with a node, or -1 if there is none.
%
%    Local, integer NODE_TYPE(NODE_NUM), determines if the node is a
%    vertex or midside node.
%    1, the node is a vertex (P, U, V variables are associated with it).
%    2, the node is a midside node (only U and V variables are associated.)
%
%    Local, integer NODE_U_CONDITION(NODE_NUM),
%    indicates the condition used to determine horizontal velocity at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Local, integer NODE_U_VARIABLE(NODE_NUM), the index of the horizontal
%    velocity variable associated with a node, or -1 if there is none.
%
%    Local, integer NODE_V_CONDITION(NODE_NUM),
%    indicates the condition used to determine vertical velocity at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Local, integer NODE_V_VARIABLE(NODE_NUM), the index of the vertical
%    velocity variable associated with a node, or -1 if there is none.
%
%    Local, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Local, integer NODE3_NUM, the number of order 3 nodes.
%
%    Local, integer NODE3_LABEL(NODE_NUM), contains the renumbered
%    label of order3 nodes, and -1 for nodes that are not order3 nodes.
%
%    Local, real NU, the kinematic viscosity.
%
%    Local, integer NZ_NUM, the maximum number of nonzero entries that
%    might occur in the matrix.  This is only needed so that MATLAB can
%    efficiently allocate space for the matrix.
%
%    Local, integer QUAD_NUM, the number of quadrature points used for
%    assembly.  This is currently set to 3, the lowest reasonable value.
%    Legal values are 1, 3, 4, 6, 7, 9, 13, and for some problems, a value
%    of QUAD_NUM greater than 3 may be appropriate.
%
%    Local, integer VARIABLE_NUM, the number of unknowns.
%
  debugging = 1;
  quad_num = 7;

  nu = constants ( );

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_STOKES_SPARSE:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A version of FREE_FEM_STOKES using MATLAB''s \n' );
  fprintf ( 1, '  sparse matrix storage, factor and solve facilities.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Finite element solution of the \n' );
  fprintf ( 1, '  steady incompressible Stokes equations\n' );
  fprintf ( 1, '  on a triangulated region in 2 dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  - nu * ( Uxx + Uyy ) + dPdx = F1(x,y)\n' );
  fprintf ( 1, '  - nu * ( Vxx + Vyy ) + dPdy = F2(x,y)\n' );
  fprintf ( 1, '                      Ux + Vy = F3(x,y).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Boundary conditions may be of Dirichlet type:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    U(x,y) = U_BC(x,y)\n' );
  fprintf ( 1, '    V(x,y) = V_BC(x,y)\n' );
  fprintf ( 1, '    P(x,y) = P_BC(x,y)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  or of Neumann type with zero right hand side:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    dU/dn(x,y) = 0\n' );
  fprintf ( 1, '    dV/dn(x,y) = 0\n' );
  fprintf ( 1, '    dP/dn(x,y) = 0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The finite element method uses Taylor-Hood\n' );
  fprintf ( 1, '  triangular elements which are linear for pressure\n' );
  fprintf ( 1, '  and quadratic for velocity.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature order =       %d\n', quad_num );
  fprintf ( 1, '  Kinematic viscosity NU = %f\n', nu );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current status:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * testing zero Neumann condition option.\n' );
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

  if ( debugging )

    r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, 2, 10, ...
      '  First 10 nodes' );

  end
%
%  Read the element file.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order =            %d\n', element_order );
  fprintf ( 1, '  Number of elements =       %d\n', element_num );

  if ( element_order ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_STOKES_SPARSE - Fatal error!\n' );
    fprintf ( 1, '  The input triangulation has order %d.\n', element_order );
    fprintf ( 1, '  However, a triangulation of order 6 is required.' );
    error ( 'FEM2D_STOKES_SPARSE - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  if ( debugging )

    i4mat_transpose_print_some ( 6, element_num, ...
      element_node, 1, 1, 6, 10, '  First 10 elements' );

  end
%
%  Determine the "type" of each node.
%  A vertex node, of type 1, has U, V, and P variables.
%  A midside node, of type 2, has U and V only.
%
  node_type(1:node_num) = 1;

  for element = 1 : element_num
    for j = 4 : 6
      node = element_node(j,element);
      node_type(node) = 2;
    end
  end
%
%  Determine which nodes are boundary nodes.
%
  node_boundary = triangulation_order6_boundary_node ( node_num, ...
    element_num, element_node );

  if ( 0 )
    lvec_print ( node_num, node_boundary, '    Node  Boundary?' );
  end
%
%  Determine the node conditions:
%
%  All conditions begin as finite element conditions.
%
  node_p_condition(1:node_num) = 1;
  node_u_condition(1:node_num) = 1;
  node_v_condition(1:node_num) = 1;
%
%  Conditions on velocities associated with a boundary node are Dirichlet
%  conditions.
%
  for node = 1 : node_num
    if ( node_boundary(node) )
      node_u_condition(node) = 2;
      node_v_condition(node) = 2;
    end
  end
%
%  Midside nodes have no associated pressure variable.
%
  for node = 1 : node_num
    if ( node_type(node) == 2 )
      node_p_condition(node) = 0;
    end
  end
%
%  Replace a single finite element pressure condition by a Dirichlet
%  condition.
%
  p_node = -1;
  for node = 1 : node_num
    if ( node_p_condition(node) == 1 )
      node_p_condition(node) = 2;
      p_node = node;
      break
    end
  end

  if ( p_node == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_STOKES_SPARSE - Fatal error!\n' );
    fprintf ( 1, '  Unable to find a finite element pressure condition\n' );
    fprintf ( 1, '  suitable for replacement by a Dirichlet condition.\n' );
    error ( 'FEM2D_STOKES_SPARSE - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dirichlet boundary condition on pressure\n' );
  fprintf ( 1, '  will be applied at node %d\n', p_node );
%
%  Allow the user to examine and modify the tentative boundary conditions.
%
  [ node_u_condition, node_v_condition, node_p_condition ] = ...
    boundary_type ( node_num, node_xy, node_boundary, node_type, ...
    node_u_condition, node_v_condition, node_p_condition );

  neumann_num = 0;

  for node = 1 : node_num

    if ( node_u_condition(node) == 3 )
      neumann_num = neumann_num + 1;
    end

    if ( node_v_condition(node) == 3 )
      neumann_num = neumann_num + 1;
    end

    if ( node_p_condition(node) == 3 )
      neumann_num = neumann_num + 1;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of Neumann conditions added = \n', neumann_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Boundary conditions per node:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Node    U_cond	V_cond    P_cond\n' );
  fprintf ( 1, '\n' );
  for node = 1 : node_num

    if ( node <= 10 || node_num - 10 <= node )
      fprintf ( 1, '  %8d  %8d  %8d  %8d\n', ...
        node, node_u_condition(node), node_v_condition(node), ...
        node_p_condition(node) );
    end

    if ( node == 10 )
      fprintf ( 1, '(SKIPPING ENTRIES)\n' );
    end

  end
%
%  Number the variables.
%
  variable_num = 0;

  for node = 1 : node_num

    variable_num = variable_num + 1;
    node_u_variable(node) = variable_num;

    variable_num = variable_num + 1;
    node_v_variable(node) = variable_num;

    if ( node_type(node) == 1 )
      variable_num = variable_num + 1;
      node_p_variable(node) = variable_num;
    else
      node_p_variable(node) = -1;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total number of variables is %d\n', variable_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variable indices per node:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node  U_index  V_index  P_index\n' );
  fprintf ( 1, '\n' );
  for node = 1 : node_num

    if ( node <= 10 || node_num - 10 <= node )
      fprintf ( 1, '  %6d  %6d  %6d  %6d\n', node, node_u_variable(node), ...
        node_v_variable(node), node_p_variable(node) );
    end

    if ( node == 10 )
      fprintf ( 1, '(SKIPPING ENTRIES)\n' );
    end

  end
%
%  Plot the nodes.
%
  if ( node_num <= 100 )

    filename = 'fem2d_stokes_sparse_nodes.eps';
    node_label = 1;

    points_plot ( filename, node_num, node_xy, node_label );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order 6 nodes plotted in "%s".\n', filename );

  end
%
%  Plot the elements.
%
  if ( node_num <= 100 )

    filename = 'fem2d_stokes_sparse_elements.eps';
    node_show = 2;
    triangle_show = 2;

    triangulation_order6_plot ( filename, node_num, ...
      node_xy, element_num, element_node, node_show, triangle_show );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order 6 triangles plotted in "%s".\n', ...
      filename );

  end
%
%  Determine the element neighbor array, just so we can estimate
%  the nonzeros.
%
  element_neighbor = triangulation_neighbor_triangles ( ...
    element_order, element_num, element_node );
%
%  Determine the maximum number of nonzeros.
%
  nz_num = ns_adj_count ( node_num, element_num, variable_num, ...
    element_node, element_neighbor, node_u_variable, node_v_variable, ...
    node_p_variable );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NS_ADJ_COUNT returns NZ_NUM = %d\n', nz_num );
%
%  Assemble the finite element coefficient matrix A and the right-hand side F.
%
  [ a, f ] = assemble_stokes_sparse ( node_num, element_num, quad_num, ...
    variable_num, node_xy, node_p_variable, node_u_variable, ...
    node_v_variable, element_node, nu, nz_num );

  if ( debugging )

    r8mat_print_some ( variable_num, variable_num, a, 1, 1, 10, 10, ...
      '  Initial block of Stokes stiffness matrix A:' );

    r8vec_print_some ( variable_num, f, 1, 10, ...
      '  Part of finite element right hand side vector:' );

  end
%
%  Adjust the linear system to account for Dirichlet boundary conditions.
%
  [ a, f ] = dirichlet_apply_sparse ( node_num, node_xy, node_p_variable, ...
    node_u_variable, node_v_variable, node_p_condition, ...
    node_u_condition, node_v_condition, variable_num, a, f );

  if ( debugging )

    r8mat_print_some ( variable_num, variable_num, a, 1, 1, 10, 10, ...
      '  Matrix A after Dirichlet BC adjustments:' );

    r8vec_print_some ( variable_num, f, 1, 10, ...
      '  Part of right hand side after Dirichlet BC adjustments:' );

  end
%
%  Adjust the linear system to account for Neumman boundary conditions.
%
  f = neumann_apply_sparse ( node_num, node_xy, node_p_variable, ...
    node_u_variable, node_v_variable, node_p_condition, ...
    node_u_condition, node_v_condition, variable_num, f );

  if ( 0 )

    r8mat_print_some ( variable_num, variable_num, a, 1, 1, 10, 10, ...
      '  Matrix A after Neumann BC adjustments:' );

    r8vec_print_some ( variable_num, f, 1, 10, ...
      '  Part of right hand side after Neumann BC adjustments:' );

  end
%
%  Solve the linear system using MATLAB's sparse solver.
%
  node_c = a \ f';

  if ( debugging )

    r8vec_print_some ( variable_num, node_c, 1, 10, ...
      '  Part of the solution vector:' );

  end
%
%  Print the solution vector based at nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variable indices per node:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node        U        V        P\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num

    if ( node <= 10 || node_num - 10 <= node )

      iu = node_u_variable(node);
      iv = node_v_variable(node);
      ip = node_p_variable(node);

      if ( 0 < ip )
        fprintf ( 1, '  %6d  %14f  %14f  %14f\n', ...
         node, node_c(iu), node_c(iv), node_c(ip) );
      else
        fprintf ( 1, '  %6d  %14f  %14f\n', ...
         node, node_c(iu), node_c(iv) );
      end

    end

    if ( node == 10 )
      fprintf ( 1, '(SKIPPING ENTRIES)\n' );
    end

  end
%
%  Compute a renumbering of the pressure nodes.
%
  node3_num = 0;

  for node = 1 : node_num
    if ( node_type(node) == 1 )
      node3_num = node3_num + 1;
    end
  end

  node3_num = 0;

  for node = 1 : node_num
    if ( node_type(node) == 1 )
      node3_num = node3_num + 1;
      node3_label(node) = node3_num;
    else
      node3_label(node) = -1;
    end
  end
%
%  Write the pressure nodes to a file.
%
  filename = 'nodes3.txt';

  nodes3_write ( filename, node_num, node_xy, node_type );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pressure nodes written to "%s".\n', filename );
%
%  Write the pressure triangles to a file.
%
  filename = 'triangles3.txt';

  triangles3_write ( filename, element_num, element_node, ...
    node_num, node3_label );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pressure triangles written to "%s".\n', filename );
%
%  Write the pressures to a file.
%
  filename = 'pressure3.txt';

  pressure3_write ( filename, node_num, node_p_variable, ...
    variable_num, node_c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pressures written to "%s".\n', filename );
%
%  Write an ASCII file that can be read into MATLAB.
%
  filename = 'velocity6.txt';

  velocity6_write ( filename, node_num, node_u_variable, ...
    node_v_variable, variable_num, node_c );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_STOKES_SPARSE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, f ] = assemble_stokes_sparse ( node_num, element_num, ...
  quad_num, variable_num, node_xy, node_p_variable, node_u_variable, ...
  node_v_variable, element_node, nu, nz_num )

%*****************************************************************************80
%
%% ASSEMBLE_STOKES_SPARSE assembles the Stokes stiffness SPARSE matrix.
%
%  Discussion:
%
%    The finite element coefficient matrix is set up as a MATLAB
%    sparse matrix.
%
%    The Stokes equations in weak form are:
%
%      Integral ( nu * ( dBdx(I) * dUdx + dBdy(I) * dUdy )
%        + B(I) * ( dPdx - U_RHS ) ) = 0
%
%      Integral ( nu * ( dBdx(I) * dVdx + dBdy(I) * dVdy )
%        + B(I) * (  dPdy - V_RHS ) ) = 0
%
%      Integral ( Q(I) * ( dUdx + dVdy - P_RHS ) ) = 0
%
%    Once the basic finite element system is set up by this routine, another
%    routine adjusts the system to account for boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer QUAD_NUM, the number of quadrature points in an element.
%
%    Input, integer VARIABLE_NUM, the number of unknowns.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer NODE_P_VARIABLE(NODE_NUM), the index of the pressure
%    variable associated with a node, or -1 if there is none.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM), the index of the horizontal
%    velocity variable associated with a node, or -1 if there is none.
%
%    Input, integer NODE_V_VARIABLE(NODE_NUM), the index of the vertical
%    velocity variable associated with a node, or -1 if there is none.
%
%    Input, integer ELEMENT_NODE(6,ELEMENT_NUM), the nodes that form each
%    element.  Nodes 1, 2, and 3 are the vertices.  Node 4 is between 1
%    and 2, and so on.
%
%    Input, real NU, the kinematic viscosity.
%
%    Input, integer NZ_NUM, the (maximum) number of nonzeros in the matrix.
%    If set to 0 on input, we hope MATLAB's sparse utility will be able
%    to take over the task of reallocating space as necessary.
%
%    Output, real sparse A, the finite element coefficient matrix, stored
%    as a MATLAB sparse matrix.
%
%    Output, real F(VARIABLE_NUM), the finite element right hand side.
%
%  Local parameters:
%
%    Local, real BI, DBIDX, DBIDY, the value of some basis function
%    and its first derivatives at a quadrature point.
%
%    Local, real BJ, DBJDX, DBJDY, the value of another basis
%    function and its first derivatives at a quadrature point.
%
  f(1:variable_num) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASSEMBLE_STOKES_SPARSE:\n' );
  fprintf ( 1, '  Setting up sparse Stokes matrix with NZ_NUM = %d\n', nz_num );

  a = sparse ( [], [], [], variable_num, variable_num, nz_num );
%
%  Get the quadrature weights and nodes.
%
  [ quad_w, quad_xy ] = quad_rule ( quad_num );

  for element = 1 : element_num
%
%  Extract the nodes of the linear and quadratic triangles.
%
    t3(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
    t6(1:2,1:6) = node_xy(1:2,element_node(1:6,element));
%
%  Map the quadrature points QUAD_XY to points XY in the physical triangle.
%
    xy = reference_to_physical_t6 ( t6, quad_num, quad_xy );
    area = abs ( triangle_area_2d ( t3 ) );
    w(1:quad_num) = area * quad_w(1:quad_num);
    [ u_rhs, v_rhs, p_rhs ] = rhs ( quad_num, xy );
%
%  Consider the QUAD-th quadrature point.
%
    for quad = 1 : quad_num

      point = xy(1:2,quad);
%
%  Consider the test functions.
%
      [ bi, dbidx, dbidy ] = basis_mn_t6 ( t6, 1, point );
      [ qi, dqidx, dqidy ] = basis_mn_t3 ( t3, 1, point );

      for test = 1 : 6

        test_node = element_node(test,element);

        iu = node_u_variable(test_node);
        iv = node_v_variable(test_node);
        ip = node_p_variable(test_node);
%
%  Compute the source terms for the right hand side.
%
        f(iu) = f(iu) + w(quad) * u_rhs(quad) * bi(test);
        f(iv) = f(iv) + w(quad) * v_rhs(quad) * bi(test);
        if ( 0 < ip )
          f(ip) = f(ip) + w(quad) * p_rhs(quad) * qi(test);
        end
%
%  Consider the basis functions.
%
        [ bj, dbjdx, dbjdy ] = basis_mn_t6 ( t6, 1, point );
        [ qj, dqjdx, dqjdy ] = basis_mn_t3 ( t3, 1, point );

        for basis = 1 : 6

          basis_node = element_node(basis,element);

          ju = node_u_variable(basis_node);
          jv = node_v_variable(basis_node);
          jp = node_p_variable(basis_node);
%
%  Add terms to the horizonal momentum equation.
%
          a(iu,ju) = a(iu,ju) + w(quad) * nu ...
            * ( dbidx(test) * dbjdx(basis) + dbidy(test) * dbjdy(basis) );

          if ( 0 < jp )
            a(iu,jp) = a(iu,jp) + w(quad) * bi(test) * dqjdx(basis);
          end
%
%  Add terms to the vertical momentum equation.
%
          a(iv,jv) = a(iv,jv) + w(quad) * nu ...
            * ( dbidx(test) * dbjdx(basis) + dbidy(test) * dbjdy(basis) );

          if ( 0 < jp )
            a(iv,jp) = a(iv,jp) + w(quad) * bi(test) * dqjdy(basis);
          end
%
%  Add terms to the continuity equation.
%
          if ( 0 < ip )
            a(ip,ju) = a(ip,ju) + w(quad) * qi(test) * dbjdx(basis);
            a(ip,jv) = a(ip,jv) + w(quad) * qi(test) * dbjdy(basis);
          end

        end

      end

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASSEMBLE_STOKES_SPARSE:\n' );
  fprintf ( 1, '  Sparse Stokes matrix used NZ_NUM = %d\n', nz_num );

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
          - ( t(1,2)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );;

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
function [ a, f ] = dirichlet_apply_sparse ( node_num, node_xy, node_p_variable, ...
  node_u_variable, node_v_variable, node_p_condition, ...
  node_u_condition, node_v_condition, variable_num, a, f )

%*****************************************************************************80
%
%% DIRICHLET_APPLY_SPARSE accounts for Dirichlet boundary conditions.
%
%  Discussion:
%
%    The finite element stiffness matrix has been set up as a MATLAB
%    sparse matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2006
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
%    Input, integer NODE_P_VARIABLE(NODE_NUM),
%    is the index of the pressure variable associated with the node,
%    or -1 if there is no associated pressure variable.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM),
%    is the index of the horizontal velocity variable associated with the node.
%
%    Input, integer NODE_V_VARIABLE(NODE_NUM),
%    is the index of the vertical velocity variable associated with the node.
%
%    Input, integer NODE_P_CONDITION(NODE_NUM),
%    indicates the condition used to determine pressure at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer NODE_U_CONDITION(NODE_NUM),
%    indicates the condition used to determine horizontal velocity at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer NODE_V_CONDITION(NODE_NUM),
%    indicates the condition used to determine vertical velocity at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, real sparse A, the coefficient matrix, stored in MATLAB
%    sparse format.
%
%    Input, real F(VARIABLE_NUM), the right hand side.
%
%    Output, real sparse A, the matrix has been adjusted for Dirichlet boundary
%    conditions.
%
%    Output, real F(VARIABLE_NUM), the right hand side has been adjusted
%    for Dirichlet boundary conditions.
%
  DIRICHLET = 2;

  for node = 1 : node_num

    [ u_bc, v_bc, p_bc ] = dirichlet_condition ( 1, node_xy(1:2,node) );

    iu = node_u_variable(node);
    iv = node_v_variable(node);
    ip = node_p_variable(node);

    if ( node_u_condition(node) == DIRICHLET )

      a(iu,:) = 0.0;
      a(iu,iu) = 1.0;

      f(iu) = u_bc;

    end

    if ( node_v_condition(node) == DIRICHLET )

      a(iv,:) = 0.0;
      a(iv,iv) = 1.0;

      f(iv) = v_bc;

    end

    if ( 0 < ip )

      if ( node_p_condition(node) == DIRICHLET )

        a(ip,:) = 0.0;
        a(ip,ip) = 1.0;

        f(ip) = p_bc;

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
%    Input, string TITLE, an optional title.
%
  incx = 10;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

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
function f = neumann_apply_sparse ( node_num, node_xy, node_p_variable, ...
  node_u_variable, node_v_variable, node_p_condition, ...
  node_u_condition, node_v_condition, variable_num, f )

%*****************************************************************************80
%
%% NEUMANN_APPLY_SPARSE accounts for Neumann boundary conditions.
%
%  Discussion:
%
%    At the moment, this program only allows Neumann boundary conditions
%    of the form
%
%      dU/dn = 0
%      dV/dn = 0
%      dP/dn = 0
%
%    For such conditions, there is NO change necessary to the linear system.
%    So this routine actually does nothing.  It is here as preparation
%    for later treatment of nonzero Neumann conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2006
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
%    Input, integer NODE_P_VARIABLE(NODE_NUM),
%    is the index of the pressure variable associated with the node,
%    or -1 if there is no associated pressure variable.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM),
%    is the index of the horizontal velocity variable associated with the node.
%
%    Input, integer NODE_V_VARIABLE(NODE_NUM),
%    is the index of the vertical velocity variable associated with the node.
%
%    Input, integer NODE_P_CONDITION(NODE_NUM),
%    indicates the condition used to determine pressure at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer NODE_U_CONDITION(NODE_NUM),
%    indicates the condition used to determine horizontal velocity at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer NODE_V_CONDITION(NODE_NUM),
%    indicates the condition used to determine vertical velocity at a node.
%    0, there is no condition at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, real F(VARIABLE_NUM), the right hand side.
%
%    Output, real F(VARIABLE_NUM), the right hand side has been adjusted
%    for Dirichlet boundary conditions.
%

%
%  The user routine supplies a right hand side value for a possible
%  Neumann condition at EVERY node.
%
  [ u_bc, v_bc, p_bc ] = neumann_condition ( node_num, node_xy );

  NEUMANN = 3;

  for node = 1 : node_num

    iu = node_u_variable(node);
    iv = node_v_variable(node);
    ip = node_p_variable(node);

    if ( node_u_condition(node) == NEUMANN )

%     f(iu) = f(iu) + line integral;

    end

    if ( node_v_condition(node) == NEUMANN )

%     f(iv) = f(iv) + line integral;

    end

    if ( 0 < ip )

      if ( node_p_condition(node) == NEUMANN )

%       f(ip) = f(ip) + line integral;

      end

    end

  end

  return
end
function nodes3_write ( file_name, node_num, node_xy, node_type )

%*****************************************************************************80
%
%% NODES3_WRITE writes the pressure nodes to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2005
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
%    Input, integer NODE_TYPE(NODE_NUM), determines if the node is a
%    vertex or midside node.
%    1, the node is a vertex (P, U, V variables are associated with it).
%    2, the node is a midside node (only U and V variables are associated.)
%
  file_unit = fopen ( file_name, 'wt');

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODES3_WRITE - Warning!\n' );
    fprintf ( 1, '  Could not write the file "%s".\n', file_name );
    return;
  end

  for node = 1 : node_num

    if ( node_type(node) == 1 )
      fprintf ( file_unit, '%8f  %8f\n', node_xy(1:2,node) );
    end

  end

  fclose ( file_unit );

  return
end
function adj_num = ns_adj_count ( node_num, triangle_num, ...
  variable_num, triangle_node, triangle_neighbor, node_u_variable, ...
  node_v_variable, node_p_variable )

%*****************************************************************************80
%
%% NS_ADJ_COUNT counts adjacencies in a Navier Stokes triangulation.
%
%  Discussion:
%
%    This routine is called to count the adjacencies, so that the
%    appropriate amount of memory can be set aside for storage when
%    the adjacency structure is created.
%
%    The value of ADJ_NUM computed and returned by this routine should
%    be identical to the value computed by NS_ADJ_COL_SET.
%
%    The triangulation is assumed to involve 6-node triangles.
%
%    Variables for the horizontal and vertical velocities are associated
%    with every node.  Variables for the pressure are associated only with
%    the vertex nodes.
%
%    We are interested in determining the number of nonzero entries in the
%    stiffness matrix of the Stokes equations, or the jacobian matrix of
%    the Navier Stokes equations.  To this end, we will say, somewhat
%    too broadly, that two variables are "adjacent" if their associated
%    nodes both occur in some common element.  This adjacency of variables
%    I and J is taken to be equivalent to the possible nonzeroness of
%    matrix entries A(I,J) and A(J,I).
%
%    A sparse compressed column format is used to store the counts for
%    the nonzeroes.  In other words, while the value ADJ_NUM reports the
%    number of adjacencies, the vector ADJ_COL is sufficient to allow us
%    to properly set up a sparse compressed matrix for the actual storage
%    of the sparse matrix, if we desire to proceed.
%
%  Local Node Numbering:
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
%  Variable Diagram:
%
%      UVP
%       |\
%       | \
%       |  \
%      UV   UV
%       |    \
%       |     \
%       |      \
%      UVP--UV--UVP
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), lists the nodes that
%    make up each triangle.  The first three nodes are the vertices,
%    in counterclockwise order.  The fourth value is the midside
%    node between nodes 1 and 2; the fifth and sixth values are
%    the other midside nodes in the logical order.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), for each side of
%    a triangle, lists the neighboring triangle, or -1 if there is
%    no neighbor.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM), NODE_V_VARIABLE(NODE_NUM),
%    NODE_P_VARIABLE(NODE_NUM), the index of the horizontal velocity,
%    vertical velocity and pressure variables associated with a node,
%    or -1 if no such variable is associated with the node.
%
%    Output, integer ADJ_NUM, the number of Navier Stokes variable adjacencies.
%
  triangle_order = 6;

  adj_num = 0;
%
%  Set every variable to be adjacent to itself.
%
  adj_num = variable_num;
%
%  Set every variable to be adjacent to the other variables associated with
%  that node.
%
%  U <=> V
%  U <=> P (if there is a P variable)
%  V <=> P (if there is a P variable)
%
  for node = 1 : node_num

    adj_num = adj_num + 2;

    p1 = node_p_variable(node);

    if ( 0 < p1 )
      adj_num = adj_num + 4;
    end

  end
%
%  Examine each triangle.
%
  for triangle = 1 : triangle_num
%
%  For sure, we add the new adjacencies:
%
%    U5 V5 <=> U1 V1 P1
%    U6 V6 <=> U2 V2 P2
%    U4 V4 <=> U3 V3 P3
%    U5 V5 <=> U4 V4
%    U6 V6 <=> U4 V4
%    U6 V6 <=> U5 V5
%
    adj_num = adj_num + 60;
%
%  Add edges (1,2), (1,4), (2,4) if this is the first occurrence,
%  that is, if the edge (1,4,2) is on a boundary (TRIANGLE2 <= 0)
%  or if this triangle is the first of the pair in which the edge
%  occurs (TRIANGLE < TRIANGLE2).
%
%  Maybe add
%
%    U1 V1 P1 <=> U2 V2 P2
%    U1 V1 P1 <=> U4 V4
%    U2 V2 P2 <=> U4 V4
%
    triangle2 = triangle_neighbor(1,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end
%
%  Maybe add
%
%    U2 V2 P2 <=> U3 V3 P3
%    U2 V2 P2 <=> U5 V5
%    U3 V3 P3 <=> U5 V5
%
    triangle2 = triangle_neighbor(2,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end
%
%  Maybe add
%
%    U1 V1 P1 <=> U3 V3 P3
%    U1 V1 P1 <=> U6 V6
%    U3 V3 P3 <=> U6 V6
%
    triangle2 = triangle_neighbor(3,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_num = adj_num + 42;
    end

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
function pressure3_write ( file_name, node_num, node_p_variable, ...
  variable_num, node_c )

%*****************************************************************************80
%
%% PRESSURE3_WRITE writes the pressures to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME(*), the file name.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_P_VARIABLE(NODE_NUM),
%    is the index of the pressure variable associated with the node,
%    or -1 if there is no associated pressure variable.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, real NODE_C(VARIABLE_NUM), the finite element coefficients.
%
  file_unit = fopen ( file_name, 'wt');

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRESSURE3_WRITE - Warning!\n' );
    fprintf ( 1, '  Could not write the file "%s".\n', file_name );
    return;
  end

  for node = 1 : node_num

    variable = node_p_variable(node);

    if ( 0 < variable )
      fprintf ( file_unit, '  %14f\n', node_c(variable) );
    end

  end

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
%    08 April 2009
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
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

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
        fprintf ( 1, '%12g  ', a(i,j) );
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
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

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
function phy = reference_to_physical_t6 ( t, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_T6 maps T6 reference points to physical points.
%
%  Discussion:
%
%    Given the vertices of an order 6 physical triangle and a point
%    (XSI,ETA) in the reference triangle, the routine computes the value
%    of the corresponding image point (X,Y) in physical space.
%
%    The mapping from (XSI,ETA) to (X,Y) has the form:
%
%      X(ETA,XSI) = A1 * XSI**2 + B1 * XSI*ETA + C1 * ETA**2
%                 + D1 * XSI    + E1 * ETA     + F1
%
%      Y(ETA,XSI) = A2 * XSI**2 + B2 * XSI*ETA + C2 * ETA**2
%                 + D2 * XSI    + E2 * ETA     + F2
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the coordinates of the vertices.
%    The vertices are assumed to be the images of (0,0), (1,0),
%    (0,1),(1/2,0), (1/2,1/2) and (0,1/2) respectively.
%
%    Input, integer N, the number of objects to transform.
%
%    Input, real REF(2,N), points in the reference triangle.
%
%    Output, real PHY(2,N), corresponding points in the
%    physical triangle.
%
  for i = 1 : 2

    a(i) =   2.0 * t(i,1) + 2.0 * t(i,2)                ...
           - 4.0 * t(i,4);

    b(i) =   4.0 * t(i,1)                               ...
           - 4.0 * t(i,4) + 4.0 * t(i,5) - 4.0 * t(i,6);

    c(i) =   2.0 * t(i,1)                + 2.0 * t(i,3) ...
                                         - 4.0 * t(i,6);

    d(i) = - 3.0 * t(i,1) -       t(i,2)                ...
           + 4.0 * t(i,4);

    e(i) = - 3.0 * t(i,1)                -       t(i,3) ...
                                         + 4.0 * t(i,6);
    f(i) =         t(i,1);

  end

  for i = 1 : 2
    phy(i,1:n) = a(i) * ref(1,1:n) .* ref(1,1:n) ...
               + b(i) * ref(1,1:n) .* ref(2,1:n) ...
               + c(i) * ref(2,1:n) .* ref(2,1:n) ...
               + d(i) * ref(1,1:n) ...
               + e(i) * ref(2,1:n) ...
               + f(i);
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
function triangles3_write ( file_name, triangle_num, triangle_node, ...
  node_num, node3_label )

%*****************************************************************************80
%
%% TRIANGLES3_WRITE writes the pressure triangles to a file.
%
%  Discussion:
%
%    The first three rows of the array TRIANGLE_NODE(6,NODE) contain
%    exactly the nodes that make up the pressure triangles.
%
%    However, we must relabel the nodes!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), the nodes that make up each triangle.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE3_LABEL(NODE_NUM), contains the renumbered
%    label of order3 nodes, and -1 for nodes that are not order3 nodes.
%
  file_unit = fopen ( file_name, 'wt');

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLES3_WRITE - Warning!\n' );
    fprintf ( 1, '  Could not write the file "%s".\n', file_name );
    return;
  end

  for triangle = 1 : triangle_num

    fprintf ( file_unit, '%6d  %6d  %6d\n', ...
      node3_label ( triangle_node(1:3,triangle) ) );
  end

  fclose ( file_unit );

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
function velocity6_write ( file_name, node_num, node_u_variable, ...
  node_v_variable, variable_num, node_c )

%*****************************************************************************80
%
%% VELOCITY6_WRITE writes the velocities to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME, the file name.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_U_VARIABLE(NODE_NUM), NODE_V_VARIABLE(NODE_NUM),
%    the indices of the horizontal and vertical velocity variables
%    associated with the node, or -1 if there is none.
%
%    Input, integer VARIABLE_NUM, the number of variables.
%
%    Input, real NODE_C(NODE_NUM), the coefficients of the solution.
%
  output_unit = fopen ( file_name, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY6_WRITE - Warning!\n' );
    fprintf ( 1, '  Could not write the velocity file.\n' );
    return
  end

  for node = 1 : node_num

    u_index = node_u_variable(node);

    if ( 0 < u_index )
      u = node_c(u_index);
    else
      u = 0.0;
    end

    v_index = node_v_variable(node);

    if ( 0 < v_index )
      v = node_c(v_index);
    else
      v = 0.0;
    end

    fprintf ( output_unit, '  %14f  %14f\n', u, v );

  end

  fclose ( output_unit );

  return
end
