function collocation_test02 ( n )

%*****************************************************************************80
%
%% COLLOCATION_TEST02 collocates a two point boundary value problem.
%
%  Discussion:
%
%    A function y(x) is assumed to exist, and to be twice continuously
%    differentiable, over [0.0,2.0], satisfying the following conditions:
%
%      y(0.0) = 1.0
%      y''(x) = y(x) for 0 < x < 2.0
%      y(2.0) = e^2 
%
%    We use collocation to construct a function g(x) such that
%
%      g(x(1)=0.0) = 1.0
%      g''(x(i)) = g(x(i)) for x(2) through x(n-1)
%      g(x(n)=2.0) = e^2
%
%    exactly, at a set of N collocation points between 0.0 and 2.0,
%    with X(1) = 0.0 and X(N) = 2.0, and assuming G(X) is a polynomial
%    of degree N-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLOCATION_TEST02:\n' );
  fprintf ( 1, '  Collocate a two point boundary value problem.\n' );
  fprintf ( 1, '  Let N be the number of collocation points.\n' );
  fprintf ( 1, '  Choose N points X in [0,2].\n' );
  fprintf ( 1, '  Let G(X) be a polynomial of degree N-1.\n' );
  fprintf ( 1, '    G(X(1)=0.0) = 1.0\n' );
  fprintf ( 1, '    G"(X(2:N-1)) = G(X(2:N-1))\n' );
  fprintf ( 1, '    G(X(N)=2.0) = exp(2.0)\n' );
  fprintf ( 1, '  is N equations for the N unknown coefficients in G.\n' );
%
%  Set the collocation points.
%
  n1 = 11;
  xl = 0.0;
  xr = 2.0;
  d = n1 - 1;
  x1 = linspace ( xl, xr, n1 );
  x1 = x1';
%
%  Set up the linear system for the coefficients.
%
  A = zeros ( n1, n1 );

  for i = 1 : n1
    for j = 1 : n1
      A(i,j) = x1(i) ^ ( j - 1 );
    end
  end

  for i = 2 : n1 - 1
    for j = 3 : n1
      A(i,j) = A(i,j) - ( j - 1 ) * ( j - 2 ) * x1(i) ^ ( j - 3 );
    end
  end

  y1 = zeros ( n1, 1 );
  y1(1) = 1.0;
  y1(2:n1-1) = 0.0;
  y1(n1) = exp ( 2.0 );
%
%  Solve the system.
%
  c = A \ y1;
%
%  Overwrite Y1 (RHS of linear system) with actual collocation values.
%
  y1 = r8poly_values_horner ( d, c, n1, x1 );
%
%  Plot the collocation function versus the exact solution.
%
  n2 = 101;
  x2 = linspace ( xl, xr, n2 );
  y2 = r8poly_values_horner ( d, c, n2, x2 );

  y3 = exp ( x2 );

  hold on
  axis ( [ 0.0, 2.0, 0.0, 8.0 ] )
  plot ( x2, y3, 'r-', 'LineWidth', 8 );
  plot ( x2, y2, 'b-', 'LineWidth', 2 );
  plot ( x1, y1, 'k.', 'MarkerSize', 30 )
  grid on
  title ( 'Collocate two point BVP using a polyonomial.', 'FontSize', 24 )
  hold off
%
%  Save plot in a file.
%
  filename = 'test02.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
