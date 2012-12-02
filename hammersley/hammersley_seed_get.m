function seed = hammersley_seed_get ( )

%*****************************************************************************80
%
%% HAMMERSLEY_SEED_GET gets the seed vector of the leaped Hammersley subsequence.
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
%    Output, integer SEED(1:DIM_NUM), the Hammersley seed vector.   
%
  global hammersley_BASE
  global hammersley_LEAP
  global hammersley_DIM_NUM
  global hammersley_SEED
  global hammersley_STEP

  dim_num = hammersley_DIM_NUM;
  
  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_SEED_GET - Fatal error!\n' );
    error ( 'HAMMERSLEY_SEED_GET - Fatal error!' );
  end

  if ( length ( hammersley_SEED ) ~= dim_num )

    hammersley_SEED = [];
    
    for i = 1 : dim_num
      hammersley_SEED(i) = 0;
    end

  end

  seed(1:dim_num) = hammersley_SEED(1:dim_num);

  return
end
