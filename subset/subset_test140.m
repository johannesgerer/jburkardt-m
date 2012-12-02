function subset_test140 ( )

%*****************************************************************************80
%
%% TEST140 tests SCHROEDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST140\n' );
  fprintf ( 1, '  SCHROEDER computes the Schroeder numbers.\n' );
  fprintf ( 1, '\n' );

  s = schroeder ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        S(N)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8d\n', i, s(i) );
  end

  return
end
