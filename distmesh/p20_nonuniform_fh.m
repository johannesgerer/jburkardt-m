function h = p20_nonuniform_fh ( p, varargin )

%*****************************************************************************80
%
%% P20_NONUNIFORM_FH returns a nonuniform mesh size function for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson, Gilbert Strang,
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
  hmax = 5;
  hmin = 1;
  dmax = max ( abs ( p20_fd ( p ) ) );
  dmin = min ( abs ( p20_fd ( p ) ) );

  h = ( ( dmax - abs ( p20_fd ( p ) )        ) * hmin   ...
      + (        abs ( p20_fd ( p ) ) - dmin ) * hmax ) ...
      / ( dmax                        - dmin );


  return
end
