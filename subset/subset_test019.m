function subset_test019 ( )

%*****************************************************************************80
%
%% TEST019 tests COUNT_POSE_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST019\n' );
  fprintf ( 1, '  COUNT_POSE_RANDOM poses a random problem for\n' );
  fprintf ( 1, '  the game "The Count is Good".\n' );

  seed = 123456789;

  for i = 1 : 5

    [ blocks, goal, seed ] = count_pose_random ( seed );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem #%d\n', i );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    The goal number:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '      %d\n', goal );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    The available numbers are\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    ' );
    for j = 1 : 6
      fprintf ( 1, '  %4d', blocks(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
