function fem1d_heat_explicit_test01 ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_EXPLICIT_TEST01 runs a simple test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_EXPLICIT_TEST01:\n' );
  fprintf ( 1, '  The time dependent 1D heat equation is\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Ut - k * Uxx = f(x,t)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  for space interval A <= X <= B with boundary conditions\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    U(A,t) = UA(t)\n' );
  fprintf ( 1, '    U(B,t) = UB(t)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and time interval T0 <= T <= T1 with initial condition\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    U(X,T0) = U0(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To compute an approximate solution:\n' );
  fprintf ( 1, '    the interval [A,B] is replace by a discretized mesh Xi;\n' );
  fprintf ( 1, '    a set of finite element functions PSI(X) are determined,\n' );
  fprintf ( 1, '    the solution U is written as a weighted sum of the basis functions,\n' );
  fprintf ( 1, '    the weak form of the differential equation is written,\n' );
  fprintf ( 1, '    a time grid Tj is imposed, and time derivatives replaced by\n' );
  fprintf ( 1, '    an explicit forward Euler first difference,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    The continuous PDE has now been transformed into a set of algebraic\n' );
  fprintf ( 1, '    equations for the coefficients C(Xi,Tj).\n' );
%
%  Set the nodes.
%
  x_num = 21;
  x_min = 0.0;
  x_max = 1.0;
  dx = ( x_max - x_min ) / ( x_num - 1 );
  x = ( linspace ( x_min, x_max, x_num ) )';
%
%  Set the times.
%
  t_num = 401;
  t_min = 0.0;
  t_max = 80.0;
  dt = ( t_max - t_min ) / ( t_num - 1 );
  t = ( linspace ( t_min, t_max, t_num ) )';
%
%  Set finite element information.
%
  element_num = x_num - 1;
  element_node(1,1:element_num) = 1 : x_num - 1;
  element_node(2,1:element_num) = 2 : x_num;
  quad_num = 3;
  mass = assemble_mass ( x_num, x, element_num, element_node, quad_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of X nodes = %d\n', x_num );
  fprintf ( 1, '  X interval = [ %f, %f ]\n', x_min, x_max );
  fprintf ( 1, '  X step size = %f\n', dx );
  fprintf ( 1, '  Number of T steps = %d\n', t_num );
  fprintf ( 1, '  T interval = [ %f, %f ]\n', t_min, t_max );
  fprintf ( 1, '  T step size = %f\n', dt );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Number of quadrature points = %d\n', quad_num );

  u_mat = zeros ( x_num, t_num );

  for j = 1 : t_num

    if ( j == 1 )

      u(1:x_num,1) = ic_test01 ( x_num, x, t(j) );
      u(1:x_num,1) = bc_test01 ( x_num, x, t(j), u(1:x_num,1) );

    else

      u(1:x_num,1) = fem1d_heat_explicit ( x_num, x, t(j-1), dt, @k_test01, ...
        @rhs_test01, @bc_test01, element_num, element_node, quad_num, mass, u );

    end

    u_mat(1:x_num,j) = u(1:x_num,1);

  end
%
%  Make a product grid of T and X for plotting.
%
  [ t_mat, x_mat ] = meshgrid ( t, x );
%
%  Make a mesh plot of the solution.
%
  mesh ( t_mat, x_mat, u_mat )
  xlabel ( '<--Time-->' )
  ylabel ( '<--X-->' )
  zlabel ( '<--H(X,T)-->' )
  title ( 'H(X,T) for TEST01, by FEM1D\_HEAT\_EXPLICIT' )
%
%  Write the data to files.
%
  r8mat_write ( 'h_test01.txt', x_num, t_num, u_mat );
  r8vec_write ( 't_test01.txt', t_num, t );
  r8vec_write ( 'x_test01.txt', x_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  H(X,T) written to "h_test01.txt"\n' );
  fprintf ( 1, '  T values written to "t_test01.txt"\n' );
  fprintf ( 1, '  X values written to "x_test01.txt"\n' );

  return
end
