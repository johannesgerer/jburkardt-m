function sgmga_size_table

%*****************************************************************************80
%
%% MAIN is the main program for SGMGA_SIZE_TABLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2010
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../sandia_rules' );

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_SIZE_TABLE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make tables of point counts.\n' );
  fprintf ( 1, '  Measure the CPU time for each table.\n' );
%
%  Clenshaw-Curtis Grid (1), slow exponential growth (4).
%
  rule_1d = 1;
  growth_1d = 4;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Clenshaw Curtis Grid (1), exponential growth (6).
%
  rule_1d = 1;
  growth_1d = 6;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Clenshaw Curtis Grid (1), exponential growth (6).
%
  if ( 0 )
    rule_1d = 1;
    growth_1d = 6;
    np_1d = 0;
    p_1d = [];
    dim_min = 6;
    dim_max = 10;
    level_max_min = 0;
    level_max_max = 5;
    sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
      level_max_min, level_max_max );
    ctime = toc ( );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  CPU Time = %f\n', ctime );
  end
%
%  Clenshaw Curtis Grid (1), exponential growth (6).
%
  rule_1d = 1;
  growth_1d = 6;
  np_1d = 0;
  p_1d = [];
  dim_min = 100;
  dim_max = 100;
  level_max_min = 0;
  level_max_max = 2;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Patterson Grid (3), slow exponential growth (4).
%
  rule_1d = 3;
  growth_1d = 4;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Patterson Grid (3), moderate exponential growth (5).
%
  rule_1d = 3;
  growth_1d = 5;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Patterson Grid (3), exponential growth (6).
%
  rule_1d = 3;
  growth_1d = 6;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Legendre Grid (4), slow linear odd growth (2).
%
  rule_1d = 4;
  growth_1d = 2;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Legendre Grid (4), moderate linear growth (3).
%
  rule_1d = 4;
  growth_1d = 3;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Gauss Laguerre Grid (7), moderate linear growth (3).
%
  rule_1d = 7;
  growth_1d = 3;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Hermite Genz Keister (10), slow exponential growth (4).
%
  rule_1d = 10;
  growth_1d = 4;
  np_1d = 0;
  p_1d = [];
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;
  tic ( );
  sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
    level_max_min, level_max_max );
  ctime = toc ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPU Time = %f\n', ctime );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_SIZE_TABLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
