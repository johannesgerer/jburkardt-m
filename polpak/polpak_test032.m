function polpak_test032 ( )

%*****************************************************************************80
%
%% TEST032 tests FIBONACCI_FLOOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST032\n' );
  fprintf ( 1, '  FIBONACCI_FLOOR computes the largest Fibonacci number\n' );
  fprintf ( 1, '  less than or equal to a given positive integer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N  Fibonacci  Index\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 20
    [ f, i ] = fibonacci_floor ( n );
    fprintf ( 1, '  %4d  %4d  %4d\n', n, f, i );
  end
 
  return
end
