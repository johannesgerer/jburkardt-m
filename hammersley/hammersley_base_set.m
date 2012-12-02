function hammersley_base_set ( base )

%*****************************************************************************80
%
%% HAMMERSLEY_BASE_SET sets the base of the leaped Hammersley subsequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer BASE(1:DIM_NUM), the Hammersley bases.  
%
  global hammersley_BASE
  global hammersley_LEAP
  global hammersley_DIM_NUM
  global hammersley_SEED
  global hammersley_STEP

  dim_num = hammersley_DIM_NUM;

  base(1:dim_num) = floor ( base(1:dim_num) );

  if ( ~hammersley_base_check ( dim_num, base ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_BASE_SET - Fatal error!\n' );
    error ( 'HAMMERSLEY_BASE_SET - Fatal error!' );
  end

  hammersley_BASE(1:dim_num) = base(1:dim_num);

  return
end
