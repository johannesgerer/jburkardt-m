function [ xy, w ] = fekete_rule ( rule, order_num )

%*****************************************************************************80
%
%% FEKETE_RULE returns the points and weights of a Fekete rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
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
%    Input, integer ORDER_NUM, the order (number of points) of the rule.
%
%    Output, real XY(2,ORDER_NUM), the points of the rule.
%
%    Output, real W(ORDER_NUM), the weights of the rule.
%

%
%  Get the suborder information.
%
  suborder_num = fekete_suborder_num ( rule );

  suborder = fekete_suborder ( rule, suborder_num );

  [ suborder_xyz, suborder_w ] = fekete_subrule ( rule, suborder_num );
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
      fprintf ( 1, 'FEKETE_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      error ( 'FEKETE_RULE - Fatal error!' );

    end

  end

  return
end
