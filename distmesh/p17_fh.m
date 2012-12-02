function h = p17_fh ( p, varargin )

%*****************************************************************************80
%
%% P17_FH returns a mesh size function for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2008
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
  if ( 0 )

    np = size ( p, 1 );
    h = ones ( np, 1 );

  else

    hmax = 5;
    hmin = 1;
    dmax = max ( abs ( p17_fd ( p ) ) );
    dmin = min ( abs ( p17_fd ( p ) ) );

    h = ( ( dmax - abs ( p17_fd ( p ) )        ) * hmin   ...
        + (        abs ( p17_fd ( p ) ) - dmin ) * hmax ) ...
        / ( dmax                        - dmin );

  end

  return
end

