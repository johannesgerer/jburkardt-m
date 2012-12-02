function svd_snowfall_test04 ( x )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST04 looks at the first 6 modes in the U matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(8,121), the snowfall data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_SNOWFALL_TEST04\n' );
  fprintf ( 1, '  Look at the first 6 modes in the U matrix.\n' );
  fprintf ( 1, '  Each of these represents a pattern for snowfall over a year.\n' );
  fprintf ( 1, '  The first mode is the pattern that is strongest in the data.\n' );
%
%  Compute the SVD.
%
  [ u, s, v ] = svd ( x );
%
%  Normalize the patterns so that each column has maximum entry 1.
%
  us = r8col_normalize_li ( 8, 8, u );
%
%  Plot the modes.
%
  t = 1:8;

  figure ( 4 )

  subplot ( 2, 3, 1 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,1), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #1' )
  hold off

  subplot ( 2, 3, 2 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,2), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #2' )
  hold off

  subplot ( 2, 3, 3 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,3), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #3' )
  hold off

  subplot ( 2, 3, 4 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,4), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #4' )
  hold off

  subplot ( 2, 3, 5 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,5), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #5' )
  hold off

  subplot ( 2, 3, 6 )
  hold on
  plot ( [1,8], [0,0], 'r-' )
  plot ( t, us(:,6), 'b-', 'Linewidth', 3 )
  axis ( [1,8,-1.0,+1.0] )
  grid on
  title ( 'U Mode #6' )
  hold off

  print ( '-dpng', 'u_modes.png' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotted U modes 1 to 6 in "u_modes.png".\n' );

  return
end
