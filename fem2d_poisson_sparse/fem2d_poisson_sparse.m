function fem2d_poisson_sparse ( prefix )

%*****************************************************************************80
%
%% MAIN is the main routine for FEM2D_POISSON_SPARSE.
%
%  Discussion:
%
%    This program is a variant of FEM2D_POISSON.  That program is
%    particularly limited because of its use of banded matrix storage and
%    solving routines.
%
%    This program discards the banded approach.  Instead, it uses MATLAB's
%    sparse matrix storage, factorization and solution facilities,
%    which allow this program to solve larger problems faster.
%
%    Only three routines needed to be changed:
%    * the main program FEM2D_POISSON is replaced by FEM2D_POISSON_SPARSE.
%    * the routine ASSEMBLE_POISSON is replaced by ASSEMBLE_POISSON_SPARSE.
%    * the routine DIRICHLET_APPLY is replaced by
%      DIRICHLET_APPLY_SPARSE.
%
%    This program solves the Poisson equation
%
%      -DEL H(X,Y) DEL U(X,Y) + K(X,Y) * U = F(X,Y)
%
%    in a triangulated region in the plane.
%
%    Along the boundary of the region, Dirichlet conditions
%    are imposed:
%
%      U(X,Y) = G(X,Y)
%
%    The code uses continuous piecewise linear basis functions on
%    triangles.
%
%  Problem specification:
%
%    The user defines the geometry by supplying two data files
%    which list the node coordinates, and list the nodes that make up
%    each element.
%
%    The user specifies the right hand side of the Dirichlet boundary
%    conditions by supplying a function
%
%      function node_bc = dirichlet_condition ( node_num, node_xy )
%
%    The user specifies the coefficient function H(X,Y):
%
%      function node_h = h_coef ( node_num, node_xy )
%
%    The user specifies the coefficient function K(X,Y):
%
%      function node_k = k_coef ( node_num, node_xy )
%
%    The user specifies the right hand side of the Poisson equation
%    by supplying a routine of the form
%
%      function node_rhs = rhs ( node_num, node_xy )
%
%  Usage:
%
%    fem2d_poisson_sparse ( 'prefix' )
%
%    where:
%
%    'prefix' is the common prefix for the node and element files:
%
%    * prefix_nodes.txt,     the node coordinates.
%    * prefix_elements.txt,  the nodes that make up each element.
%
%    Files created include:
%
%    * prefix_nodes.eps, an image of the nodes;
%    * prefix_elements.eps, an image of the elements;
%    * prefix_solution.txt", the value of the solution at every node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, real sparse A(:,), the finite element coefficient matrix.
%
%    Local, integer ELEMENT_NODE[3*ELEMENT_NUM];
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Local, integer ELEMENT_NUM, the number of elements.
%
%    Local, integer ELEMENT_ORDER, the element order.
%
%    Local, real F(NODE_NUM,1), the right hand side.
%
%    Local, logical NODE_BOUNDARY(NODE_NUM), is TRUE if the node is
%    found to lie on the boundary of the region.
%
%    Local, integer NODE_CONDITION(NODE_NUM),
%    indicates the condition used to determine the variable at a node.
%    0, there is no condition (and no variable) at this node.
%    1, a finite element equation is used;
%    2, a Dirichlet condition is used.
%    3, a Neumann condition is used.
%
%    Local, integer NODE_NUM, the number of nodes.
%
%    Local, real NODE_R(NODE_NUM), the residual error.
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
  debugging = 0;
  quad_num = 3;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON_SPARSE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A version of FEM2D_POISSON using MATLAB''s \n' );
  fprintf ( 1, '  sparse matrix storage, factor and solve facilities.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Finite element solution of the \n' );
  fprintf ( 1, '  steady Poisson equation on a triangulated region\n' );
  fprintf ( 1, '  in 2 dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  - DEL H(x,y) DEL U(x,y) + K(x,y) * U(x,y) = F(x,y) in the region\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                     U(x,y) = G(x,y) on the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The finite element method is used,\n' );
  fprintf ( 1, '  with triangular elements,\n' );
  fprintf ( 1, '  which must be a 3 node linear triangle.\n' );
%
%  Must have prefix.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_POISSON_SPARSE - Fatal error!\n' );
    fprintf ( 1, '  Missing "prefix", the common filename prefix input.\n' );
    error ( 'FEM2D_POISSON_SPARSE - Fatal error!\n' )
  end
%
%  Create the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  solution_filename = strcat ( prefix, '_values.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node file is "%s".\n', node_filename );
  fprintf ( 1, '  Element file is "%s".\n', element_filename );
%
%  Read the node coordinate file.
%
  node_xy = load ( node_filename );
  node_xy = node_xy';
  [ dim_num, node_num ] = size ( node_xy );

  fprintf ( 1, '  Number of nodes =          %d\n', node_num );

  r8mat_transpose_print_some ( dim_num, node_num, node_xy, 1, 1, 2, 10, ...
    '  First 10 nodes' );
%
%  Read the element description file.
%
  element_node = load ( element_filename );
  element_node = element_node';
  [ element_order, element_num ] = size ( element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order =            %d\n', element_order );
  fprintf ( 1, '  Number of elements =       %d\n', element_num );

  if ( element_order ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_POISSON_SPARSE - Fatal error!\n' );
    fprintf ( 1, '  The input triangulation has order %d.\n', element_order );
    fprintf ( 1, '  However, a triangulation of order 3 is required.' );
    error ( 'FEM2D_POISSON_SPARSE - Fatal error!' );
  end

  i4mat_transpose_print_some ( 3, element_num, ...
    element_node, 1, 1, 3, 10, '  First 10 elements' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature order =          %d\n', quad_num );
%
%  Determine which nodes are boundary nodes and which have a
%  finite element unknown.  Then set the boundary values.
%
  node_boundary = triangulation_order3_boundary_node ( node_num, ...
    element_num, element_node );
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
%  Determine the element neighbor array, just so we can estimate
%  the nonzeros.
%
  element_neighbor = triangulation_neighbor_triangles ( ...
    element_order, element_num, element_node );
%
%  Determine the maximum number of nonzeros.
%
  [ nz_num, adj_col ] = triangulation_order3_adj_count ( node_num, ...
    element_num, element_node, element_neighbor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_ADJ_COUNT returns NZ_NUM = %d\n', ...
    nz_num );
%
%  Assemble the finite element coefficient matrix A and the right-hand side F.
%
  [ a, f ] = assemble_poisson_sparse ( node_num, node_xy, ...
    element_num, element_node, quad_num, nz_num );

  if ( debugging )

    a_copy = full ( a );
    r8mat_print_some ( node_num, node_num, a_copy, 1, 1, 10, 10, ...
      '  Part of Poisson stiffness matrix A:' );

    r8vec_print_some ( node_num, f, 1, 10, ...
      '  Part of finite element right hand side vector F:' );

  end
%
%  Adjust the linear system to account for Dirichlet boundary conditions.
%
  [ a, f ] = dirichlet_apply_sparse ( node_num, node_xy, node_condition, ...
    a, f );

  if ( debugging )

    a_copy = full ( a );
    r8mat_print_some ( node_num, node_num, a_copy, 1, 1, 10, 10, ...
      '  Part of Matrix A after Dirichlet boundary adjustments:' );

    r8mat_print_some ( node_num, 1, f, 1, 1, 10, 1, ...
      '  Part of right hand side after Dirichlet boundary adjustments:' );

  end
%
%  Solve the linear system using MATLAB's sparse solver.
%
  node_u = a \ f;

  r8vec_print_some ( node_num, node_u, 1, 10, ...
    '  Part of the solution vector:' );

  node_r = residual_poisson ( node_num, node_xy, node_condition, ...
    element_num, element_node, quad_num, a, f, node_u );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum absolute residual = %f\n',  ...
    max ( abs ( node_r(1:node_num) ) ) );
%
%  Write an ASCII file that can be read into MATLAB.
%
  save ( solution_filename, '-ascii', 'node_u' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON_SPARSE:\n' );
  fprintf ( 1, '  Wrote solution to the file "%s"\n', solution_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON_SPARSE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, f ] = assemble_poisson_sparse ( node_num, node_xy, ...
  element_num, element_node, quad_num, nz_num )

%*****************************************************************************80
%
%% ASSEMBLE_POISSON_SPARSE assembles the system for the Poisson equation.
%
%  Discussion:
%
%    The matrix is stored in MATLAB sparse matrix format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2010
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
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM);
%    element_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, integer NZ_NUM, the (maximum) number of nonzeros in the matrix.
%    If set to 0 on input, we hope MATLAB's sparse utility will be able
%    to take over the task of reallocating space as necessary.
%
%    Output, real sparse A(:,:), the coefficient matrix.
%
%    Output, real F(NODE_NUM,1), the right hand side.
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
  f(1:node_num,1) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASSEMBLE_POISSON_SPARSE:\n' );
  fprintf ( 1, '  Setting up sparse Poisson matrix with NZ_NUM = %d\n', nz_num );

  a = sparse ( [], [], [], node_num, node_num, nz_num );
%
%  Get the quadrature weights and nodes.
%
  [ quad_w, quad_xy ] = quad_rule ( quad_num );
%
%  Add up all quantities associated with the element-th element.
%
  for element = 1 : element_num
%
%  Make a copy of the element.
%
    t3(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
%
%  Map the quadrature points QUAD_XY to points PHYS_XY in the physical element.
%
    phys_xy(1:2,1:quad_num) = reference_to_physical_t3 ( t3, quad_num, quad_xy );

    area = abs ( triangle_area_2d ( t3 ) );

    w(1:quad_num,1) = quad_w(1:quad_num,1) * area;

    phys_rhs = rhs ( quad_num, phys_xy );
    phys_h = h_coef ( quad_num, phys_xy );
    phys_k = k_coef ( quad_num, phys_xy );
%
%  Consider the QUAD-th quadrature point..
%
    for quad = 1 : quad_num
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%  But if a node is associated with a boundary condition, we do nothing.
%
      for test = 1 : 3

        i = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t3 ( t3, test, phys_xy(1:2,quad) );

        f(i,1) = f(i,1) + w(quad,1) * phys_rhs(quad,1) * bi;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for basis = 1 : 3

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t3 ( t3, basis, phys_xy(1:2,quad) );

          a(i,j) = a(i,j) + w(quad,1) * ( ...
              phys_h(quad) * ( dbidx * dbjdx + dbidy * dbjdy ) ...
            + phys_k(quad) * bj * bi );

        end

      end

    end

  end

  return
end
function [ qi, dqidx, dqidy ] = basis_11_t3 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T3: one basis at one point for the T3 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the nodes of a triangle.
%
%           3
%          / \
%         /   \
%        /     \
%       1-------2
%
%    It evaluates the linear basis function Q(I)(X,Y) associated with
%    node I, which has the property that it is a linear function
%    which is 1 at node I and zero at the other two nodes.
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
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the nodes.
%
%    Input, integer I, the index of the desired basis function.
%    I should be between 1 and 3.
%
%    Input, real P(2), the coordinates of a point at which the basis
%    function is to be evaluated.
%
%    Output, real QI, DQIDX, DQIDY, the values of the basis function
%    and its X and Y derivatives.
%
  area = abs ( t(1,1) * ( t(2,2) - t(2,3) ) ...
             + t(1,2) * ( t(2,3) - t(2,1) ) ...
             + t(1,3) * ( t(2,1) - t(2,2) ) );

  if ( area == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Element has zero area.\n' );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  if ( i < 1 | 3 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T3 - Fatal error!\n' );
    fprintf ( 1, '  Basis index I is not between 1 and 3.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'BASIS_11_T3 - Fatal error!' );
  end

  if ( i == 1 )
    ip1 = 2;
    ip2 = 3;
  elseif ( i == 2 )
    ip1 = 3;
    ip2 = 1;
  else
    ip1 = 1;
    ip2 = 2;
  end

  qi = ( ( t(1,ip2) - t(1,ip1) ) * ( p(2) - t(2,ip1) ) ...
       - ( t(2,ip2) - t(2,ip1) ) * ( p(1) - t(1,ip1) ) ) / area;

  dqidx = - ( t(2,ip2) - t(2,ip1) ) / area;
  dqidy =   ( t(1,ip2) - t(1,ip1) ) / area;

  return
end
function [ a, f ] = dirichlet_apply_sparse ( node_num, node_xy, ...
  node_condition, a, f )

%*****************************************************************************80
%
%% DIRICHLET_APPLY_SPARSE accounts for Dirichlet boundary conditions.
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
%    Input, real sparse A(:,:), the coefficient matrix.
%
%    Input, real F(NODE_NUM,1), the right hand side.
%
%    Output, real sparse A(:,:), the coefficient matrix,
%    adjusted for Dirichlet boundary conditions.
%
%    Output, real F(NODE_NUM), the right hand side, adjusted for
%    Dirichlet boundary conditions.
%
  node_bc = dirichlet_condition ( node_num, node_xy );

  DIRICHLET = 2;

  for node = 1 : node_num

    if ( node_condition(node) == DIRICHLET )

      a(node,:) = 0.0;
      a(node,node) = 1.0;

      f(node,1) = node_bc(node);

    end

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

  return
end
function [ quad_w, quad_xy ] = quad_rule ( quad_num )

%*****************************************************************************80
%
%% QUAD_RULE sets the quadrature rule for assembly.
%
%  Discussion:
%
%    The quadrature rule is given for a reference element, points (X,Y) such
%    that
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
%    14 February 2003
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
%    Output, real QUAD_W(QUAD_NUM,1), the quadrature weights.
%
%    Output, real QUAD_XY(2,QUAD_NUM), the quadrature nodes.
%
  if ( quad_num == 1 )

    quad_xy(1:2,1:quad_num) = [ 1.0 / 3.0, 1.0 / 3.0 ]';

    quad_w(1:quad_num,1) = 1.0;

  elseif ( quad_num == 3 )

    quad_xy(1:2,1:quad_num) = [ ...
      0.5, 0.0; ...
      0.5, 0.5; ...
      0.0, 0.5 ]';

    quad_w(1:quad_num,1) = 1.0 / 3.0;

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

    quad_w(1:quad_num,1) = [ e, d, d, d ]' / g;

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

    quad_w(1:6,1) = [ v, v, v, w, w, w ]';

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

    quad_w(1:quad_num,1) = [ u, v, v, v, w, w, w ]';

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

    quad_w(1:quad_num,1) = [ u, u, u, v, v, v, v, v, v ]';

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

    quad_w(1:quad_num,1) = [ w, t, t, t, u, u, u, v, v, v, v, v, v ]';

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUAD_RULE - Fatal error!\n' );
    fprintf ( 1, '  No rule is available of order QUAD_NUM = %d\n', ...
      quad_num );
    error ( 'QUAD_RULE - Fatal error!\n' );

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
%    14 February 2003
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
function node_r = residual_poisson ( node_num, node_xy, node_condition, ...
  element_num, element_node, quad_num, a, f, node_u )

%*****************************************************************************80
%
%% RESIDUAL_POISSON evaluates the residual for the Poisson equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the
%    coordinates of nodes.
%
%    Input, integer NODE_CONDITION(NODE_NUM), reports the condition
%    used to set the unknown associated with the node.
%    0, unknown.
%    1, finite element equation.
%    2, Dirichlet condition;
%    3, Neumann condition.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, integer INDX(NODE_NUM), gives the index of the unknown quantity
%    associated with the given node.
%
%    Workspace, real sparse A(:,:), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in MATLAB sparse format.
%
%    Workspace, real F(NODE_NUM,1), the right hand side.
%
%    Input, real NODE_U(NODE_NUM), the value of the solution
%    at each node.
%
%    Output, real NODE_R(NODE_NUM), the finite element
%    residual at each node.
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
  f(1:node_num,1) = 0.0;
  a(:,:) = 0.0;
%
%  Get the quadrature weights and nodes.
%
  [ quad_w, quad_xy ] = quad_rule ( quad_num );
%
%  The actual values of A and F are determined by summing up
%  contributions from all the elements.
%
  for element = 1 : element_num
%
%  Make a copy of the element.
%
    t3(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
%
%  Map the quadrature points QUAD_XY to points PHYS_XY in the physical element.
%
    phys_xy(1:2,1:quad_num) = reference_to_physical_t3 ( t3, quad_num, quad_xy );
    area = abs ( triangle_area_2d ( t3 ) );
    w(1:quad_num) = area * quad_w(1:quad_num);

    phys_rhs = rhs ( quad_num, phys_xy );
    phys_h = h_coef ( quad_num, phys_xy );
    phys_k = k_coef ( quad_num, phys_xy );
%
%  Consider a quadrature point QUAD, with coordinates (X,Y).
%
    for quad = 1 : quad_num
%
%  Consider one of the basis functions, which will play the
%  role of test function in the integral.
%
%  We generate an integral for every node associated with an unknown.
%  But if a node is associated with a boundary condition, we do nothing.
%
      for test = 1 : 3

        i = element_node(test,element);

        [ bi, dbidx, dbidy ] = basis_11_t3 ( t3, test, phys_xy(1:2,quad) );

        f(i,1) = f(i,1) + w(quad) * phys_rhs(quad) * bi;
%
%  Consider another basis function, which is used to form the
%  value of the solution function.
%
        for basis = 1 : 3

          j = element_node(basis,element);

          [ bj, dbjdx, dbjdy ] = basis_11_t3 ( t3, basis, phys_xy(1:2,quad) );

          a(i,j) = a(i,j) + w(quad) * ( ...
              phys_h(quad) * ( dbidx * dbjdx + dbidy * dbjdy ) ...
            + phys_k(quad) * bj * bi );

        end

      end

    end

  end
%
%  Apply boundary conditions.
%
  [ a, f ] = dirichlet_apply_sparse ( node_num, node_xy, node_condition, a, f );
%
%  Compute A*U.
%
  node_r = a * node_u;
%
%  Set RES = A * U - F.
%
  node_r(1:node_num) = node_r(1:node_num) - f(1:node_num,1);

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
%    MATLAB version by John Burkardt.
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
%    14 February 2003
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
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the three triangles
%    that are direct neighbors of a given triangle.  TRIANGLE_NEIGHBOR(1,I) is
%    the index of the triangle which touches side 1, defined by nodes 2 and 3,
%    and so on.  TRIANGLE_NEIGHBOR(1,I) is negative if there is no neighbor
%    on that side.  In this case, that side of the triangle lies on the
%    boundary of the triangulation.
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
function [ adj_num, adj_col ] = triangulation_order3_adj_count ( node_num, ...
  tri_num, triangle_node, triangle_neighbor )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_ADJ_COUNT counts adjacencies in a triangulation.
%
%  Discussion:
%
%    This routine is called to count the adjacencies, so that the
%    appropriate amount of memory can be set aside for storage when
%    the adjacency structure is created.
%
%    The triangulation is assumed to involve 3-node triangles.
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
%    e  |   \  side 2
%       |    \
%    3  |     \
%       |      \
%       1-------2
%
%         side 1
%
%    The local node numbering
%
%
%   21-22-23-24-25
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%   16-17-18-19-20
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%   11-12-13-14-15
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%    6--7--8--9-10
%    |\ |\ |\ |\ |
%    | \| \| \| \|
%    1--2--3--4--5
%
%    A sample grid.
%
%
%    Below, we have a chart that summarizes the adjacency relationships
%    in the sample grid.  On the left, we list the node, and its neighbors,
%    with an asterisk to indicate the adjacency of the node to itself
%    (in some cases, you want to count this self adjacency and in some
%    you don't).  On the right, we list the number of adjancencies to
%    lower-indexed nodes, to the node itself, to higher-indexed nodes,
%    the total number of adjacencies for this node, and the location
%    of the first and last entries required to list this set of adjacencies
%    in a single list of all the adjacencies.
%
%    N   Adjacencies                Below  Self   Above   Total First  Last
%
%   --  -- -- -- -- -- -- --           --    --      --      --   ---     0
%    1:  *  2  6                        0     1       2       3     1     3
%    2:  1  *  3  6  7                  1     1       3       5     4     8
%    3:  2  *  4  7  8                  1     1       3       5     9    13
%    4:  3  *  5  8  9                  1     1       3       5    14    18
%    5:  4  *  9 10                     1     1       2       4    19    22
%    6:  1  2  *  7 11                  2     1       2       5    23    27
%    7:  2  3  6  *  8 11 12            3     1       3       7    28    34
%    8:  3  4  7  *  9 12 13            3     1       3       7    35    41
%    9:  4  5  8  * 10 13 14            3     1       3       7    42    48
%   10:  5  9  * 14 15                  2     1       2       5    49    53
%   11:  6  7  * 12 16                  2     1       2       5    54    58
%   12:  7  8 11  * 13 16 17            3     1       3       7    59    65
%   13:  8  9 12  * 14 17 18            3     1       3       7    66    72
%   14:  9 10 13  * 15 18 19            3     1       3       7    73    79
%   15: 10 14  * 19 20                  2     1       2       5    80    84
%   16: 11 12  * 17 21                  2     1       2       5    85    89
%   17: 12 13 16  * 18 21 22            3     1       3       7    90    96
%   18: 13 14 17  * 19 22 23            3     1       3       7    97   103
%   19: 14 15 18  * 20 23 24            3     1       3       7   104   110
%   20: 15 19  * 24 25                  2     1       2       5   111   115
%   21: 16 17  * 22                     2     1       1       4   116   119
%   22: 17 18 21  * 23                  3     1       1       5   120   124
%   23: 18 19 22  * 24                  3     1       1       5   125   129
%   24: 19 20 23  * 25                  3     1       1       5   130   134
%   25: 20 24  *                        2     1       0       3   135   137
%   --  -- -- -- -- -- -- --           --    --      --      --   138   ---
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
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRI_NUM), lists the nodes that
%    make up each triangle, in counterclockwise order.
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
  triangle_order = 3;
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
%
%  Add edge (1,2) if this is the first occurrence,
%  that is, if the edge (1,2) is on a boundary (TRIANGLE2 <= 0)
%  or if this triangle is the first of the pair in which the edge
%  occurs (TRIANGLE < TRIANGLE2).
%
    triangle2 = triangle_neighbor(1,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n2) = adj_col(n2) + 1;
    end
%
%  Add edge (2,3).
%
    triangle2 = triangle_neighbor(2,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n3) = adj_col(n3) + 1;
    end
%
%  Add edge (3,1).
%
    triangle2 = triangle_neighbor(3,triangle);

    if ( triangle2 < 0 | triangle < triangle2 )
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n3) = adj_col(n3) + 1;
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
function node_boundary = triangulation_order3_boundary_node ( node_num, ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_BOUNDARY_NODE indicates which nodes are on the boundary.
%
%  Discussion:
%
%    This routine is given a triangulation, an abstract list of sets of
%    of nodes.  It is assumed that the nodes in each triangle are listed
%    in a counterclockwise order, although the routine should work
%    if the nodes are consistently listed in a clockwise order as well.
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
%    14 February 2003
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
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM),
%    the nodes that make up the triangles.  These should be listed
%    in counterclockwise order.
%
%    Output, logical NODE_BOUNDARY(NODE_NUM), is TRUE if the node
%    is on a boundary edge.
%
  m = 2;
  n = 3 * triangle_num;
%
%  Set up the edge array.
%
  edge(1:2,               1:  triangle_num) = triangle_node(1:2,1:triangle_num);
  edge(1:2,  triangle_num+1:2*triangle_num) = triangle_node(2:3,1:triangle_num);
  edge(1,  2*triangle_num+1:3*triangle_num) = triangle_node(3,  1:triangle_num);
  edge(2,  2*triangle_num+1:3*triangle_num) = triangle_node(1,  1:triangle_num);
%
%  In each column, force the smaller entry to appear first.
%
  e1(1:n) = min ( edge(1:2,1:n) );
  e2(1:n) = max ( edge(1:2,1:n) );

  edge(1,1:n) = e1(1:n);
  edge(2,1:n) = e2(1:n);
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

