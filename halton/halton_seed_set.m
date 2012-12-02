function halton_seed_set ( seed )

%*****************************************************************************80
%
%% HALTON_SEED_SET sets the seed of the leaped Halton subsequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED(1:DIM_NUM), the seed of the leaped Halton subsequence.  
%    Each base should be greater than 1.
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;

  seed(1:dim_num) = floor ( seed(1:dim_num) );

  if ( ~halham_seed_check ( dim_num, seed ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_SEED_SET - Fatal error!\n' );
    error ( 'HALTON_SEED_SET - Fatal error!' );
  end

  halton_SEED(1:dim_num) = seed(1:dim_num);

  return
end
