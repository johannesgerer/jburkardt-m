function seed = halton_seed_get ( )

%*****************************************************************************80
%
%% HALTON_SEED_GET gets the seed vector of the leaped Halton subsequence.
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
%    Output, integer SEED(1:DIM_NUM), the Halton seed vector.   
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;
  
  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_SEED_GET - Fatal error!\n' );
    error ( 'HALTON_SEED_GET - Fatal error!' );
  end

  if ( length ( halton_SEED ) ~= dim_num )

    halton_SEED = [];
    
    for i = 1 : dim_num
      halton_SEED(i) = 0;
    end

  end

  seed(1:dim_num) = halton_SEED(1:dim_num);

  return
end
