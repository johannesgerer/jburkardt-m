function delannoy_test ( )

%*****************************************************************************80
%
%% DELANNOY_TEST tests DELANNOY.
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
  m = 8;
  n = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DELANNOY_TEST\n' );
  fprintf ( 1, '  DELANNOY computes the Delannoy numbers A(0:M,0:N).\n' );
  fprintf ( 1, '  A(M,N) counts the paths from (0,0) to (M,N).\n' );
  fprintf ( 1, '\n' );

  a = delannoy ( m, n );

  for i = 0 : m
    fprintf ( 1, '  %2d  ', i );
    for j = 1 : n+1
      fprintf ( 1, '  %6d', a(i+1,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
