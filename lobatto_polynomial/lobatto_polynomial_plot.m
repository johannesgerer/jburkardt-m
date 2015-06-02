function lobatto_polynomial_plot ( index, filename_value, filename_derivative )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_PLOT plots one or more completed Lobatto polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INDEX(*), the orders of 1 or more Legendre polynomials
%    to be plotted together.
%
%    Input, string FILENAME_VALUE, FILENAME_DERIVATIVE, the filenames for
%    the VALUE and DERIVATIVE plots.
%
  m = 501;
  x = linspace ( -1.0, +1.0, m );
  x = x';
  index_num = length ( index );

  figure ( 1 )
  clf
  hold on
  plot ( [-1.0,+1.0], [0.0,0.0], 'k-', 'LineWidth', 2 );
  for i = 1 : index_num
    n = index(i);
    y = lobatto_polynomial_value ( m, n, x );
    plot ( x, y(:,n), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Lo(n,x) --->' )
  title ( 'Completed Lobatto polynomials Lo(n,x)', 'FontSize', 16 )
  hold off
  print ( '-dpng', filename_value )

  figure ( 2 )
  clf
  hold on
  plot ( [-1.0,+1.0], [0.0,0.0], 'k-', 'LineWidth', 2 );
  for i = 1 : index_num
    n = index(i);
    y = lobatto_polynomial_derivative ( m, n, x );
    plot ( x, y(:,n), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Lo''(n,x) --->' )
  title ( 'Completed Lobatto derivatives Lo''(n,x)', 'FontSize', 16 )
  hold off
  print ( '-dpng', filename_derivative )

  return
end
