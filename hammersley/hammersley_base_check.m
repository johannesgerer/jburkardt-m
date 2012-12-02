function value = hammersley_base_check ( dim_num, base )

%*****************************************************************************80
%
%% HAMMERSLEY_BASE_CHECK checks BASE for a Hammersley sequence.
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
%    Input, integer BASE(1:DIM_NUM), the bases.  
%    Bases should not be 0 or 1.
%
%    Output, logical VALUE, is true if BASE is legal.
%
  if ( any ( base(1:dim_num) == 0 ) | any ( base(1:dim_num) == 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMERSLEY_BASE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  BASE(I) = 0 or 1 for some I!\n' );
    value = 0;
  else
    value = 1;
  end

  return
end
