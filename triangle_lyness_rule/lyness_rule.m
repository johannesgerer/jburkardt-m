function [ w, x ] = lyness_rule ( rule, order )

%*****************************************************************************80
%
%% LYNESS_RULE returns the points and weights of a Lyness quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2010
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
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights.
%
%    Output, real X(2,ORDER), the points.
%

%
%  Get the suborder information.
%
  suborder_num = lyness_suborder_num ( rule );

  suborder = lyness_suborder ( rule, suborder_num );

  [ sub_xyz, sub_w ] = lyness_subrule ( rule, suborder_num );
%
%  Expand the suborder information to a full order rule.
%
  x = zeros ( 2, order );
  w = zeros ( 1, order );

  o = 0;

  for s = 1 : suborder_num

    if ( suborder(s) == 1 )

      o = o + 1;
      x(1:2,o) = sub_xyz(1:2,s);
      w(o) = sub_w(s);

    elseif ( suborder(s) == 3 )

      for k = 1 : 3
        o = o + 1;
        x(1,o) = sub_xyz ( i4_wrap(k,  1,3), s );
        x(2,o) = sub_xyz ( i4_wrap(k+1,1,3), s );
        w(o) = sub_w(s) / 3.0;
      end

    elseif ( suborder(s) == 6 )

      for k = 1 : 3
        o = o + 1;
        x(1,o) = sub_xyz ( i4_wrap(k,  1,3), s );
        x(2,o) = sub_xyz ( i4_wrap(k+1,1,3), s );
        w(o) = sub_w(s) / 6.0;
      end

      for k = 1 : 3
        o = o + 1;
        x(1,o) = sub_xyz ( i4_wrap(k+1,1,3), s );
        x(2,o) = sub_xyz ( i4_wrap(k,  1,3), s );
        w(o) = sub_w(s) / 6.0;
      end

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'LYNESS_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      error ( 'LYNESS_RULE - Fatal error!' );

    end

  end

  return
end
