function cardinal_sin_test ( )

%*****************************************************************************80
%
%% CARDINAL_SIN_TEST plots the CARDINAL_SIN function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARDINAL_SIN_TEST\n' );
  fprintf ( 1, '  Plot a cardinal sine function.\n' );
%
%  For cardinal sine functions, we have 1 <= j <= n.
%
  n = 11;
  j = 5;
  t = linspace ( 0.0, pi, 101 );
  s = cardinal_sin ( j, n, t );

  clf
  hold on
  plot ( t, s, 'b-', 'Linewidth', 3 );
  x = pi * ( 0 : n + 1 ) / ( n + 1 );
  y = zeros ( n + 2, 1 );
  plot ( x, y, 'k.', 'Markersize', 20 );
  grid on;
  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y(X)--->', 'Fontsize', 16 );
  title ( 'Cardinal Sine Function', 'Fontsize', 24 );
  axis tight
  hold off

  filename = 'cardinal_sin.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics file saved as "%s"\n', filename );

  close

  return
end
