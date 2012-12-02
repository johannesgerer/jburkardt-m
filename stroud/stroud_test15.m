function stroud_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests CIRCLE_RT_SET, CIRCLE_RT_SUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_2D_INDEX;

  max_r = 10;
  max_rule = 9;
  max_t = 20;

  r = 1.0;
  xc = 1.0;
  yc = 1.0;

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  For R, Theta product rules on the unit circle,\n' );
  fprintf ( 1, '  CIRCLE_RT_SET sets a rule.\n' );
  fprintf ( 1, '  CIRCLE_RT_SUM uses the rule in an arbitrary circle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a radius %f\n', r );
  fprintf ( 1, '  and center:\n' );
  fprintf ( 1, '  XC = %f\n', xc );
  fprintf ( 1, '  YC = %f\n', yc );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo +  4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:       ' );
    for rule = ilo : ihi
      fprintf ( 1, '%7d       ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        [ nr, nt, nc ] = circle_rt_size ( rule );

        [ ra, rw, ta, tw, zw ] = circle_rt_set ( rule, nr, nt, nc );

        result(rule) = circle_rt_sum ( 'function_2d', xc, yc, r, nr, ra, rw, nt, ...
          ta, tw, zw );

      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s' );
      for rule = ilo : ihi
        fprintf ( 1, '  %12f', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
