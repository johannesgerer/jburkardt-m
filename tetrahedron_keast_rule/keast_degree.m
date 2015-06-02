function degree = keast_degree ( rule )

%*****************************************************************************80
%
%% KEAST_DEGREE returns the degree of a Keast rule for the tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Patrick Keast,
%    Moderate Degree Tetrahedral Quadrature Formulas,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 55, Number 3, May 1986, pages 339-348.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer DEGREE, the degree of the rule.
%
  if ( rule == 1 )
    degree = 0;
  elseif ( rule == 2 )
    degree = 1;
  elseif ( rule == 3 )
    degree = 2;
  elseif ( rule == 4 )
    degree = 3;
  elseif ( rule == 5 )
    degree = 4;
  elseif ( rule == 6 )
    degree = 4;
  elseif ( rule == 7 )
    degree = 5;
  elseif ( rule == 8 )
    degree = 6;
  elseif ( rule == 9 )
    degree = 7;
  elseif ( rule == 10 )
    degree = 8;
  else
    degree = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KEAST_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'KEAST_DEGREE - Fatal error!' )
  end

  return
end
