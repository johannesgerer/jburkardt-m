function polpak_test071 ( )

%*****************************************************************************80
%
%% TEST071 tests STIRLING2.
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
  fprintf ( 1, 'TEST071\n' );
  fprintf ( 1, '  STIRLING2: Stirling numbers of second kind.\n' );
  fprintf ( 1, '  Get rows 1 through %d\n', m );
  fprintf ( 1, '\n' );
 
  s2 = stirling2 ( m, n );
 
  for i = 1 : m
    fprintf ( 1, '  %4d', i );
    for j = 1 : n
      fprintf ( 1, '  %6d', s2(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
