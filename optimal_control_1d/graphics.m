function graphics ( it, x, q, q_hat_plot, u, u_hat_plot )   

%*****************************************************************************80
%
%% GRAPHICS displays the computed and optimal functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Parameters:
%
%    Input, integer IT, the iteration number.
%
%    Input, real X(*), the node coordinates.
%
%    Input, real Q(*), the computed control at each node.
%
%    Input, real Q_HAT_PLOT(*), the optimal control at each node.
%
%    Input, real U(*), the computed BVP solution at each node.
%
%    Input, real U_HAT_PLOT(*), the optimal BVP solution at each node.
%
  figure ( 1 )
  clf
  hold on
  plot ( x, u )
  plot ( x, u_hat_plot, 'r+' )
  grid
  title ( sprintf ( '  Target function U\\_hat (red), computed U (blue), iteration %d', it ) )
  hold off

  figure ( 2 )
  clf
  hold on
  plot ( x, q )
  plot ( x, q_hat_plot, 'r+' )
  grid
  title ( sprintf ( '  Optimal control Q\\_hat (red), computed Q (blue), iteration %d', it ) )
  hold off

  return
end
