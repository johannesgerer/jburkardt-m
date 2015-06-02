function stirling1_test ( )

%*****************************************************************************80
%
%% STIRLING1_TEST tests STIRLING1.
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
  fprintf ( 1, 'STIRLING1_TEST\n' );
  fprintf ( 1, '  STIRLING1: Stirling numbers of first kind.\n' );
  fprintf ( 1, '  Get rows 1 through %d\n', m );
  fprintf ( 1, '\n' );
 
  s1 = stirling1 ( m, n );
 
  for i = 1 : m
    fprintf ( 1, '  %4d', i );
    for j = 1 : n
      fprintf ( 1, '  %6d', s1(i,j) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
