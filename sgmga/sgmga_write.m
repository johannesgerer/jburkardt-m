function sgmga_write ( dim_num, level_weight, rule, growth, np, p, ...
  point_num, sparse_weight, sparse_point, file_name )

%*****************************************************************************80
%
%% SGMGA_WRITE writes an SGMGA rule to several files.
%
%  Discussion:
%
%    The files are:
%    * the "A" file stores the LEVEL_WEIGHT values, as a 1 x DIM_NUM list.
%    * the "N" file stores the NP values, as a DIM_NUM x 1 list.
%    * the "P" file stores the P values, as a sum(NP(1:DIM_NUM) x 1 list.
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
%    09 June 2010
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
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial 
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weights.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested.
%     2, "F2",  Fejer Type 2, Open Fully Nested.
%     3, "GP",  Gauss Patterson, Open Fully Nested.
%     4, "GL",  Gauss Legendre, Open Weakly Nested.
%     5, "GH",  Gauss Hermite, Open Weakly Nested.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested.
%     7, "LG",  Gauss Laguerre, Open Non Nested.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested.
%     9, "GJ",  Gauss Jacobi, Open Non Nested.
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH(DIM_NUM), the growth in each dimension.
%    0, "DF", default growth associated with this quadrature rule;
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Input, integer NP(DIM_NUM), the number of parameters used by each rule.
%
%    Input, real P(*), the parameters needed by each rule.
%
%    Input, integer POINT_NUM, the number of unique points
%    in the grid.
%
%    Input, real SPARSE_WEIGHT(POINT_NUM), the weights.
%
%    Input, real SPARSE_POINT(DIM_NUM,POINT_NUM), the points.
%
%    Input, character ( len = * ) FILE_NAME, the main part of the file name.
%

%
%  Construct values needed for the "R" file.
%
  sparse_region = zeros(dim_num,2);
  
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
      sparse_region(dim,1) = - r8_huge ( );
      sparse_region(dim,2) = + r8_huge ( );
%
%  Best guess for region extent for rules of type 11 or 12.
%
    elseif ( rule(dim) == 11 )
      sparse_region(dim,1) = min ( sparse_point(dim,1:point_num) );
      sparse_region(dim,2) = max ( sparse_point(dim,1:point_num) );
    elseif ( rule(dim) == 12 )
      sparse_region(dim,1) = min ( sparse_point(dim,1:point_num) );
      sparse_region(dim,2) = max ( sparse_point(dim,1:point_num) );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_WRITE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SGMGA_WRITE - Fatal error!' );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_WRITE:\n' );

  file_name_a = strcat ( file_name, '_a.txt' );
  r8mat_write ( file_name_a, 1, dim_num, level_weight' );
  fprintf ( 1, '  Wrote the A file = "%s".\n', file_name_a );

  file_name_n = strcat ( file_name, '_n.txt' );
  i4mat_write ( file_name_n, 1, dim_num, np' );
  fprintf ( 1, '  Wrote the N file = "%s".\n', file_name_n );

  np_sum = sum ( np(1:dim_num) );
  file_name_p = strcat ( file_name, '_p.txt' );
  r8mat_write ( file_name_p, 1, np_sum, p' );
  fprintf ( 1, '  Wrote the P file = "%s".\n', file_name_p );

  file_name_r = strcat ( file_name, '_r.txt' );
  r8mat_write ( file_name_r, dim_num, 2, sparse_region );
  fprintf ( 1, '  Wrote the R file = "%s".\n', file_name_r );

  file_name_w = strcat ( file_name, '_w.txt' );
  r8mat_write ( file_name_w, 1, point_num, sparse_weight' );
  fprintf ( 1, '  Wrote the W file = "%s".\n', file_name_w );

  file_name_x = strcat ( file_name, '_x.txt' );
  r8mat_write ( file_name_x, dim_num, point_num, sparse_point );
  fprintf ( 1, '  Wrote the X file = "%s".\n', file_name_x );

  return
end
