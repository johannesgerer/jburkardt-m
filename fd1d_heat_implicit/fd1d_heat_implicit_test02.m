function fd1d_heat_implicit_test02 ( )

%*****************************************************************************80
%
%% FD1D_HEAT_IMPLICIT_TEST02 does a problem with known solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 January 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_IMPLICIT_TEST02:\n' );
  fprintf ( 1, '  Compute an approximate solution to the time-dependent\n' );
  fprintf ( 1, '  one dimensional heat equation for a problem where we\n' );
  fprintf ( 1, '  know the exact solution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    dH/dt - K * d2H/dx2 = f(x,t)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Run a simple test case.\n' );
%
%  Heat coefficient.
%
  k = k_test02 ( );
%
%  X_NUM is the number of equally spaced nodes to use between 0 and 1.
%
  x_num = 21;
  x_min = 0.0;
  x_max = 1.0;
  dx = ( x_max - x_min ) / ( x_num - 1 );
  x = linspace ( x_min, x_max, x_num );
%
%  T_NUM is the number of equally spaced time points between 0 and 10.0.
%
  t_num = 26;
  t_min = 0.0;
  t_max = 10.0;
  dt = ( t_max - t_min ) / ( t_num - 1 );
  t = linspace ( t_min, t_max, t_num );
%
%  Get the CFL coefficient.
%
  cfl = fd1d_heat_implicit_cfl ( k, t_num, t_min, t_max, x_num, x_min, x_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of X nodes = %d\n', x_num );
  fprintf ( 1, '  X interval is [%f,%f]\n', x_min, x_max );
  fprintf ( 1, '  X spacing is %f\n', dx );
  fprintf ( 1, '  Number of T values = %d\n', t_num );
  fprintf ( 1, '  T interval is [%f,%f]\n', t_min, t_max );
  fprintf ( 1, '  T spacing is %f\n', dt );
  fprintf ( 1, '  Constant K = %g\n', k );
  fprintf ( 1, '  CFL coefficient = %g\n', cfl );
%
%  Get the system matrix.
%
  a = fd1d_heat_implicit_matrix ( x_num, cfl );

  gmat = zeros ( x_num, t_num );
  hmat = zeros ( x_num, t_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step            Time       RMS Error\n' );
  fprintf ( 1, '\n' );

  for j = 1 : t_num

    if ( j == 1 )
      h = ic_test02 ( x_num, x, t(j) );
      h = bc_test02 ( x_num, x, t(j), h );
    else
      h = fd1d_heat_implicit ( a, x_num, x, t(j-1), dt, cfl, @rhs_test02, @bc_test02, h );
    end

    g = exact_test02 ( x_num, x, t(j) );
    e = norm ( h(1:x_num) - g(1:x_num) ) / sqrt ( x_num );
    fprintf ( 1, '  %4d  %14.6g  %14.6g\n', j, t(j), e );
    gmat(1:x_num,j) = g(1:x_num);
    hmat(1:x_num,j) = h(1:x_num);

  end
%
%  Plot the data.
%
  figure ( 2 )
  [ tmat, xmat ] = meshgrid ( t, x );
  mesh ( tmat, xmat, hmat );
  title ( 'H(X,T) for TEST02 computed by FD1D\_HEAT\_IMPLICIT' );
  xlabel ( '<-- Time -->' );
  ylabel ( '<-- X -->' );
  zlabel ( '<--  H(X,T) -->' );
%
%  Write the data to files.
%
  r8mat_write ( 'g_test02.txt', x_num, t_num, gmat );
  r8mat_write ( 'h_test02.txt', x_num, t_num, hmat );
  r8vec_write ( 't_test02.txt', t_num, t );
  r8vec_write ( 'x_test02.txt', x_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  G(X,T) written to "g_test02.txt"\n' );
  fprintf ( 1, '  H(X,T) written to "h_test02.txt"\n' );
  fprintf ( 1, '  T values written to "t_test02.txt"\n' );
  fprintf ( 1, '  X values written to "x_test02.txt"\n' );
  return
end
