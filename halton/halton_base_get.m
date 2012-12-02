function base = halton_base_get ( )

%*****************************************************************************80
%
%% HALTON_BASE_GET gets the bases of the leaped Halton subsequence.
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
%    Output, integer BASE(1:DIM_NUM), the Halton bases.   
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;

  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_BASE_GET - Fatal error!\n' );
    error ( 'HALTON_BASE_GET - Fatal error!' );
  end

  if ( length ( halton_BASE ) ~= dim_num )

    halton_BASE = [];
    
    for i = 1 : dim_num
      halton_BASE(i) = prime ( i );
    end

  end

  base(1:dim_num) = halton_BASE(1:dim_num);

  return
end
