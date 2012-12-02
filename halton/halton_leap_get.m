function leap = halton_leap_get ( )

%*****************************************************************************80
%
%% HALTON_BASE_GET gets the leap vector of the leaped Halton subsequence.
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
%    Output, integer LEAP(1:DIM_NUM), the Halton leap vector.   
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;
  
  if ( ~halham_dim_num_check ( dim_num ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_LEAP_GET - Fatal error!\n' );
    error ( 'HALTON_LEAP_GET - Fatal error!' );
  end

  if ( length ( halton_LEAP ) ~= dim_num )

    halton_LEAP = [];
    
    for i = 1 : dim_num
      halton_LEAP(i) = 1;
    end

  end

  leap(1:dim_num) = halton_LEAP(1:dim_num);

  return
end
