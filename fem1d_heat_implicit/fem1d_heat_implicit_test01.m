function fem1d_heat_implicit_test01 ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_IMPLICIT_TEST01 runs a simple test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_HEAT_IMPLICIT_TEST01:\n' );
  fprintf ( 1, '  Using the finite element method,\n' );
  fprintf ( 1, '  compute an approximate solution to the time-dependent\n' );
  fprintf ( 1, '  one dimensional heat equation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    dH/dt - K * d2H/dx2 = f(x,t)\n' );
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
  t_num = 201;
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

      u(1:x_num,1) = fem1d_heat_implicit ( x_num, x, t(j), dt, @k_test01, ...
        @rhs_test01, @bc_test01, element_num, element_node, quad_num, u );

    end

    u(1:x_num,1) = bc_test01 ( x_num, x, t(j), u(1:x_num,1) );
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
  title ( 'H(X,T) for TEST01, by FEM1D\_HEAT\_IMPLICIT' )
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
