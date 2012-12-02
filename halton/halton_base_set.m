function halton_base_set ( base )

%*****************************************************************************80
%
%% HALTON_BASE_SET sets the base of the leaped Halton subsequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer BASE(1:DIM_NUM), the Halton bases.  
%    Each base should be greater than 1.  Only the integer
%    part of a base is used.
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;

  base(1:dim_num) = floor ( base(1:dim_num) );

  if ( ~halton_base_check ( dim_num, base ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_BASE_SET - Fatal error!\n' );
    error ( 'HALTON_BASE_SET - Fatal error!' );
  end

  halton_BASE(1:dim_num) = base(1:dim_num);

  return
end
