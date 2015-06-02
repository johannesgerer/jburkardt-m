function collatz_test04 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST04 plots the points of a Collatz sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST04\n' );
  fprintf ( 1, '  Plot the points of a Collatz sequence.\n' );

  seed = 27;
  s = collatz ( seed );
  n = length ( s );

  plot ( s, 'b.-', 'Linewidth', 3 )
  set ( gca, 'Color', [ 250/255, 250/255, 210/255 ] );
  grid on
  xlabel ( 'Sequence Index' )
  ylabel ( 'Sequence Value' )
  title ( sprintf ( ...
    'Collatz sequence starting at 27, takes %d steps!', n ), 'Fontsize', 16 );

  filename = 'collatz_sequence_27.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot stored as "%s".\n', filename );

  return
end
