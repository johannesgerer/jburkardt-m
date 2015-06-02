function fibonacci_recursive_test ( )

%*****************************************************************************80
%
%% FIBONACCI_RECURSIVE_TEST tests FIBONACCI_RECURSIVE.
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
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FIBONACCI_RECURSIVE_TEST\n' );
  fprintf ( 1, '  FIBONACCI_RECURSIVE computes the Fibonacci sequence.\n' );
  fprintf ( 1, '\n' );
 
  f = fibonacci_recursive ( n );
 
  for i = 1 : n
    fprintf ( 1, '  %4d  %8d\n', i, f(i) );
  end

  return
end
