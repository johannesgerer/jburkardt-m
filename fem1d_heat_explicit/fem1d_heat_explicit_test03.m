function fem1d_heat_explicit_test03 ( )

%*****************************************************************************80
%
%% FEM1D_HEAT_EXPLICIT_TEST03 does a simple test problem.
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
  fprintf ( 1, 'FEM1D_HEAT_EXPLICIT_TEST03:\n' );
  fprintf ( 1, '  Using the finite element method,\n' );
  fprintf ( 1, '  compute an approximate solution to the time-dependent\n' );
  fprintf ( 1, '  one dimensional heat equation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    dH/dt - K * d2H/dx2 = f(x,t)\n' );
%
%  Set the nodes.
%
  x_num = 21;
  x_min = -5.0;
  x_max = +5.0;
  dx = ( x_max - x_min ) / ( x_num - 1 );
  x = ( linspace ( x_min, x_max, x_num ) )';
%
%  Set the times.
%
  t_num = 321;
  t_min = 0.0;
  t_max = 4.0;
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
  fprintf ( 1, '  X interval is [%f,%f]\n', x_min, x_max );
  fprintf ( 1, '  X step size = %f\n', dx );
  fprintf ( 1, '  Number of T steps = %d\n', t_num );
  fprintf ( 1, '  T interval is [%f,%f]\n', t_min, t_max );
  fprintf ( 1, '  T stepsize is %f\n', dt );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Number of quadrature points = %d\n', quad_num );
%
%  Running the code produces an array H of temperatures H(t,x),
%  and vectors x and t.
%
  h_mat = zeros ( x_num, t_num );

  for j = 1 : t_num
    if ( j == 1 )
      h = ic_test03 ( x_num, x, t(j) );
      h = bc_test03 ( x_num, x, t(j), h );
    else
      h(1:x_num,1) = fem1d_heat_explicit ( x_num, x, t(j-1), dt, @k_test03, ...
        @rhs_test03, @bc_test03, element_num, element_node, quad_num, mass, h );
    end
    h_mat(1:x_num,j) = h(1:x_num);
  end
%
%  Plot the data.
%
  figure ( 3 )
  [ t_mat, x_mat ] = meshgrid ( t, x );
  mesh ( t_mat, x_mat, h_mat );
  title ( 'H(X,T) for TEST03 computed by FEM1D\_HEAT\_EXPLICIT' );
  xlabel ( '<-- Time -->' );
  ylabel ( '<-- X -->' );
  zlabel ( '<--  H(X,T) -->' );
%
%  Write the data to files.
%
  r8mat_write ( 'h_test03.txt', x_num, t_num, h_mat );
  r8vec_write ( 't_test03.txt', t_num, t );
  r8vec_write ( 'x_test03.txt', x_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  H(X,T) written to "h_test03.txt"\n' );
  fprintf ( 1, '  T values written to "t_test03.txt"\n' );
  fprintf ( 1, '  X values written to "x_test3.txt"\n' );

  return
end
