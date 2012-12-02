function test1215 ( )

%*****************************************************************************80
%
%% TEST1215 tests RAT_WIDTH.
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
  n_test = 17;

  a_test = [ 1000, 1000, 1000, 1000,  1000,    1,      -1, -10, -100, -1000, ...
                1,   10,  100, 1000, 10000,   17, 4000000 ];
  b_test = [    3,   40,  500, 6000, 70000,    1,     200, 200,  200,   200, ...
             -200, -200, -200, -200,  -200, 3000, 4000000 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1215\n' );
  fprintf ( 1, '  RAT_WIDTH determines the "width" of a rational.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Top    Bottom  Width\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n_test
    a = a_test(i);
    b = b_test(i);
    width = rat_width ( a, b );
    fprintf ( 1, '  %6d  %6d  %6d\n', a, b, width );
  end

  return
end
