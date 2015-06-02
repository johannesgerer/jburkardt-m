function lebesgue_plot ( n, x, xfun, label, filename )

%*****************************************************************************80
%
%% LEBESGUE_PLOT plots the Lebesgue function for a set of points.
%
%  Discussion:
%
%    The interpolation interval is assumed to be [min(XFUN), max(XFUN)].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2014
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Jean-Paul Berrut, Lloyd Trefethen,
%    Barycentric Lagrange Interpolation,
%    SIAM Review,
%    Volume 46, Number 3, September 2004, pages 501-517.
%
%  Parameters:
%
%    Input, integer N, the number of interpolation points.
%
%    Input, real X(N), the interpolation points.
%
%    Input, real XFUN(*), the evaluation points.  
%
%    Input, string LABEL, a title for the plot.
%
%    Input, string FILENAME, a filename in which to save the plot.
%
  lfun = lebesgue_function ( n, x, xfun );

  plot ( xfun, lfun, 'Linewidth', 2 );

  ymax = ceil ( max ( lfun ) ) + 1;

  xmin = min ( xfun );
  xmax = max ( xfun );
  axis ( [ xmin, xmax, 0.0, ymax ] )

  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Lebesgue(X) --->' )
  title ( label, 'Fontsize', 24 );

  print ( '-dpng', filename );

  return
end

