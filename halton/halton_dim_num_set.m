function halton_dim_num_set ( dim_num )

%*****************************************************************************80
%
%% HALTON_DIM_NUM_SET sets the dimension of the Halton sequence.
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
%    Input, integer DIM_NUM, the new value for the dimension.
%
  global halton_DIM_NUM

  dim_num = floor ( dim_num );

  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_DIM_NUM_SET - Fatal error!\n' );
    error ( 'HALTON_DIM_NUM_SET - Fatal error!' );
  end

  halton_DIM_NUM = dim_num;

  return
end
