function hf_plot ( a, b, index, filename )

%*****************************************************************************80
%
%% HF_PLOT plots Hermite functions Hf(i,x).
%
%  Discussion:
%
%    Hf(I,X) represents the Hermite function of "degree" I.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2014
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
    y = hf_function_value ( m, n, x );
    plot ( x, y(:,n+1), 'LineWidth', 2 );
  end
  grid on
  xlabel ( '<--- X --->', 'Fontsize', 16 )
  ylabel ( '<--- Hf(n,x) --->', 'Fontsize', 16 )
  title ( 'Hermite functions Hf(n,x)', 'Fontsize', 24 )
  hold off
  print ( '-dpng', filename )

  return
end
