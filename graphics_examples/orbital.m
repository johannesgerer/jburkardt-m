function orbital ( )

%*****************************************************************************80
%
%% ORBITAL makes a contour plot of a set of tabular Z(X,Y) data.
%
%  Discussion:
%
%    The data represents values on a 101x101 grid over [0,4*pi]x[0,4*pi]
%    for the following function which computes the minimum distance d 
%    between two planets for certain orbital angles t1 and t2.
%
%    function d = sep2 ( t1, t2 )
%      A1 = 10;
%      P1 = 2;
%      phi1 = pi/8;
%      A2 = 4;
%      P2 = 1;
%      phi2 = -pi/7;
%      x0 = ((P1-A1)/2) + ((P1+A1)/2)*cos(t1);
%      y0 = sqrt(A1*P1)*sin(t1);
%      x1 =  cos(phi1) * x0 + sin(phi1) * y0;
%      y1 = -sin(phi1) * x0 + cos(phi1) * y0;
%      x0 = ((P2-A2)/2) + ((P2+A2)/2)*cos(t2);
%      y0 = sqrt(A2*P2)*sin(t2);
%      x2 =  cos(phi2) * x0 + sin(phi2) * y0;
%      y2 = -sin(phi2) * x0 + cos(phi2) * y0;
%      d = 0.5 * ( ( x1 - x2 ).^2 + ( y1 - y2 ).^2 );
%    end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ORBITAL:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a contour plot of a table of data Z(X,Y).\n' );
%
%  Read the data.
%
  B = load ( 'orbital.txt' );
%
%  Get the range of data so we can decide on contour levels.
%
  umax = max ( B(1:end,3) );
  umin = min ( B(1:end,3) );
  udel = ( umax - umin ) / 15;
  v = umin : udel : umax;
%
%  Extract X, Y, Z data.
%
  nx = 101;
  ny = 101;
  x = reshape ( B(:,1), nx, ny );
  y = reshape ( B(:,2), nx, ny );
  z = reshape ( B(:,3), nx, ny );
%
%  Set up a colormap.
%
  colormap ( jet );
%
%  Display a contour plot.
%
  [ C1, h1 ] = contourf ( x, y, z, v );
%
%  CAXIS allows us to define the color bar using the minimum and maximum U
%  over the whole data set.
%
  caxis ( [ umin, umax ] );
%
%  Place a vertical colorbar on the plot.
%
  colorbar ( 'vert' )
%
%  Label the axes and the plot.
%
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Orbital contour plot' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ORBITAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
