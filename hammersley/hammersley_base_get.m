function base = hammersley_base_get ( )

%*****************************************************************************80
%
%% HAMMERSLEY_BASE_GET gets the bases of the leaped Hammersley subsequence.
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
%    Output, integer BASE(1:DIM_NUM), the Hammersley bases. 
%
  global hammersley_BASE
  global hammersley_LEAP
  global hammersley_DIM_NUM
  global hammersley_SEED
  global hammersley_STEP
  
  dim_num = hammersley_DIM_NUM;

  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_BASE_GET - Fatal error!\n' );
    error ( 'HAMMERSLEY_BASE_GET - Fatal error!' );
  end

  if ( length ( hammersley_BASE ) ~= dim_num )

    hammersley_BASE = [];
    
    for i = 1 : dim_num
      hammersley_BASE(i) = prime ( i );
    end

  end

  base(1:dim_num) = hammersley_BASE(1:dim_num);

  return
end
