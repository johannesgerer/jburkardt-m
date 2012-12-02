function j_polynomial_plot ( n_vec, alpha_vec, beta_vec, filename )

%*****************************************************************************80
%
%% J_POLYNOMIAL_PLOT plots Jacobi polynomials J(n,a,b,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_VEC(*), the orders of 1 or more polynomials
%    to be plotted together.
%
%    Input, integer ALPHA_VEC(*), BETA_VEC(*), the alpha and beta values
%    for each polynomial.
%
%    Input, string FILENAME, the name into which the graphics information is
%    to be stored.  Note that the PNG format will be used.
%
  a = -1.0;
  b = +1.0;
  m = 501;
  x = linspace ( a, b, m );
  x = x';
  vec_num = length ( n_vec );

  clf
  hold on
  for i = 1 : vec_num
    n = n_vec(i);
    alpha = alpha_vec(i);
    beta = beta_vec(i);
    y = j_polynomial ( m, n, alpha, beta, x );
    plot ( x, y(:,n+1), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- J(n,a,b,x) --->' )
  title ( 'Jacobi polynomials J(n,a,b,x)' )
  hold off
  print ( '-dpng', filename )

  return
end
