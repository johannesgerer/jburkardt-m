function leap = hammersley_leap_get ( )

%*****************************************************************************80
%
%% HAMMERSLEY_BASE_GET gets the leap vector of the leaped Hammersley subsequence.
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
%    Output, integer LEAP(1:DIM_NUM), the Hammersley leap vector.   
%
  global hammersley_BASE
  global hammersley_LEAP
  global hammersley_DIM_NUM
  global hammersley_SEED
  global hammersley_STEP

  dim_num = hammersley_DIM_NUM;
  
  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_LEAP_GET - Fatal error!\n' );
    error ( 'HAMMERSLEY_LEAP_GET - Fatal error!' );
  end

  if ( length ( hammersley_LEAP ) ~= dim_num )

    hammersley_LEAP = [];
    
    for i = 1 : dim_num
      hammersley_LEAP(i) = 1;
    end

  end

  leap(1:dim_num) = hammersley_LEAP(1:dim_num);

  return
end
