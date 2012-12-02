function p02_story ( )

%*****************************************************************************80
%
%% P02_STORY prints the "story" for problem p02.
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
%    ETY Lee,
%    Choosing Nodes in Parametric Curve Interpolation,
%    Computer-Aided Design,
%    Volume 21, Number 6, July/August 1989, pages 363-370.
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is due to ETY Lee of Boeing.\n' );
  fprintf ( 1, '  Data near the corners is more dense than in regions of small curvature.\n' );
  fprintf ( 1, '  A local interpolation method will produce a more plausible\n' );
  fprintf ( 1, '  interpolant than a nonlocal interpolation method, such as\n' );
  fprintf ( 1, '  cubic splines.\n' );

  return
end
