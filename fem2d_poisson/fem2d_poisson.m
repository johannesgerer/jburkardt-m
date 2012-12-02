function fem2d_poisson ( prefix )

%*****************************************************************************80
%
%% MAIN is the main routine for FEM2D_POISSON.
%
%  Discussion:
%
%    This program solves the Poisson equation
%
%      -Laplacian U(X,Y) + K(X,Y) * U = F(X,Y)
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
%    The user specifies the coefficient function K(X,Y) of the Poisson
%    equation by supplying a routine of the form
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
%    fem2d_poisson ( 'prefix' )
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
%    * prefix_solution.txt, the value of the solution at every node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, real A(3*IB+1,NODE_NUM), the coefficient matrix.
%
%    Local, real EH1, the H1 seminorm error.
%
%    Local, real EL2, the L2 error.
%
%    Local, integer ELEMENT_NODE[3*ELEMENT_NUM];
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Local, integer ELEMENT_NUM, the number of elements.
%
%    Local, integer ELEMENT_ORDER, the element order.
%
%    Local, real F(NODE_NUM), the right hand side.
%
%    Local, integer IB, the half-bandwidth of the matrix.
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
  quad_num = 7;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON:\n' );
  fprintf ( 1, '  MATLAB version\n' );
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
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current status:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * Boundary conditions cannot be set easily.\n' );
  fprintf ( 1, '\n' );
%
%  Create the file names.
%
  node_filename = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  node_eps_filename = strcat ( prefix, '_nodes.eps' );
  element_eps_filename = strcat ( prefix, '_elements.eps' );
  solution_filename = strcat ( prefix, '_solution.txt' );

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

  if ( element_order ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_POISSON - Fatal error!\n' );
    fprintf ( 1, '  The input triangulation has order %d.\n', element_order );
    fprintf ( 1, '  However, a triangulation of order 3 is required.' );
    error ( 'FEM2D_POISSON - Fatal error!' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

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

  if ( debugging )
    lvec_print ( node_num, node_boundary, '    Node  Boundary?' );
  end
%
%  Determine the node conditions.
%  For now, we'll just assume all boundary nodes are Dirichlet.
%
  node_condition(1:node_num,1) = 1;

  for node = 1 : node_num
    if ( node_boundary(node,1) )
      node_condition(node,1) = 2;
    end
  end
%
%  Determine the bandwidth of the coefficient matrix.
%
  ib = bandwidth ( element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix half bandwidth is %d\n', ib );
  fprintf ( 1, '  The matrix bandwidth is      %d\n', 2 * ib + 1 );
  fprintf ( 1, '  The storage bandwidth is     %d\n', 3 * ib + 1 );
%
%  Make a picture of the nodes.
%
  if ( node_num <= 1000 )

    if ( node_num <= 100 )
      node_label = 1;
    else
      node_label = 0;
    end

    points_plot ( node_eps_filename, node_num, node_xy, node_label );

  end
%
%  Make a picture of the elements.
%
  if ( node_num <= 1000 )

    if ( node_num <= 100 )
      node_show = 2;
    elseif ( node_num <= 250 )
      node_show = 1;
    else
      node_show = 0;
    end

    if ( element_num <= 100 )
      triangle_show = 2;
    else
      triangle_show = 1;
    end

    triangulation_order3_plot ( element_eps_filename, node_num, ...
      node_xy, element_num, element_node, node_show, triangle_show );

  end
%
%  Assemble the finite element coefficient matrix A and the right-hand side F.
%
  [ a, f ] = assemble_poisson ( node_num, node_xy, ...
    element_num, element_node, quad_num, ib );
%
%  Print a tiny portion of the matrix.
%
  if ( debugging )

    dgb_print_some ( node_num, node_num, ib, ib, a, 1, 1, 10, 10, ...
      '  Initial block of finite element matrix A:' );

    r8vec_print_some ( node_num, f, 1, 10, '  Part of right hand side vector:' );

  end
%
%  Adjust the linear system to account for Dirichlet boundary conditions.
%
  [ a, f ] = dirichlet_apply ( node_num, node_xy, node_condition, ib, a, f );

  if ( debugging )

    dgb_print_some ( node_num, node_num, ib, ib, a, 1, 1, 10, 10, ...
      '  Matrix A after boundary condition adjustments:' );

    r8vec_print_some ( node_num, f, 1, 10, '  Part of right hand side vector:' );

  end
%
%  Solve the linear system using a banded solver.
%
  [ a, pivot, ierr] = dgb_fa ( node_num, ib, ib, a );

  if ( ierr ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM2D_POISSON - Fatal error!\n' );
    fprintf ( 1, '  DGB_FA returned an error condition.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The linear system was not factored, and the\n' );
    fprintf ( 1, '  algorithm cannot proceed.\n' );
    error ( 'FEM2D_POISSON - Fatal error!' );
  end

  job = 0;
  node_u(1:node_num,1) = f(1:node_num,1);

  node_u = dgb_sl ( node_num, ib, ib, a, pivot, node_u, job );

  r8vec_print_some ( node_num, node_u, 1, 10, ...
    '  Part of the solution vector:' );

  node_r = residual_poisson ( node_num, node_xy, node_condition, ...
    element_num, element_node, quad_num, ib, a, f, node_u );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum absolute residual = %f\n',  ...
    max ( abs ( node_r(1:node_num,1) ) ) );
%
%  Write an ASCII file that can be read into MATLAB.
%
  r8mat_write ( solution_filename, node_num, 1, node_u );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON:\n' );
  fprintf ( 1, '  Wrote an ASCII file\n' );
  fprintf ( 1, '    "%s"\n', solution_filename );
  fprintf ( 1, '  of the form\n' );
  fprintf ( 1, '    U ( X(I), Y(I) )\n' );
  fprintf ( 1, '  which can be used for plotting.\n' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POISSON:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, f ] = assemble_poisson ( node_num, node_xy, ...
  element_num, element_node, quad_num, ib )

%*****************************************************************************80
%
%% ASSEMBLE_POISSON assembles the system for the Poisson equation.
%
%  Discussion:
%
%    The matrix is known to be banded.  A special matrix storage format
%    is used to reduce the space required.  Details of this format are
%    discussed in the routine DGB_FA.
%
%    Note that a 3 point quadrature rule, which is sometimes used to
%    assemble the matrix and right hand side, is just barely accurate
%    enough for simple problems.  If you want better results, you
%    should use a quadrature rule that is more accurate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2010
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
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM);
%    element_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Output, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format.
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
  a(1:3*ib+1,1:node_num) = 0.0;
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

          a(i-j+2*ib+1,j) = a(i-j+2*ib+1,j) + w(quad,1) * ( ...
            phys_h(quad) * ( dbidx * dbjdx + dbidy * dbjdy ) ...
            + phys_k(quad) * bj * bi );

        end

      end

    end

  end

  return
end
function nhba = bandwidth ( element_num, element_node )

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
%    30 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Output, integer NHBA, the half bandwidth of the matrix.
%
  nhba = 0;

  for element = 1 : element_num
    for local_i = 1 : 3
      global_i = element_node(local_i,element);
      for local_j = 1 : 3
        global_j = element_node(local_j,element);
        nhba = max ( nhba, abs ( global_j - global_i ) );
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
%    15 February 2006
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

  ip1 = i4_wrap ( i + 1, 1, 3 );
  ip2 = i4_wrap ( i + 2, 1, 3 );

  qi = ( ( t(1,ip2) - t(1,ip1) ) * ( p(2) - t(2,ip1) ) ...
       - ( t(2,ip2) - t(2,ip1) ) * ( p(1) - t(1,ip1) ) ) / area;

  dqidx = - ( t(2,ip2) - t(2,ip1) ) / area;
  dqidy =   ( t(1,ip2) - t(1,ip1) ) / area;

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
%    Input, real A(2*ML+MU+1,N), the matrix in band storage.  The
%    columns of the matrix are stored in the columns of the array,
%    and the diagonals of the matrix are stored in rows ML+1 through
%    2*ML+MU+1.
%
%    Output, real ALU(2*ML+MU+1,N), the LU factors in band storage.
%    The L and U matrices are stored in a single array.
%
%    Output, integer PIVOT(N,1), the pivot vector.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  alu = a(1:2*ml+mu+1,1:n);
  pivot = zeros ( n, 1 );

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
      alu(1:ml,jz) = 0.0;
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

    pivot(k,1) = l + k - m;
%
%  Zero pivot implies this column already triangularized.
%
    if ( alu(l,k) == 0.0 )
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
    ju = max ( ju, mu+pivot(k,1) );
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

  pivot(n,1) = n;

  if ( alu(m,n) == 0.0 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DGB_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
  end

  return
end
function b = dgb_mxv ( m, n, ml, mu, a, x )

%*****************************************************************************80
%
%% DGB_MXV multiplies a DGB matrix times a vector.
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
%    LINPACK and LAPACK storage of general band matrices requires
%    an extra ML upper diagonals for possible fill in entries during
%    Gauss elimination.  This routine does not access any entries
%    in the fill in diagonals, because it assumes that the matrix
%    has NOT had Gauss elimination applied to it.  If the matrix
%    has been Gauss eliminated, then the routine DGB_MU must be
%    used instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
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
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(2*ML+MU+1,N), the DGB matrix.
%
%    Input, real X(N,1), the vector to be multiplied by A.
%
%    Output, real B(M,1), the product A * x.
%
  b(1:m,1) = 0.0;

  for i = 1 : m
    jlo = max ( 1, i - ml );
    jhi = min ( n, i + mu );
    for j = jlo : jhi
      b(i,1) = b(i,1) + a(i-j+ml+mu+1,j) * x(j,1);
    end
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

  return
end
function x = dgb_sl ( n, ml, mu, a, pivot, b, job )

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
%    30 September 2003
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
%    Input, real A(2*ML+MU+1,N), the LU factors from DGB_FA.
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
  x(1:n,1) = b(1:n,1);

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
        l = pivot(k,1);

        if ( l ~= k )
          t = x(l,1);
          x(l,1) = x(k,1);
          x(k,1) = t;
        end

        for i = 1 : lm
          x(k+i,1) = x(k+i,1) + x(k,1) * a(m+i,k);
        end

      end
    end
%
%  Solve U * X = Y.
%
    for k = n : -1 : 1

      x(k,1) = x(k,1) / a(m,k);
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;

      for i = 0: lm-1
        x(lb+i,1) = x(lb+i,1) - x(k,1) * a(la+i,k);
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
        x(k,1) = x(k,1) - a(la+i,k) * x(lb+i,1);
      end
      x(k,1) = x(k,1) / a(m,k);
    end
%
%  Solve L' * X = Y.
%
    if ( 1 <= ml )

      for k = n-1: -1 : 1

        lm = min ( ml, n-k );
        for i = 1 : lm
          x(k,1) = x(k,1) + a(m+i,k) * x(k+i,1);
        end
        l = pivot(k,1);

        if ( l ~= k )
          t = x(l,1);
          x(l,1) = x(k);
          x(k,1) = t;
        end

      end

    end

  end

  return
end
function [ a, f ] = dirichlet_apply ( node_num, node_xy, node_condition, ...
  ib, a, f )

%*****************************************************************************80
%
%% DIRICHLET_APPLY accounts for Dirichlet boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
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
%    Input, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format.
%
%    Input, real F(NODE_NUM), the right hand side.
%
%    Output, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format,
%    adjusted for Dirichlet boundary conditions.
%
%    Output, real F(NODE_NUM), the right hand side, adjusted for
%    Dirichlet boundary conditions.
%
  node_bc = dirichlet_condition ( node_num, node_xy );

  DIRICHLET = 2;

  for node = 1 : node_num

    if ( node_condition(node) == DIRICHLET )

      column_low = max ( node - ib, 1 );
      column_high = min ( node + ib, node_num );

      for column = column_low : column_high
        a(node-column+2*ib+1,column) = 0.0;
      end
      a(2*ib+1,node) = 1.0;

      f(node) = node_bc(node);

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
function value = i4_modp ( i, j )

%*****************************************************************************80
%
%% I4_MODP returns the nonnegative remainder of integer division.
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
%    06 June 2005
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
  if ( i < 1 | n < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index I is out of bounds.\n' );
    error ( 'I4COL_COMPARE - Fatal error!' );
  end

  if ( j < 1 | n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index J is out of bounds.\n' );
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
%% I4COL_SORT_A ascending sorts an integer array of columns.
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
%    31 January 2005
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
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%8d      ', a(i,j) );
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
%    Input, character ( len = * ) TITLE, a title to be printed first.
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
function node_r = residual_poisson ( node_num, node_xy, node_condition, ...
  element_num, element_node, quad_num, ib, a, f, node_u )

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
%    14 November 2006
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
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Workspace, real A(3*IB+1,NODE_NUM), the NODE_NUM by NODE_NUM
%    coefficient matrix, stored in a compressed format.
%
%    Workspace, real F(NODE_NUM), the right hand side.
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
  a(1:3*ib+1,1:node_num) = 0.0;
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
%  Map the quadrature points QUAD_XY to physical points PHYS_XY
%  in the physical element.
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

          a(i-j+2*ib+1,j) = a(i-j+2*ib+1,j) + w(quad) * ( ...
            phys_h(quad) * ( dbidx * dbjdx + dbidy * dbjdy ) ...
            + phys_k(quad) * bj * bi );

        end

      end

    end

  end
%
%  Apply boundary conditions.
%
  [ a, f ] = dirichlet_apply ( node_num, node_xy, node_condition, ib, a, f );
%
%  Compute A*U.
%
  node_r = dgb_mxv ( node_num, node_num, ib, ib, a, node_u );
%
%  Set RES = A * U - F.
%
  node_r(1:node_num,1) = node_r(1:node_num,1) - f(1:node_num,1);

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
%    Output, integer LENGTH, the length of the string up to the last nonblank.
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
function [ u, dudx, dudy ] = solution_evaluate ( xy, t, node_u )

%*****************************************************************************80
%
%% SOLUTION_EVALUATE evaluates the solution at a point in a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XY(2), the point at which the solution is to be evaluated.
%
%    Input, real T(2,3), the coordinates of the vertices of the triangle containing XY.
%
%    Input, real NODE_U(3), the value of the finite element coefficients at the vertices.
%
  u = 0.0;
  dudx = 0.0;
  dudy = 0.0;

  for i = 1 : 3

    [ b, dbdy, dbdy ] = basis_all_t3 ( t, i, xy );

    u    = u    + node_u(i) * b;
    dudx = dudx + node_u(i) * dbdx;
    dudy = dudy + node_u(i) * dbdy;

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
function [ b, dbdx, dbdy ] = triangle_order3_basis ( x, y, xn, yn, node )

%*****************************************************************************80
%
%% TRIANGLE_ORDER3_BASIS evaluates a linear triangle basis function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of the point where
%    the basis function is to be evaluated.
%
%    Input, real XN(3), YN(3), the coordinates of the vertices
%    of the triangle.  It is common to list these points in counter clockwise
%    order.
%
%    Input, integer NODE, the index of the basis function to be evaluated.
%
%    Output, real B, DBDX, DBDY, the value of the basis
%    function, and its X and Y derivatives at (X,Y).
%
  if ( node == 1 )

    d =         ( xn(3) - xn(2) ) * ( yn(1) - yn(2) )     ...
              - ( yn(3) - yn(2) ) * ( xn(1) - xn(2) );

    b =     (   ( xn(3) - xn(2) ) * ( y     - yn(2) )     ...
              - ( yn(3) - yn(2) ) * ( x     - xn(2) ) ) / d;
    dbdx =    - ( yn(3) - yn(2) )                       / d;
    dbdy =      ( xn(3) - xn(2) )                       / d;

  elseif ( node == 2 )

    d =         ( xn(1) - xn(3) ) * ( yn(2) - yn(3) )     ...
              - ( yn(1) - yn(3) ) * ( xn(2) - xn(3) );

    b =     (   ( xn(1) - xn(3) ) * ( y     - yn(3) )     ...
              - ( yn(1) - yn(3) ) * ( x     - xn(3) ) ) / d;
    dbdx =    - ( yn(1) - yn(3) )                       / d;
    dbdy =      ( xn(1) - xn(3) )                       / d;

  elseif ( node == 3 )

    d =         ( xn(2) - xn(1) ) * ( yn(3) - yn(1) )     ...
              - ( yn(2) - yn(1) ) * ( xn(3) - xn(1) );

    b =     (   ( xn(2) - xn(1) ) * ( y     - yn(1) )     ...
              - ( yn(2) - yn(1) ) * ( x     - xn(1) ) ) / d;
    dbdx =    - ( yn(2) - yn(1) )                       / d;
    dbdy =      ( xn(2) - xn(1) )                       / d;

  else
    fprintf ( 1, '\n');
    fprintf ( 1, 'TRIANGLE_ORDER3_BASIS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of NODE = %d\n', node );
    error ( 'TRIANGLE_ORDER3_BASIS - Fatal error!' );
  end

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
%    30 July 2005
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
%    Output, logical NODE_BOUNDARY(NODE_NUM,1), is TRUE if the node
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
  e1(1,1:n) = min ( edge(1:2,1:n) );
  e2(1,1:n) = max ( edge(1:2,1:n) );

  edge(1,1:n) = e1(1,1:n);
  edge(2,1:n) = e2(1,1:n);
%
%  Ascending sort the column array.
%
  edge = i4col_sort_a ( m, n, edge );
%
%  Records which appear twice are internal edges and can be ignored.
%
  node_boundary(1:node_num,1) = 0;

  i = 0;

  while ( i < 3 * triangle_num )

    i = i + 1;

    if ( i == 3 * triangle_num )
      node_boundary(edge(1:m,i),1) = 1;
    elseif ( all ( edge(1:m,i) == edge(1:m,i+1) ) )
      i = i + 1;
    else
      node_boundary(edge(1:m,i),1) = 1;
    end

  end

  return
end
function triangulation_order3_plot ( file_name, node_num, node_xy, ...
  triangle_num, triangle_node, node_show, triangle_show )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_PLOT plots a 3-node triangulation of a pointset.
%
%  Discussion:
%
%    The triangulation is most usually a Delaunay triangulation,
%    but this is not necessary.
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
%    Input, string FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), lists, for each triangle,
%    the indices of the points that form the vertices of the triangle.
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
    fprintf ( 1, 'TRIANGULATION_ORDER3_PLOT - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'TRIANGULATION_ORDER3_PLOT - Fatal error!' );
  end

  fprintf ( file_unit, '%%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%%%Creator: triangulation_order3_plot.m\n' );
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
    fprintf ( file_unit, '%%  Draw the triangles.\n' );
    fprintf ( file_unit, '%%\n' );

    for triangle = 1 : triangle_num

      fprintf ( file_unit, 'newpath\n' );

      for i = 1 : 4

        e = i;
        if ( e == 4 )
          e = 1;
        end

        node = triangle_node(e,triangle);

        x_ps = floor ( ...
          ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
          + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
          / ( x_max                   - x_min ) );

        y_ps = floor ( ...
          ( ( y_max - node_xy(2,node)         ) * y_ps_min ...
          + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
          / ( y_max                   - y_min ) );

        if ( i == 1 )
          fprintf ( file_unit, '  %d  %d  moveto\n', x_ps, y_ps );
        else
          fprintf ( file_unit, '  %d  %d  lineto\n', x_ps, y_ps );
        end

      end

      fprintf ( file_unit, 'stroke\n' );

    end

  end
%
%  Label the triangles.
%
  if ( 2 <= triangle_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the triangles.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.950  0.250  0.150 setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.20 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );
    fprintf ( file_unit, '%%\n' );

    for triangle = 1 : triangle_num

      ave_x = 0.0;
      ave_y = 0.0;

      for i = 1 : 3

        node = triangle_node(i,triangle);
        ave_x = ave_x + node_xy(1,node);
        ave_y = ave_y + node_xy(2,node);
      end

      ave_x = ave_x / 3.0;
      ave_y = ave_y / 3.0;

      x_ps = floor ( ...
        ( ( x_max - ave_x         ) * x_ps_min ...
        + (         ave_x - x_min ) * x_ps_max ) ...
        / ( x_max         - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - ave_y         ) * y_ps_min ...
        + (         ave_y - y_min ) * y_ps_max ) ...
        / ( y_max         - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        x_ps, y_ps, triangle );

    end
  end

  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'restore  showpage\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  End of page.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%%%Trailer\n' );
  fprintf ( file_unit, '%%%%EOF\n' );

  fclose ( file_unit );

  return
end
