function value = halton_base_check ( ndim, base )

%*****************************************************************************80
%
%% HALTON_BASE_CHECK checks BASE for a Halton sequence.
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
%    Input, integer BASE(1:NDIM), the bases.  
%    Each base should be greater than 1.  Only the integer
%    part of a base is used.
%
%    Output, logical VALUE, is true if BASE is legal.
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
