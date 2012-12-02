function test_tri_int_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests P00_VERTEX_SUB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
  exact = 1.0;
  level_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  P00_VERTEX_SUB applies a vertex rule with subdivision.\n' );

  prob_num = get_prob_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem            Exact\n' );
  fprintf ( 1, '           Pts       Approx        Error\n' );
  fprintf ( 1, '\n' );
%
%  Pick a problem.
%
  for problem = 1 : prob_num

    title = p00_title ( problem );
    singularity = p00_singularity ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n',title )
    fprintf ( 1, '%8d        %12f\n', problem, exact );
    fprintf ( 1, '\n' );

    if ( singularity == 1 )
      fprintf ( 1, '  Skip this problem, it has vertex singularities.\n' );
    elseif ( singularity == 2 )
      fprintf ( 1, '  Skip this problem, it has edge singularities.\n' );
    elseif ( singularity == 3 )
      fprintf ( 1, '  Skip this problem, it has internal singularities.\n' );
    else
%
%  Pick a number of points.
%
      n = 0;
      result = 0.0;

      for level = 0 : 4

        [ result, n ] = p00_vertex_sub ( problem, level, n, result );

        abs_error = abs ( exact - result );

        fprintf ( 1, '      %8d  %12f  %12f\n', n, result, abs_error );

      end

    end

  end

  return
end
