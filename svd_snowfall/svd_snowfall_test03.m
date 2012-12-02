function svd_snowfall_test03 ( x )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST03 looks at the singular values.
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
  fprintf ( 1, 'SVD_SNOWFALL_TEST03\n' );
  fprintf ( 1, '  Compute the rank 1 through rank 5 approximations to the data.\n' );
  fprintf ( 1, '  Compare each of these to the 2010 snowfall data.\n' );
%
%  Compute the SVD.
%
  [ u, s, v ] = svd ( x );
%
%  Form the rank 1, 2, 3, 4, 5 approximants to A.
%
  a1 =      s(1,1) * u(:,1) * v(:,1)';
  a2 = a1 + s(2,2) * u(:,2) * v(:,2)';
  a3 = a2 + s(3,3) * u(:,3) * v(:,3)';
  a4 = a3 + s(4,4) * u(:,4) * v(:,4)';
  a5 = a4 + s(5,5) * u(:,5) * v(:,5)';
%
%  Column 1 of X is the 2010 snowfall.
%  Column 1 of A1 is the rank 1 approximant to 2010 snowfall.
%
  figure ( 3 )

  t = 1:8;

  subplot ( 2, 3, 1 )
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  title ( '2010 Snowfall' )

  subplot ( 2, 3, 2 )
  hold on
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  plot ( t, a1(:,1), 'k-', 'Linewidth', 3 )
  title ( 'Rank 1 Approx (black)' )
  hold off

  subplot ( 2, 3, 3 )
  hold on
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  plot ( t, a2(:,1), 'k-', 'Linewidth', 3 )
  title ( 'Rank 2 Approx (black)' )
  hold off

  subplot ( 2, 3, 4 )
  hold on
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  plot ( t, a3(:,1), 'k-', 'Linewidth', 3 )
  title ( 'Rank 3 Approx (black)' )
  hold off

  subplot ( 2, 3, 5 )
  hold on
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  plot ( t, a4(:,1), 'k-', 'Linewidth', 3 )
  title ( 'Rank 4 Approx (black)' )
  hold off

  subplot ( 2, 3, 6 )
  hold on
  plot ( t, x(:,1), 'r-', 'Linewidth', 3 )
  grid on
  plot ( t, a5(:,1), 'k-', 'Linewidth', 3 )
  title ( 'Rank 5 Approx (black)' )
  hold off

  print ( '-dpng', 'rank_one_approximants.png' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotted rank 1 to 5 approximants in "rank_one_approximants.png".\n' );

  return
end
