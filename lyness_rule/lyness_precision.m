function precision = lyness_precision ( rule )

%*****************************************************************************80
%
%% LYNESS_PRECISION returns the precision of a Lyness quadrature rule.
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
%    Output, integer PRECISION, the precision of the rule.
%
  if ( rule == 0 )
    precision = 1;
  elseif ( rule == 1 )
    precision = 2;
  elseif ( rule == 2 )
    precision = 2;
  elseif ( rule == 3 )
    precision = 3;
  elseif ( rule == 4 )
    precision = 3;
  elseif ( rule == 5 )
    precision = 4;
  elseif ( rule == 6 )
    precision = 4;
  elseif ( rule == 7 )
    precision = 4;
  elseif ( rule == 8 )
    precision = 5;
  elseif ( rule == 9 )
    precision = 5;
  elseif ( rule == 10 )
    precision = 6;
  elseif ( rule == 11 )
    precision = 6;
  elseif ( rule == 12 )
    precision = 6;
  elseif ( rule == 13 )
    precision = 7;
  elseif ( rule == 14 )
    precision = 7;
  elseif ( rule == 15 )
    precision = 8;
  elseif ( rule == 16 )
    precision = 8;
  elseif ( rule == 17 )
    precision = 8;
  elseif ( rule == 18 )
    precision = 9;
  elseif ( rule == 19 )
    precision = 9;
  elseif ( rule == 20 )
    precision = 11;
  elseif ( rule == 21 )
    precision = 11;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LYNESS_PRECISION - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized rule index.\n' );
    error ( 'LYNESS_PRECISION - Fatal error!' );
  end

  return
end
