function p04_story ( )

%*****************************************************************************80
%
%% P04_STORY prints the "story" for problem p04.
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
%    Larry Irvine, Samuel Marin, Philip Smith,
%    Constrained Interpolation and Smoothing,
%    Constructive Approximation,
%    Volume 2, Number 1, December 1986, pages 129-151.
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is due to Larry Irvine, Samuel Marin and Philip Smith.\n' );
  fprintf ( 1, '  This data can cause problems for interpolation methods.\n' );
  fprintf ( 1, '  There are sudden changes in direction, and at the same time,\n' );
  fprintf ( 1, '  sparsely-placed data.  This can cause an interpolant to overshoot\n' );
  fprintf ( 1, '  the data in a way that seems implausible.\n' );

  return
end
