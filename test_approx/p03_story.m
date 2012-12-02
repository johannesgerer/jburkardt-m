function p03_story ( )

%*****************************************************************************80
%
%% P03_STORY prints the "story" for problem 3.
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
  fprintf ( 1, '  The data is all zero except for a single value of 1 in the center.\n' );
  fprintf ( 1, '  This data set is interesting because an interpolation method that\n' );
  fprintf ( 1, '  is "local" will produce an interpolating curve that is exactly\n' );
  fprintf ( 1, '  zero over most of the outlying intervals, whereas a nonlocal\n' );
  fprintf ( 1, '  interpolation method may produce a curve that "wiggles" over the\n' );
  fprintf ( 1, '  entire interpolation interval.\n' );

  return
end
