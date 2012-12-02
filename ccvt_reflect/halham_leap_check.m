function value = halham_leap_check ( dim_num, leap )

%*****************************************************************************80
%
%% HALHAM_LEAP_CHECK checks LEAP for a Halton or Hammersley sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEAP(1:DIM_NUM), the leap vector.  
%    Each entry should be 1 or greater.  Only the integer
%    part of a base is used.
%
%    Output, logical VALUE, is true if LEAP is legal.
%
  if ( any ( leap(1:dim_num) < 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_LEAP_CHECK - Fatal error!\n' );
    fprintf ( 1, '  At least one of the input leap entries is <= 1!\n' );
    value = 0;
  else
    value = 1;
  end

  return
end
