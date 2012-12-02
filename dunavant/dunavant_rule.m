function [ xy, w ] = dunavant_rule ( rule, order_num )

%*****************************************************************************80
%
%% DUNAVANT_RULE returns the points and weights of a Dunavant rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Dunavant,
%    High Degree Efficient Symmetrical Gaussian Quadrature Rules
%    for the Triangle, 
%    International Journal for Numerical Methods in Engineering,
%    Volume 21, 1985, pages 1129-1148.
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
%    Input, integer ORDER_NUM, the order (number of points) of the rule.
%
%    Output, real XY(2,ORDER_NUM), the points of the rule.
%
%    Output, real W(ORDER_NUM), the weights of the rule.
%

%
%  Get the suborder information.
%
  suborder_num = dunavant_suborder_num ( rule );

  suborder = dunavant_suborder ( rule, suborder_num );

  [ suborder_xyz, suborder_w ] = dunavant_subrule ( rule, suborder_num );
%
%  Expand the suborder information to a full order rule.
%
  o = 0;

  for s = 1 : suborder_num

    if ( suborder(s) == 1 )

      o = o + 1;
      xy(1:2,o) = suborder_xyz(1:2,s);
      w(o) = suborder_w(s);

    elseif ( suborder(s) == 3 )

      for k = 1 : 3
        o = o + 1;
        xy(1,o) = suborder_xyz ( i4_wrap(k,  1,3), s );
        xy(2,o) = suborder_xyz ( i4_wrap(k+1,1,3), s );
        w(o) = suborder_w(s);
      end

    elseif ( suborder(s) == 6 )

      for k = 1 : 3
        o = o + 1;
        xy(1,o) = suborder_xyz ( i4_wrap(k,  1,3), s );
        xy(2,o) = suborder_xyz ( i4_wrap(k+1,1,3), s );
        w(o) = suborder_w(s);
      end

      for k = 1 : 3
        o = o + 1;
        xy(1,o) = suborder_xyz ( i4_wrap(k+1,1,3), s );
        xy(2,o) = suborder_xyz ( i4_wrap(k,  1,3), s );
        w(o) = suborder_w(s);
      end

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'DUNAVANT_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      error ( 'DUNAVANT_RULE - Fatal error!' );

    end

  end

  return
end
