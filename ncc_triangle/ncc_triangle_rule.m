function [ xy, w ] = ncc_triangle_rule ( rule, order_num )

%*****************************************************************************80
%
%% NCC_TRIANGLE_RULE returns the points and weights of an NCC rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Silvester,
%    Symmetric Quadrature Formulae for Simplexes,
%    Mathematics of Computation,
%    Volume 24, Number 109, January 1970, pages 95-100.
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
  suborder_num = ncc_triangle_suborder_num ( rule );

  suborder = ncc_triangle_suborder ( rule, suborder_num );

  [ suborder_xyz, suborder_w ] = ncc_triangle_subrule ( rule, suborder_num );
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
      fprintf ( 1, 'NCC_TRIANGLE_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      error ( 'NCC_TRIANGLE_RULE - Fatal error!' );

    end

  end

  return
end
