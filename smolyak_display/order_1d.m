function o = order_1d ( family, growth, level )

%*****************************************************************************80
%
%% ORDER_1D returns the number of points in a 1D quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FAMILY, indicates the family of 1D quadrature rules used
%    to provide factors.
%    'CC': Clenshaw-Curtis;
%    'L':  Gauss-Legendre
%
%    Input, string GROWTH, indicates the growth rate.
%    'E': exponential, for CC, L;
%    'HC': Hyperbolic Cross;
%    'L': linear growth, for CC, HC, L;
%    'LO', linear odd growth, for CC, L;
%    'SE': slow exponential, for CC, L.
%
%    Input, int LEVEL, the level of the sparse grid to be constructed.
%    0 <= LEVEL <= 5.
%
%    Output, integer O, the order of the 1D quadrature rule.
%
  if ( upper ( family ) == 'CC' )
  
    if ( upper ( growth ) == 'E' )
      if ( level == 0 )
        o = 1;
      else
        o = 2^level + 1;
      end
    elseif ( upper ( growth ) == 'HC' )
      o = level + 1;
    elseif ( upper ( growth ) == 'L' )
      o = level + 1;
    elseif ( upper ( growth ) == 'LO' )
      o = 2 * floor ( ( level + 1 ) / 2 ) + 1;
    elseif ( upper ( growth ) == 'SE' )
      o = 1;
      p = o;
      p_min = 2 * level + 1;
      level_1d = 0;
      while ( p < p_min )
        level_1d = level_1d + 1;        
        o = 2^level_1d + 1;
        p = o;
      end
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ORDER_1D - Fatal error!\n' );
      fprintf ( 1, '  Unknown growth rate "%s" for CC family.\n', growth );
      error ( 'ORDER_1D - Fatal error!' );
    end
%
%  Legendre family.
%
  elseif ( upper ( family ) == 'L' )
  
    if ( upper ( growth ) == 'E' )
      if ( level == 0 )
        o = 1;
      else
        o = 2^level + 1;
      end
    elseif ( upper ( growth ) == 'HC' )
      o = level + 1;
    elseif ( upper ( growth ) == 'L' )
      o = level + 1;
    elseif ( upper ( growth ) == 'LO' )
      o = 2 * floor ( ( level + 1 ) / 2 ) + 1;
    elseif ( upper ( growth ) == 'SE' )
      o = 1;
      p = 2 * o - 1;
      p_min = 2 * level + 1;
      level_1d = 0;
      while ( p < p_min )
        level_1d = level_1d + 1;        
        o = 2^level_1d + 1;
        p = 2 * o - 1;
      end
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ORDER_1D - Fatal error!\n' );
      fprintf ( 1, '  Unknown growth rate "%s" for L family.\n', growth );
      error ( 'ORDER_1D - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'ORDER_1D - Fatal error!\n' );
    fprintf ( 1, '  Unknown family "%s".\n', family );
    error ( 'ORDER_1D - Fatal error!' );

  end

  return
end
