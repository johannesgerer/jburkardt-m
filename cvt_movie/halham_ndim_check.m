function value = halham_ndim_check ( ndim )

%*****************************************************************************80
%
%% HALHAM_NDIM_CHECK checks NDIM for a Halton or Hammesley sequence.
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
%    Input, integer NDIM, the new value for the dimension.
%
%    Output, logical VALUE, is true if NDIM is legal.
%
  if ( ndim < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_NDIM_SET - Fatal error!\n' );
    fprintf ( 1, '  Input value of NDIM < 1!\n' );
    fprintf ( 1, '  NDIM = %d\n', ndim );
    value = 0;
  else
    value = 1;
  end

  return
end
