function hammersley_seed_set ( seed )

%*****************************************************************************80
%
%% HAMMERSLEY_SEED_SET sets the seed of the leaped Hammersley subsequence.
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
%    Input, integer SEED(1:DIM_NUM), the seed of the leaped Hammersley subsequence.  
%    Each base should be greater than 1.
%
  global hammersley_BASE
  global hammersley_LEAP
  global hammersley_DIM_NUM
  global hammersley_SEED
  global hammersley_STEP

  dim_num = hammersley_DIM_NUM;

  seed(1:dim_num) = floor ( seed(1:dim_num) );

  if ( ~halham_seed_check ( dim_num, seed ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_SEED_SET - Fatal error!\n' );
    error ( 'HAMMERSLEY_SEED_SET - Fatal error!' );
  end

  hammersley_SEED(1:dim_num) = seed(1:dim_num);

  return
end
