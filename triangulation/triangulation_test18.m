function triangulation_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests TRIANGULATION_ORDER3_NEIGHBOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  triangle_num = 16;
  node_num = 13;

  triangle_node(1:3,1:triangle_num) = [ ...
     3,   4,   1; ...
     3,   1,   2; ...
     3,   2,   8; ...
     2,   1,   5; ...
     8,   2,  13; ...
     8,  13,   9; ...
     3,   8,   9; ...
    13,   2,   5; ...
     9,  13,   7; ...
     7,  13,   5; ...
     6,   7,   5; ...
     9,   7,   6; ...
    10,   9,   6; ...
     6,   5,  12; ...
    11,   6,  12; ...
    10,   6,  11 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  For a triangulation of a set of nodes,\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_NEIGHBOR determines the\n' );
  fprintf ( 1, '  triangle neighbors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T1    S1    T2    S2\n' );
  fprintf ( 1, '\n' );

  for t1 = 1 : triangle_num
    for s1 = 1 : 3
      [ t2, s2 ] = triangulation_order3_neighbor ( triangle_num, triangle_node, ...
        t1, s1 );
      fprintf ( 1, '  %4d  %4d  %4d  %4d\n', t1, s1, t2, s2 );
    end
  end

  return
end
