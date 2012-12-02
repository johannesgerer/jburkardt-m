%% POWER_TABLE prints a table of the squares and cubes of the integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '           N   N-squared     N-cubed\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 10
    fprintf ( 1, '  %10d  %10d  %10d\n', i, i^2, i^3 );
  end
 
  exit
