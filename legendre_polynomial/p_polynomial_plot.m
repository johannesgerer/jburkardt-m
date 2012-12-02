function p_polynomial_plot ( index, filename )

%*****************************************************************************80
%
%% HF_PLOT plots Hermite functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
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
%    Input, string FILENAME, the name into which the graphics information is
%    to be stored.  Note that the PNG format will be used.
%
  m = 501;
  x = linspace ( -1.0, +1.0, m );
  x = x';
  index_num = length ( index );

  clf
  hold on
  for i = 1 : index_num
    n = index(i);
    y = p_polynomial ( m, n, x );
    plot ( x, y(:,n+1), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- P(n,x) --->' )
  title ( 'Legendre functions P(n,x)' )
  hold off
  print ( '-dpng', filename )

  return
end
