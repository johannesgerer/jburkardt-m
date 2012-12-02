function halton_leap_set ( leap )

%*****************************************************************************80
%
%% HALTON_LEAP_SET sets the leap vector of the leaped Halton subsequence.
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
%    Input, integer LEAP(1:DIM_NUM), the Halton leap vector.  
%    Each entry should be 1 or greater.  Only the integer
%    part of a base is used.
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  dim_num = halton_DIM_NUM;

  leap(1:dim_num) = floor ( leap(1:dim_num) );

  if ( ~halham_leap_check ( dim_num, leap ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_LEAP_SET - Fatal error!\n' );
    error ( 'HALTON_LEAP_SET - Fatal error!' );
  end

  halton_LEAP(1:dim_num) = leap(1:dim_num);

  return
end
