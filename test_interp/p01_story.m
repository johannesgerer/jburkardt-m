function p01_story ( )

%*****************************************************************************80
%
%% P01_STORY prints the "story" for problem p01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hans-Joerg Wenz,
%    Interpolation of Curve Data by Blended Generalized Circles,
%    Computer Aided Geometric Design,
%    Volume 13, Number 8, November 1996, pages 673-680.
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is due to Hans-Joerg Wenz.\n' );
  fprintf ( 1, '  It is an example of good data, which is dense enough in areas\n' );
  fprintf ( 1, '  where the expected curvature of the interpolant is large.\n' );
  fprintf ( 1, '  Good results can be expected with almost any reasonable\n' );
  fprintf ( 1, '  interpolation method.\n' );

  return
end
