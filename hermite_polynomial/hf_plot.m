function hf_plot ( a, b, index, filename )

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
%    10 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the plotting range.
%
%    Input, integer INDEX(*), the orders of 1 or more Hermite functions
%    to be plotted together.
%
%    Input, string FILENAME, the name into which the graphics information is
%    to be stored.  Note that the PNG format will be used.
%
  m = 501;
  x = linspace ( a, b, m );
  x = x';
  index_num = length ( index );

  clf
  hold on
  for i = 1 : index_num
    n = index(i);
    y = hf_function ( m, n, x );
    plot ( x, y(:,n+1), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Hf(n,x) --->' )
  title ( 'Hermite functions Hf(n,x)' )
  hold off
  print ( '-dpng', filename )

  return
end
