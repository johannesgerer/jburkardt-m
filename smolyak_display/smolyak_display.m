function smolyak_display ( family, growth, level )

%*****************************************************************************80
%
%% SMOLYAK_DISPLAY illustrates the exactness of a 2D Smolyak sparse grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FAMILY, indicates the 1D quadrature family used
%    to provide factors, default is 'cc';
%    'CC': Clenshaw-Curtis;
%    'L':  Gauss-Legendre
%
%    Input, string GROWTH, indicates the growth rate, default is 'e'.
%    'E': exponential, for CC, L;
%    'HC': Hyperbolic Cross;
%    'L': linear growth, for CC, HC, L;
%    'LO', linear odd growth, for CC, L;
%    'SE': slow exponential, for CC, L.
%
%    Input, int LEVEL, the level of the sparse grid to be constructed.
%    0 <= LEVEL <= 5; default is 3.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SMOLYAK_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Illustrate the "construction" of the exactness diagram\n' );
  fprintf ( 1, '  of a Smolyak grid.\n' );

  if ( nargin < 1 )
    family = 'CC';
  end

  if ( nargin < 2 )
    growth = 'E';
  end

  if ( nargin < 3 )
    level = 3;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  FAMILY = %s\n', family );
  fprintf ( 1, '  GROWTH = %s\n', growth );
  fprintf ( 1, '  LEVEL =  %d\n', level );

  if ( growth == 'HC' )
    hyperbolic_display ( family, growth, level );
  else
    nonhyperbolic_display ( family, growth, level );
  end

  return
end

