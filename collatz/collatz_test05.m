function collatz_test05 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST05 plots the Collatz max for starting values 1 to 100.
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
  n = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST05\n' );
  fprintf ( 1, '  Plot the Collatz max for starting values 1 to %d.\n', n );

  for seed = 1 : n
    m(seed) = collatz_max ( seed );
  end

  plot ( m, 'Linewidth', 2 )
  grid on
  xlabel ( 'Sequence Start' )
  ylabel ( 'Maximum Sequence Value' )
  title ( sprintf ( 'Maximum value in sequence, for starting values 1 to %d', n ) );

  filename = 'collatz_max.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot stored as "%s".\n', filename );

  return
end
