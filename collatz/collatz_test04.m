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
%    21 May 2012.
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

  plot ( s, 'Linewidth', 2 )
  grid on
  xlabel ( 'Sequence Index' )
  ylabel ( 'Sequence Value' )
  title ( sprintf ( 'Collatz sequence starting at 27, with %d elements', n ) );

  filename = 'collatz_sequence_27.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot stored as "%s".\n', filename );

  return
end
