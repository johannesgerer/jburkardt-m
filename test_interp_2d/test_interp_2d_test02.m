function test_interp_2d_test02 ( )

%*****************************************************************************80
%
%% TEST_INTERP_2D_TEST02 samples each function using each grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_2D_TEST02\n' );
  fprintf ( 1, '  Sample each function over each grid.\n' );

  g_num = g00_num ( );
  f_num = f00_num ( );

  for fi = 1 : f_num

    ft = f00_title ( fi );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %2d  %s\n', fi, ft );
    fprintf ( 1, '        Grid Title                     Min(F)' );
    fprintf ( 1, '          Ave(F)           Max(F)\n' );
    fprintf ( 1, '\n' );

    for gi = 1 : g_num

      gt = g00_title ( gi );
      gn = g00_size ( gi );

      [ gx, gy ] = g00_xy ( gi, gn );

      f = f00_f0 ( fi, gn, gx, gy );

      f_max = max ( f(1:gn) );
      f_min = min ( f(1:gn) );
      f_ave = sum ( f(1:gn) ) / gn;

      fprintf ( 1, '  %4d  %25s  %14.6g  %14.6g  %14.6g\n', ...
        gi, gt, f_min, f_ave, f_max );

    end

  end

  return
end
