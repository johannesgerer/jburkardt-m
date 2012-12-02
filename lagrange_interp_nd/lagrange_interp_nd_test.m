function lagrange_interp_nd_test ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST tests the LAGRANGE_INTERP_ND library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LAGRANGE_INTERP_ND library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
%
%  Use the interface that passes in the orders directly.
%
  lagrange_interp_nd_test01 ( );
  lagrange_interp_nd_test02 ( );
  lagrange_interp_nd_test03 ( );
  lagrange_interp_nd_test04 ( );
%
%  Repeat tests 1, 2, 3, and 4,
%  using the interface that passes in the orders indirectly,
%  based on the "level".
%
  lagrange_interp_nd_test05 ( );
  lagrange_interp_nd_test06 ( );
  lagrange_interp_nd_test07 ( );
  lagrange_interp_nd_test08 ( );
%
%  Experiment with anisotropic orders.
%
  lagrange_interp_nd_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )

  return
end
function lagrange_interp_nd_test01 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST01 interpolates in 1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST01:\n' );
  fprintf ( 1, '  Interpolate in 1D, using orders.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE evaluates it.\n' );

  m = 1;
  n_1d(1:m,1) = 5;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size ( m, n_1d );
  xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test02 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST02 interpolates in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST02:\n' );
  fprintf ( 1, '  Interpolate in 2D, using orders.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE evaluates it.\n' );

  m = 2;
  n_1d(1:m,1) = 5;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size ( m, n_1d );
  xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test03 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST03 interpolates in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST03:\n' );
  fprintf ( 1, '  Interpolate in 3D, using orders.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE evaluates it.\n' );

  m = 3;
  n_1d(1:m,1) = 5;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size ( m, n_1d );
  xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test04 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST04 interpolates in 3D, using increasing resolution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST04:\n' );
  fprintf ( 1, '  Interpolate in 3D, using orders.\n' );
  fprintf ( 1, '  Use a sequence of increasing orders.\n' );

  m = 3;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  ni = 20;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level     Order   Average Error\n' );
  fprintf ( 1, '\n' );

  for l = 0 : 5

    if ( l == 0 )
      order = 1;
    else
      order = 2 ^ l + 1;
    end
    n_1d(1:m,1) = order;
  
    nd = lagrange_interp_nd_size ( m, n_1d );
    xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd );
    zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
    zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi );

    e = r8vec_norm_affine ( ni, zi, ze ) / ni;

    fprintf ( 1, '  %5d  %8d  %10.2e\n', l, nd, e );

  end

  return
end
function lagrange_interp_nd_test05 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST05 repeats test 1 using levels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST05:\n' );
  fprintf ( 1, '  Repeat test #1, using levels.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID2 sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE2 evaluates it.\n' );

  m = 1;
  ind(1:m) = 2;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size2 ( m, ind );
  xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test06 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST06 repeats test 2 using levels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST06:\n' );
  fprintf ( 1, '  Repeat test #2, using levels.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID2 sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE2 evaluates it.\n' );

  m = 2;
  ind(1:m) = 2;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size2 ( m, ind );
  xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test07 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST07 repeats test 3 using levels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST07:\n' );
  fprintf ( 1, '  Repeat test #3,  using levels.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_GRID2 sets the interpolant.\n' );
  fprintf ( 1, '  LAGRANGE_INTERP_ND_VALUE2 evaluates it.\n' );

  m = 3;
  ind(1:m) = 2;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  nd = lagrange_interp_nd_size2 ( m, ind );
  xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd );
  zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '         Zinterp          Zexact      Error\n' );
  fprintf ( 1, '\n' );

  ni = 5;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );
  zi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi );

  for j = 1 : ni
    fprintf ( 1, '  %14.6g  %14.6g  %10.2e\n', zi(j), ze(j), abs ( zi(j) - ze(j) ) );
  end

  return
end
function lagrange_interp_nd_test08 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST08 repeats test 4 using levels.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST08:\n' );
  fprintf ( 1, '  Interpolate in 3D, using levels.\n' );
  fprintf ( 1, '  Use a sequence of increasing levels.\n' );

  m = 3;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  ni = 20;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_sinr ( m, ni, xi );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level     Order   Average Error\n' );
  fprintf ( 1, '\n' );

  for l = 0 : 5

    ind(1:m) = l;
  
    nd = lagrange_interp_nd_size2 ( m, ind );
    xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd );
    zd = f_sinr ( m, nd, xd );
%
%  Evaluate.
%
    zi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi );

    e = r8vec_norm_affine ( ni, zi, ze ) / ni;

    fprintf ( 1, '  %5d  %8d  %10.2e\n', l, nd, e );

  end

  return
end
function lagrange_interp_nd_test09 ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_TEST09 interpolates in 3D, using anisotropic resolution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_ND_TEST09:\n' );
  fprintf ( 1, '  Interpolate in 3D, using orders.\n' );
  fprintf ( 1, '  Use a sequence of increasing orders.\n' );
  fprintf ( 1, '  Use anisotropic resolution.\n' );
  fprintf ( 1, '  The interpoland is a polynomial of degrees 3, 5, 2\n' );
  fprintf ( 1, '  so our orders need to be at least 4, 6, 3 to match it.\n' );

  m = 3;
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  ni = 20;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  ze = f_poly352 ( m, ni, xi );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level     Orders   Average Error\n' );
  fprintf ( 1, '\n' );

  for l = 0 : 10

    if ( l == 0 )
      n_1d(1:m,1) = [ 1, 1, 1 ];
    elseif ( l == 1 )
      n_1d(1:m,1) = [ 2, 1, 1 ];
    elseif ( l == 2 )
      n_1d(1:m,1) = [ 1, 2, 1 ];
    elseif ( l == 3 )
      n_1d(1:m,1) = [ 1, 1, 2 ];
    elseif ( l == 4 )
      n_1d(1:m,1) = [ 4, 2, 2 ];
    elseif ( l == 5 )
      n_1d(1:m,1) = [ 2, 4, 2 ];
    elseif ( l == 6 )
      n_1d(1:m,1) = [ 2, 2, 4 ];
    elseif ( l == 8 )
      n_1d(1:m,1) = [ 6, 4, 4 ];
    elseif ( l == 9 )
      n_1d(1:m,1) = [ 4, 6, 4 ];
    elseif ( l == 10 )
      n_1d(1:m,1) = [ 4, 4, 6 ];
    end
  
    nd = lagrange_interp_nd_size ( m, n_1d );
    xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd );
    zd = f_poly352 ( m, nd, xd );
%
%  Evaluate.
%
    zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi );

    e = r8vec_norm_affine ( ni, zi, ze ) / ni;

    fprintf ( 1, '  %5d  %2d  %2d  %2d  %10.2e\n', l, n_1d(1:3), e );

  end

  return
end
function z = f_sinr ( m, n, x )

%*****************************************************************************80
%
%% F_SINR is a scalar function of an M-dimensional argument, to be interpolated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the points.
%
%    Output, real Z(N,1), the value of the function at each point.
%
  r = zeros ( n, 1 );
  for j = 1 : n
    r(j,1) = norm ( x(1:m,j) );
  end

  z = sin ( r );

  return
end
function z = f_poly352 ( m, n, x )

%*****************************************************************************80
%
%% F_POLY253 is a scalar function of a 3-dimensional argument, to be interpolated.
%
%  Discussion:
%
%    The polynomial is of maximum degrees 3, 5, and 2, in the three variables.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the points.
%
%    Output, real Z(N,1), the value of the function at each point.
%
  z(1:n,1) = 1.0 + x(1,1:n).^2 .* x(2,1:n).^5 .* x(3,1:n).^2 ...
    + x(1,1:n) .* x(2,1:n).^2 .* x(3,1:n) + x(1,1:n).^3;

  return
end
