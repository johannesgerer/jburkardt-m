function value = halham_dim_num_check ( dim_num )

%*****************************************************************************80
%
%% HALHAM_DIM_NUM_CHECK checks DIM_NUM for a Halton or Hammesley sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the new value for the dimension.
%
%    Output, logical VALUE, is true if DIM_NUM is legal.
%
  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_DIM_NUM_SET - Fatal error!\n' );
    fprintf ( 1, '  Input value of DIM_NUM < 1!\n' );
    fprintf ( 1, '  DIM_NUM = %d\n', dim_num );
    value = 0;
  else
    value = 1;
  end

  return
end
