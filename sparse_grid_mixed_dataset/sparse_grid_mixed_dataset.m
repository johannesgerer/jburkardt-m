function sparse_grid_mixed_dataset ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_DATASET computes a sparse grid of mixed 1D factors.
%
%  Discussion:
%
%    This program computes a sparse grid quadrature rule based on a mixture
%    of 1D rules, and writes it to a file.
%
%    The user specifies:
%    * M, the spatial dimension of the quadrature region,
%    * L, the level that defines the Smolyak grid.
%
%    Then the user specifies rules for each of the M dimensions.
%    A rule, when specified, may be used for one, or for multiple consecutive 
%    dimensions.
%
%    * RULE identifies the 1D rule.
%      "CC", "F2", "GP", "GL", "GH", "GGH", "LG", "GLG", "GJ", "GW",
%      "CCS", "F2S", "GPS".
%    * the number of times the rule is to be used.
%    * ALPHA parameter for that rule;
%    * BETA parameter for that rule.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2013
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
  addpath ( '../sparse_grid_mixed' )
  addpath ( '../sandia_rules' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the abscissas and weights of a quadrature rule\n' );
  fprintf ( 1, '  associated with a sparse grid derived from a Smolyak\n' );
  fprintf ( 1, '  construction based on a mixture of 1D rules.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inputs to the program include:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM, the spatial dimension.\n' );
  fprintf ( 1, '    (typically in the range of 2 to 10)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    LEVEL_MAX, the "level" of the sparse grid.\n' );
  fprintf ( 1, '    (typically in the range of 0, 1, 2, 3, ...\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Then the user defines 1D quadrature rules to be used.\n' );
  fprintf ( 1, ...
    '   Each rule is used for at least the "next" dimension, but can be\n' );
  fprintf ( 1, '   used for several or all remaining consecutive dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule definition requires:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * Rule identifier:\n' );
  fprintf ( 1, '    CC, F2, GP, GL, GH, GGH, LG, GLG, GJ, GW, CCS, F2S, GPS.\n' );
  fprintf ( 1, ...
    '  * Repetition factor (consecutive dimensions with same rule):\n' );
  fprintf ( 1, '  * ALPHA, (only for GGH, GLG, GJ rules)\n' );
  fprintf ( 1, '  * BETA, (only for GJ rule.)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output from the program includes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    * Files defining alphas, betas, ranges, weights, abscissas.\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    dim_num = input ( '  Enter the value of DIM_NUM (1 or greater): ' );
  elseif ( ischar ( dim_num ) )
    dim_num = str2num ( dim_num );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension requested is = %d\n', dim_num );
%
%  Get the level.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    level_max = input ( '  Enter the value of LEVEL_MAX (0 or greater): ' );
  elseif ( ischar ( level_max ) )
    level_max = str2num ( level_max );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
%
%  Now get the rules.
%
  alpha = zeros(dim_num,1);
  beta = zeros(dim_num,1);
  rule = zeros(dim_num,1);

  dim_index = 0;

  while ( dim_index < dim_num )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule identifiers include:\n' );
    fprintf ( 1, '  ''CC'', ''F2'', ''GP'', ''GL'', ''GH'', ''GGH'' ,'  );
    fprintf ( 1, '  ''LG'', ''GLG'', ''GJ'', ''GW'', ''CCS'', ''F2S'' ,' );
    fprintf ( 1, '  ''GPS''\n' );
    fprintf ( 1, '  Use QUOTES around the rule identifier.\n' );
    prompt = sprintf ( ...
      '  Enter the rule identifier for dimension %d:  ', dim_index + 1 );
    rule_string = input ( prompt );

    rule_1d = rule_string_to_index ( rule_string );

    fprintf ( 1, '\n' );
    dim_inc = input ( ...
      '  How many consecutive dimensions will this same rule be used?  ' );

    if ( dim_num < dim_index + dim_inc )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPARSE_GRID_MIXED_DATASET - Fatal error!\n' );
      fprintf ( 1, '  Dimension count exceeds limit.\n' );
      error ( 'SPARSE_GRID_MIXED_DATASET - Fatal error!' );
    end

    if ( rule_1d == 6 || rule_1d == 8 || rule_1d == 9 )
      alpha_1d = input ( '  Enter the parameter ALPHA for this rule:  ' );
    else
      alpha_1d = 0.0;
    end

    if ( rule_1d == 9 )
      beta_1d = input ( '  Enter the parameter BETA for this rule:  ' );
    else
      beta_1d = 0.0;
    end

    rule(dim_index+1:dim_index+dim_inc) = rule_1d;
    alpha(dim_index+1:dim_index+dim_inc) = alpha_1d;
    beta(dim_index+1:dim_index+dim_inc) = beta_1d;

    dim_index = dim_index + dim_inc;

  end
%
%  Get the filename.
%
  fprintf ( 1, '\n' );
  file_name = input ( ...
    '  Enter an identifier to use for the filenames (in QUOTES):  ' );
%
%  Create the dataset.
%
  tol = sqrt ( eps );

  sparse_grid_mixed_dataset_handle ( dim_num, level_max, rule, ...
    alpha, beta, tol, file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Remove libraries from the path.
%
  rmpath ( '../sparse_grid_mixed' )
  rmpath ( '../sandia_rules' )

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function rule_1d = rule_string_to_index ( rule_string )

%****************************************************************************80
%
%% RULE_STRING_TO_INDEX converts a string identifying a rule to an index.
%
%  Discussion:
%
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
%    11, "CCS", Clenshaw Curtis "Slow", Closed Fully Nested rule.
%    12, "F2S", Fejer Type 2 Slow, Closed Fully Nested rule.
%    13, "GPS", Gauss Patterson Slow, Closed Fully Nested rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string RULE_STRING, a string.
%
%    Output, integer RULE_1D, the rule index.
%
  if ( s_eqi ( rule_string, 'CC' ) )
    rule_1d = 1;
  elseif ( s_eqi ( rule_string, 'F2' ) )
    rule_1d = 2;
  elseif ( s_eqi ( rule_string, 'GP' ) )
    rule_1d = 3;
  elseif ( s_eqi ( rule_string, 'GL' ) )
    rule_1d = 4;
  elseif ( s_eqi ( rule_string, 'GH' ) )
    rule_1d = 5;
  elseif ( s_eqi ( rule_string, 'GGH' ) )
    rule_1d = 6;
  elseif ( s_eqi ( rule_string, 'LG' ) )
    rule_1d = 7;
  elseif ( s_eqi ( rule_string, 'GLG' ) )
    rule_1d = 8;
  elseif ( s_eqi ( rule_string, 'GJ' ) )
    rule_1d = 9;
  elseif ( s_eqi ( rule_string, 'GW' ) )
    rule_1d = 10;
  elseif ( s_eqi ( rule_string, 'CCS' ) )
    rule_1d = 11;
  elseif ( s_eqi ( rule_string, 'F2S' ) )
    rule_1d = 12;
  elseif ( s_eqi ( rule_string, 'GPS' ) )
    rule_1d = 13;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RULE_STRING_TO_INDEX - Fatal error!\n' );
    fprintf ( 1, '  Unexepected string.\n' );
    error ( 'RULE_STRING_TO_INDEX - Fatal error!' );
  end

  return
end
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = FALSE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = FALSE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  value = TRUE;

  return
end
function sparse_grid_mixed_dataset_handle ( dim_num, level_max, rule, alpha, ...
  beta, tol, file_name )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_DATASET_HANDLE creates the sparse grid mixed dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level that defines the grid.
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
%    11, "CCS", Clenshaw Curtis "Slow", Closed Fully Nested rule.
%    12, "F2S", Fejer Type 2 Slow, Closed Fully Nested rule.
%    13, "GPS", Gauss Patterson Slow, Closed Fully Nested rule.
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters used for
%    Generalized Gauss Hermite, Generalized Gauss Laguerre, and 
%    Gauss Jacobi rules.
%
%    Input, real TOL, the tolerance for point equality.
%
%    Input, string FILE_NAME, the main name of the output files.
%

%
%  Compute necessary data.
%
  point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule );

  point_num = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, ...
    beta, tol );

  sparse_unique_index = sparse_grid_mixed_unique_index ( ...
    dim_num, level_max, rule, alpha, beta, tol, point_num, point_total_num );

  [ sparse_order, sparse_index ] = sparse_grid_mixed_index ( ...
    dim_num, level_max, rule, point_num, point_total_num, sparse_unique_index );
%
%  Compute points and weights.
%
  sparse_point = sparse_grid_mixed_point ( dim_num, level_max, rule, ...
    alpha, beta, point_num, sparse_order, sparse_index );

  sparse_weight = sparse_grid_mixed_weight ( dim_num, level_max, rule, ...
    alpha, beta, point_num, point_total_num, sparse_unique_index );
%
%  Write points and weights to files.
%
  sparse_grid_mixed_write ( dim_num, rule, alpha, beta, point_num, ...
    sparse_weight, sparse_point, file_name );

  return
end

