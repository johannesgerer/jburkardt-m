function h = p16_fh ( p, varargin )

%*****************************************************************************80
%
%% P16_FH returns a mesh size function for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, real P(NP,ND), the point coordinates.
%
%    Input, VARARGIN, room for extra arguments.
%
%    Output, real H(NP,1), the mesh size function.
%
  np = size ( p, 1 );
  h = ones ( np, 1 );

  return
end

