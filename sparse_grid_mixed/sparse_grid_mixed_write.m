function sparse_grid_mixed_write ( dim_num, rule, alpha, beta, point_num, ...
  sparse_weight, sparse_point, file_name )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_WRITE writes a sparse grid rule to five files.
%
%  Discussion:
%
%    The files are:
%    * the "A" file stores the ALPHA values, as a DIM_NUM x 1 list.
%    * the "B" file stores the BETA values, as a DIM_NUM x 1 list.
%    * the "R" file stores the region, as a DIM_NUM x 2 list.
%    * the "W" file stores the weights as a POINT_NUM list;
%    * the "X" file stores the abscissas as a DIM_NUM x POINT_NUM list;
%
%    The entries in the "R" file are the two corners of the DIM_NUM dimensional
%    rectangle that constitutes the integration region.  Coordinates that
%    should be infinite are set to 1.0E+30.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, int DIM_NUM, the spatial dimension.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested rule.
%     2, "F2",  Fejer Type 2, Open Fully Nested rule.
%     3, "GP",  Gauss Patterson, Open Fully Nested rule.
%     4, "GL",  Gauss Legendre, Open Weakly Nested rule.
%     5, "GH",  Gauss Hermite, Open Weakly Nested rule.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested rule.
%     7, "LG",  Gauss Laguerre, Open Non Nested rule.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested rule.
%     9, "GJ",  Gauss Jacobi, Open Non Nested rule.
%    10, "GW",  Golub Welsch, (presumed) Open Non Nested rule.
%    11, "CC_SE", Clenshaw Curtis Slow Exponential, Closed Fully Nested rule.
%    12, "F2_SE", Fejer Type 2 Slow Exponential, Closed Fully Nested rule.
%    13, "GP_SE", Gauss Patterson Slow Exponential, Closed Fully Nested rule.
%    14, "CC_ME", Clenshaw Curtis Moderate Exponential, Closed Fully Nested rule.
%    15, "F2_ME", Fejer Type 2 Moderate Exponential, Closed Fully Nested rule.
%    16, "GP_ME", Gauss Patterson Moderate Exponential, Closed Fully Nested rule.
%    17, "CCN", Clenshaw Curtis Nested, Linear, Closed Fully Nested rule.
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters used for
%    Generalized Hermite, Generalized Laguerre, and Jacobi rules.
%
%    Input, int POINT_NUM, the number of points in the grid.
%
%    Input, real SPARSE_WEIGHT(POINT_NUM), the weights.
%
%    Input, real SPARSE_POINT(DIM_NUM,POINT_NUM), the points.
%
%    Input, string FILE_NAME, the main part of the file name.
%
  for dim = 1 : dim_num
    if ( rule(dim) == 1 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 2 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 3 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 4 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 5 )
      sparse_region(dim,1) = - r8_huge ( );
      sparse_region(dim,2) = + r8_huge ( );
    elseif ( rule(dim) == 6 )
      sparse_region(dim,1) = - r8_huge ( );
      sparse_region(dim,2) = + r8_huge ( );
    elseif ( rule(dim) == 7 )
      sparse_region(dim,1) = 0.0;
      sparse_region(dim,2) = r8_huge ( );
    elseif ( rule(dim) == 8 )
      sparse_region(dim,1) = 0.0;
      sparse_region(dim,2) = r8_huge ( );
    elseif ( rule(dim) == 9 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 10 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPARSE_GRID_MIXED_WRITE - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to specify region for rules of type 10.\n');
      error ( 'SPARSE_GRID_MIXED_WRITE - Fatal error!' );
    elseif ( rule(dim) == 11 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 12 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 13 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 14 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 15 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 16 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    elseif ( rule(dim) == 17 )
      sparse_region(dim,1) = -1.0;
      sparse_region(dim,2) = +1.0;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPARSE_GRID_MIXED_WRITE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SPARSE_GRID_MIXED_WRITE - Fatal error!' );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_WRITE:\n' );

  file_name_a = strcat ( file_name, '_a.txt' );
  r8mat_write ( file_name_a, dim_num, 1, alpha );
  fprintf ( 1, '  Wrote the A file = "%s".\n', file_name_a );

  file_name_b = strcat ( file_name, '_b.txt' );
  r8mat_write ( file_name_b, dim_num, 1, beta );
  fprintf ( 1, '  Wrote the B file = "%s".\n', file_name_b );

  file_name_r = strcat ( file_name, '_r.txt' );
  r8mat_write ( file_name_r, dim_num, 2, sparse_region );
  fprintf ( 1, '  Wrote the R file = "%s".\n', file_name_r );

  file_name_w = strcat ( file_name, '_w.txt' );
  r8mat_write ( file_name_w, 1, point_num, sparse_weight );
  fprintf ( 1, '  Wrote the W file = "%s".\n', file_name_w );

  file_name_x = strcat ( file_name, '_x.txt' );
  r8mat_write ( file_name_x, dim_num, point_num, sparse_point );
  fprintf ( 1, '  Wrote the X file = "%s".\n', file_name_x );

  return
end
