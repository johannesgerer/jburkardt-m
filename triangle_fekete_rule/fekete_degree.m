function degree = fekete_degree ( rule )

%*****************************************************************************80
%
%% FEKETE_DEGREE returns the degree of a Fekete rule for the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Taylor, Beth Wingate, Rachel Vincent,
%    An Algorithm for Computing Fekete Points in the Triangle,
%    SIAM Journal on Numerical Analysis,
%    Volume 38, Number 5, 2000, pages 1707-1720.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer DEGREE, the polynomial degree of exactness of
%    the rule.
%
  if ( rule == 1 )
    degree = 3;
  elseif ( rule == 2 )
    degree = 6;
  elseif ( rule == 3 )
    degree = 9;
  elseif ( rule == 4 )
    degree = 12;
  elseif ( rule == 5 )
    degree = 12;
  elseif ( rule == 6 )
    degree = 15;
  elseif ( rule == 7 )
    degree = 18;
  else

    degree = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FAKETE_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'FAKETE_DEGREE - Fatal error!' )

  end

  return
end
