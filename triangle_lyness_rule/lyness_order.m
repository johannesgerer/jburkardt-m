function order = lyness_order ( rule )

%*****************************************************************************80
%
%% LYNESS_ORDER returns the order of a Lyness quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Lyness, Dennis Jespersen,
%    Moderate Degree Symmetric Quadrature Rules for the Triangle,
%    Journal of the Institute of Mathematics and its Applications,
%    Volume 15, Number 1, February 1975, pages 19-32.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer ORDER, the order of the rule.
%
  if ( rule == 0 )
    order = 1;
  elseif ( rule == 1 )
    order = 3;
  elseif ( rule == 2 )
    order = 4;
  elseif ( rule == 3 )
    order = 4;
  elseif ( rule == 4 )
    order = 7;
  elseif ( rule == 5 )
    order = 6;
  elseif ( rule == 6 )
    order = 10;
  elseif ( rule == 7 )
    order = 9;
  elseif ( rule == 8 )
    order = 7;
  elseif ( rule == 9 )
    order = 10;
  elseif ( rule == 10 )
    order = 12;
  elseif ( rule == 11 )
    order = 16;
  elseif ( rule == 12 )
    order = 13;
  elseif ( rule == 13 )
    order = 13;
  elseif ( rule == 14 )
    order = 16;
  elseif ( rule == 15 )
    order = 16;
  elseif ( rule == 16 )
    order = 21;
  elseif ( rule == 17 )
    order = 16;
  elseif ( rule == 18 )
    order = 19;
  elseif ( rule == 19 )
    order = 22;
  elseif ( rule == 20 )
    order = 27;
  elseif ( rule == 21 )
    order = 28;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LYNESS_ORDER - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized rule index.\n' );
    error ( 'LYNESS - Fatal error!' );
  end

  return
end
