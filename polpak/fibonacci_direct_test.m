function fibonacci_direct_test ( )

%*****************************************************************************80
%
%% FIBONACCI_DIRECT_TEST tests FIBONACCI_DIRECT.
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
  fprintf ( 1, 'FIBONACCI_DIRECT_TEST\n' );
  fprintf ( 1, '  FIBONACCI_DIRECT evalutes a Fibonacci number directly.\n' );
  fprintf ( 1, '\n' );
 
  n = 20;
 
  for i = 1 : n
    f = fibonacci_direct ( i );
    fprintf ( 1, '  %6d  %10d\n', i, f );
  end

  return
end
