function value = halton_base_check ( ndim, base )

%*****************************************************************************80
%
%% HALTON_BASE_CHECK is TRUE if BASE is legal.
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
%    Input, integer NDIM, the spatial dimension.
%
%    Input, integer BASE(1:NDIM), the Halton bases.  
%    Each base should be greater than 1.  Only the integer
%    part of a base is used.
%
%    Output, logical VALUE.
%
  if ( any ( base(1:ndim) <= 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_BASE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  At least one of the input bases is <= 1!\n' );
    value = 0;
  else
    value = 1;
  end

  return
end
