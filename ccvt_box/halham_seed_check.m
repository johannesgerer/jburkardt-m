function value = halham_seed_check ( dim_num, seed )

%*****************************************************************************80
%
%% HALHAM_SEED_SET checks SEED for a Halton or Hammersley sequence.
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
%    Input, integer SEED(1:DIM_NUM), the seed of the leaped subsequence.  
%    Each base should be greater than 1.
%
%    Output, logical VALUE, is true if SEED is legal.
%
  if ( any ( seed(1:dim_num) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_SEED_CHECK - Fatal error!\n' );
    fprintf ( 1, '  At least one of the input seeds is < 0!\n' );
    value = 0;
  else
    value = 1;
  end

  return
end
