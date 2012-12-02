function rbf_interp_nd_test04 ( )

%*****************************************************************************80
%
%% RBF_INTERP_ND_TEST04 tests RBF_WEIGHTS and RBF_INTERP_ND with PHI4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_ND_TEST04:\n' );
  fprintf ( 1, '  RBF_WEIGHT computes weights for RBF interpolation.\n' );
  fprintf ( 1, '  RBF_INTERP_ND evaluates the RBF interpolant.\n' );
  fprintf ( 1, '  Use the multiquadratic basis function PHI4(R).\n' );

  a = 0.0;
  b = 2.0;

  n1d = 5;
  x1d = linspace ( a, b, n1d );

  m = 2;
  nd = n1d^m;

  xd = zeros ( m, nd );
  for i = 1 : m
    xd = r8vec_direct_product ( i, n1d, x1d, m, nd, xd );
  end

  r8mat_transpose_print ( m, nd, xd, '  The product points:' );

  r0 = ( b - a ) / n1d;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Scale factor R0 = %g\n', r0 );

  fd(:,1) = xd(1,:) .* xd(2,:) .* exp ( - xd(1,:) .* xd(2,:) );

  r8vec_print ( nd, fd, '  Function data:' );

  w = rbf_weight ( m, nd, xd, r0, @phi4, fd );

  r8vec_print ( nd, w, '  Weight vector:' );
%
%  #1: Interpolation test.  Does interpolant match function at interpolation points?
%
  ni = nd;
  xi = xd;
  fi = rbf_interp_nd ( m, nd, xd, r0, @phi4, w, ni, xi );

  int_error = norm ( fi - fd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Approximation test.  Estimate the integral (f-interp(f))^2.
%
  ni = 1000;
  seed = 123456789;
  xi = r8mat_uniform ( m, ni, a, b, seed );
  fi = rbf_interp_nd ( m, nd, xd, r0, @phi4, w, ni, xi );
  fd(1:ni,1) = xi(1,:) .* xi(2,:) .* exp ( - xi(1,:) .* xi(2,:) );

  app_error = ( b - a )^m * ( norm ( fi - fd ) ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 approximation error averaged per 1000 samples = %g\n', app_error );
%
%  #3: Plot the interpolant.
%
  figure ( 7 );

  ni_1d = 11;
  xi_1d = linspace ( a, b, ni_1d );

  ni = ni_1d^m;

  xi = zeros ( m, ni );
  for i = 1 : m
    xi = r8vec_direct_product ( i, ni_1d, xi_1d, m, ni, xi );
  end
  fi = rbf_interp_nd ( m, nd, xd, r0, @phi4, w, ni, xi );

  tri = delaunay ( xi(1,:), xi(2,:) );
  trisurf ( tri, xi(1,:), xi(2,:), fi );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( 'Radial Basis Interpolant using PHI4(R)' )
%
%  #4: Plot the exact function.
%
  figure ( 8 );

  ni_1d = 11;
  xi_1d = linspace ( a, b, ni_1d );

  ni = ni_1d^m;

  xi = zeros ( m, ni );
  for i = 1 : m
    xi = r8vec_direct_product ( i, ni_1d, xi_1d, m, ni, xi );
  end
  fi = xi(1,:) .* xi(2,:) .* exp ( - xi(1,:) .* xi(2,:) );

  tri = delaunay ( xi(1,:), xi(2,:) );
  trisurf ( tri, xi(1,:), xi(2,:), fi );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( 'Exact function' )

  return
end
