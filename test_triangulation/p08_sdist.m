function sdist = p08_sdist ( m, n, point )

%*****************************************************************************80
%
%% P08_SDIST returns the signed distance to the region in problem 08.
%
%  Discussion:
%
%    A positive distance indicates the point is outside the region.
%
%  Modified:
%
%    09 January 2005
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real ( kind = 8 ) POINT(M,N), the coordinates 
%    of the points.
%
%    Output, real ( kind = 8 ) SDIST(N), the signed distance of 
%    each point to the region.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'P08_SDIST - Fatal error!\n' );
  fprintf ( 1, '  The routine for this test is not written yet!\n' );
  error ( 'P08_SDIST - Fatal error!' )
