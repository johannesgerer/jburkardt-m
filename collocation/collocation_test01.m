function collocation_test01 ( n )

%*****************************************************************************80
%
%% COLLOCATION_TEST01 collocates Y(X)=SIN(X) using a polynomial.
%
%  Discussion:
%
%    Given the functional equation:
%
%      f(x) = sin(x)
%
%    we use collocation to construct a function g(x) such that
%
%      g(x(i)) = sin(x(i))
%
%    exactly, at a set of N collocation points.
%
%    N = number of collocation points X.
%    X(I) evenly spaced points in interval [0,2*PI].
%    G(X) = polynomial of degree N-1 in X.
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
  fprintf ( 1, 'COLLOCATION_TEST01:\n' );
  fprintf ( 1, '  Collocate the equation F(X)=SIN(X)\n' );
  fprintf ( 1, '  Let N be the number of collocation points.\n' );
  fprintf ( 1, '  Choose N points X in [0,2Pi].\n' );
  fprintf ( 1, '  Let G(X) be a polynomial of degree N-1.\n' );
  fprintf ( 1, '    G(X(1:N)) = SIN(X(1:N))\n' );
  fprintf ( 1, '  is N equations for the N unknown coefficients in G.\n' );
%
%  Set the collocation points.
%
  n1 = 11;
  xl = 0.0;
  xr = 2.0 * pi;
  d = n1 - 1;
  x1 = linspace ( xl, xr, n1 );
  x1 = x1';
%
%  Set up the linear system for the coefficients.
%
  A = zeros ( n1, n1 );
  A(:,1) = 1.0;
  for j = 2 : n1
    A(:,j) = A(:,j-1) .* x1;
  end

  y1 = sin ( x1 ); 
%
%  Solve the system.
%
  c = A \ y1;
%
%  Plot the collocation function versus the exact solution.
%
  n2 = 101;
  x2 = linspace ( xl, xr, n2 );
  y2 = r8poly_values_horner ( d, c, n2, x2 );

  y3 = sin ( x2 );

  hold on
  plot ( x2, y3, 'r-', 'LineWidth', 8 );
  plot ( x2, y2, 'b-', 'LineWidth', 2 );
  plot ( x1, y1, 'k.', 'MarkerSize', 30 )
  grid on
  title ( 'Collocate F(X)=SIN(X) using a polyonomial.', 'FontSize', 24 )
  hold off
%
%  Save plot in a file.
%
  filename = 'test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
