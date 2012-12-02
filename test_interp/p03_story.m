function p03_story ( )

%*****************************************************************************80
%
%% P03_STORY prints the "story" for problem p03.
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
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is due to Fred Fritsch and Ralph Carlson.\n' );
  fprintf ( 1, '  This data can cause problems for interpolation methods.\n' );
  fprintf ( 1, '  There are sudden changes in direction, and at the same time,\n' );
  fprintf ( 1, '  sparsely-placed data.  This can cause an interpolant to overshoot\n' );
  fprintf ( 1, '  the data in a way that seems implausible.\n' );

  return
end
