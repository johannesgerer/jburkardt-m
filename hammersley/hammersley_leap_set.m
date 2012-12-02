function hammersley_leap_set ( leap )

%*****************************************************************************80
%
%% HAMMERSLEY_LEAP_SET sets the leap vector of the leaped Hammersley subsequence.
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
%    Input, integer LEAP(1:DIM_NUM), the Hammersley leap vector.  
%    Each entry should be 1 or greater.  Only the integer
%    part of a base is used.
%
  global hammersley_LEAP
  global hammersley_DIM_NUM

  dim_num = hammersley_DIM_NUM;

  leap(1:dim_num) = floor ( leap(1:dim_num) );

  if ( ~halham_leap_check ( dim_num, leap ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_LEAP_SET - Fatal error!\n' );
    error ( 'HAMMERSLEY_LEAP_SET - Fatal error!' );
  end

  hammersley_LEAP(1:dim_num) = leap(1:dim_num);

  return
end
