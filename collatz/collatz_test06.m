function collatz_test06 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST06 plots the Collatz count.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2012.
%
%  Author:
%
%    John Burkardt
%
  n = 50;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST06\n' );
  fprintf ( 1, '  Plot the Collatz count for starting values 1 to %d.\n', n );

  for seed = 1 : n
    c(seed) = collatz_count ( seed );
  end

  plot ( c, 'Linewidth', 2 )
  grid on
  xlabel ( 'Sequence Start' )
  ylabel ( 'Sequence Length' )
  title ( sprintf ( 'Length of Collatz sequence for starting values 1 to %d', n ) );

  filename = 'collatz_count.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot stored as "%s".\n', filename );

  return
end
