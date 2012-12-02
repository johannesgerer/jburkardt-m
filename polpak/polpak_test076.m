function polpak_test076 ( )

%*****************************************************************************80
%
%% TEST076 tests VIBONACCI.
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
  n_time = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST076\n' );
  fprintf ( 1, '  VIBONACCI computes a Vibonacci sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of times we compute the series: %d\n', n_time );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for j = 1 : n_time
    [ temp, seed ] = vibonacci ( n, seed );
    v(1:n,j) = temp'; 
  end

  for i = 1 : n
    fprintf ( 1, '  %6d', i );
    for j = 1 : n_time
      fprintf ( 1, '  %6d', v(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
