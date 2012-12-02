function svd_snowfall_test05 ( x )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST05 looks at the first 6 modes in the V matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
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
  fprintf ( 1, 'SVD_SNOWFALL_TEST05\n' );
  fprintf ( 1, '  Look at the first 6 modes in the V matrix.\n' );
  fprintf ( 1, '  Each of these represents a pattern shared by all the months,\n' );
  fprintf ( 1, '  and extending across the 121 sampling years.\n' );
%
%  Compute the SVD.
%
  [ u, s, v ] = svd ( x );
%
%  Normalize the patterns so that each column has maximum entry 1.
%
  vs = r8col_normalize_li ( 121, 121, v );
%
%  Reverse the row ordering.
%
  i = 121:-1:1;
  j = 1:121;
  vs(i,:) = vs(j,:);
%
%  Plot the modes.
%  "lsline" plots the least squares line approximating the data.
%
  year = 1890:2010;

  figure ( 5 )

  subplot ( 2, 3, 1 )
  scatter ( year, vs(:,1), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #1' )

  subplot ( 2, 3, 2 )
  scatter ( year, vs(:,2), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #2' )

  subplot ( 2, 3, 3 )
  scatter ( year, vs(:,3), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #3' )

  subplot ( 2, 3, 4 )
  scatter ( year, vs(:,4), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #4' )

  subplot ( 2, 3, 5 )
  scatter ( year, vs(:,5), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #5' )

  subplot ( 2, 3, 6 )
  scatter ( year, vs(:,6), 'filled' )
  h = lsline;
  set ( h, 'Linewidth', 3 )
  set ( h, 'Color', [0,0,0] )
  grid on
  axis ( [1890, 2010, -1, +1 ] )
  xlabel ( '<--Year-->' )
  title ( 'V Mode #6' )

  print ( '-dpng', 'v_modes.png' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotted V modes 1 to 6 in "v_modes.png".\n' );

  return
end
