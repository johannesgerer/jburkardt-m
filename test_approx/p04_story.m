function p04_story ( )

%*****************************************************************************80
%
%% P04_STORY prints the "story" for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Theoretically, the data is a step, 0 to the left of 5, and 1\n' );
  fprintf ( 1, '  to the right.  To keep things simple, the data is defined\n' );
  fprintf ( 1, '  to be 0 up to 5 - RADIUS, 1/2 at 5, 1 at 5 + RADIUS and beyond,\n' );
  fprintf ( 1, '  with RADIUS set to a "small" value, currently 0.01.\n' );
  fprintf ( 1, '  Some interpolation methods will violently overreact to this jump.\n' );

  return
end
