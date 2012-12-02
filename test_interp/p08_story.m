function p08_story ( )

%*****************************************************************************80
%
%% P08_STORY prints the "story" for problem p08.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2012
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
  fprintf ( 1, '  This is equally spaced data for y = x^2,\n' );
  fprintf ( 1, '  except for one extra point whose x value is\n' );
  fprintf ( 1, '  close to another, but whose y value is not so close.\n' );
  fprintf ( 1, '  A small disagreement in nearby data can be a disaster.\n' );

  return
end
