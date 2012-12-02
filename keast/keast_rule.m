function [ xyz, w ] = keast_rule ( rule, order_num )

%*****************************************************************************80
%
%% KEAST_RULE returns the points and weights of a Keast rule.
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
%    Input, integer ORDER_NUM, the order (number of points) of the rule.
%
%    Output, real XYZ(3,ORDER_NUM), the points of the rule.
%
%    Output, real W(ORDER_NUM), the weights of the rule.
%

%
%  Get the suborder information.
%
  suborder_num = keast_suborder_num ( rule );

  suborder = keast_suborder ( rule, suborder_num );

  [ suborder_xyzz, suborder_w ] = keast_subrule ( rule, suborder_num );
%
%  Expand the suborder information to a full order rule.
%
  o = 0;

  for s = 1 : suborder_num

    if ( suborder(s) == 1 )

      o = o + 1;
      xyz(1:3,o) = suborder_xyzz(1:3,s);
      w(o) = suborder_w(s);
%
%  For SUBORDER = 4, we list the coordinates of the generator as
%
%    A,B,B,B
%
%  and we generate
%
%    A, B, B = (1,2,3)
%    B, B, B = (2,3,4)
%    B, B, A = (3,4,1)
%    B, A, B = (4,1,2)
%
    elseif ( suborder(s) == 4 )

      for k = 1 : 4
        o = o + 1;
        xyz(1,o) = suborder_xyzz ( i4_wrap(k,  1,4), s );
        xyz(2,o) = suborder_xyzz ( i4_wrap(k+1,1,4), s );
        xyz(3,o) = suborder_xyzz ( i4_wrap(k+2,1,4), s );
        w(o) = suborder_w(s);
      end
%
%  For SUBORDER = 6, we list the coordinates of the generator as
%
%    A,A,B,B
%
%  and we generate
%
%    B, A, A = (4,1,2)
%    A, B, A = (1,4,2)
%    A, A, B = (1,2,4)
%
%    A, B, B = (1,3,4)
%    B, A, B = (4,2,3)
%    B, B, A = (4,3,1)
%
    elseif ( suborder(s) == 6 )

      for k = 1 : 3
        o = o + 1;
        xyz(1:3,o) = suborder_xyzz ( 1, s );
        xyz(k,o)   = suborder_xyzz ( 3, s );
        w(o) = suborder_w(s);
      end

      for k = 1 : 3
        o = o + 1;
        xyz(1:3,o) = suborder_xyzz ( 3, s );
        xyz(k,o)   = suborder_xyzz ( 1, s );
        w(o) = suborder_w(s);
      end
%
%  For SUBORDER = 12, we list the coordinates of the generator as
%
%    A,A,B,C
%
%  and we generate
%
%    B, A, A
%    A, B, A
%    A, A, B
%
%    C, A, A
%    A, C, A
%    A, A, C
%
%    A, B, C
%    B, C, A
%    C, A, B
%    A, C, B
%    C, B, A
%    B, A, C
%
    elseif ( suborder(s) == 12 )

      for k = 1 : 3
        o = o + 1;
        xyz(1:3,o) = suborder_xyzz ( 1, s );
        xyz(k,o)   = suborder_xyzz ( 3, s );
        w(o) = suborder_w(s);
      end

      for k = 1 : 3
        o = o + 1;
        xyz(1:3,o) = suborder_xyzz ( 1, s );
        xyz(k,o)   = suborder_xyzz ( 4, s );
        w(o) = suborder_w(s);
      end

      for k = 1 : 3
        o = o + 1;
        xyz(1,o) = suborder_xyzz ( i4_wrap(k+1,2,4), s );
        xyz(2,o) = suborder_xyzz ( i4_wrap(k+2,2,4), s );
        xyz(3,o) = suborder_xyzz ( i4_wrap(k+3,2,4), s );
        w(o) = suborder_w(s);
      end
      
      for k = 1 : 3
        o = o + 1;
        xyz(1,o) = suborder_xyzz ( i4_wrap(k+1,2,4), s );
        xyz(2,o) = suborder_xyzz ( i4_wrap(k+3,2,4), s );
        xyz(3,o) = suborder_xyzz ( i4_wrap(k+2,2,4), s );
        w(o) = suborder_w(s);
      end


    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'KEAST_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      fprintf ( 1, '  RULE =    %d\n', rule );
      fprintf ( 1, '  ORDER_NUM = %d\n', order_num );
      error ( 'KEAST_RULE - Fatal error!\n' );

    end

  end

  return
end
