function p = exactness_1d ( family, growth, level )

%*****************************************************************************80
%
%% EXACTNESS_1D returns the exactness of a 1D quadrature rule.
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
%    Output, integer P, the exactness of the rule.
%
  if ( upper ( family ) == 'CC' )
  
    o = order_1d ( family, growth, level );
    p = o;

  elseif ( upper ( family ) == 'L' )
  
    o = order_1d ( family, growth, level );
    p = 2 * o - 1;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'EXACTNESS_1D - Fatal error!\n' );
    fprintf ( 1, '  Unknown family.\n' );
    error ( 'EXACTNESS_1D - Fatal error!' );

  end

  return
end
