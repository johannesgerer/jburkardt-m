function value = p29_exact ( dim_num )

%*****************************************************************************80
%
%% P29_EXACT returns the exact integral for problem 29.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral.
%
  r = 0.0;
  r = p29_r8 ( 'G', 'R', r );

  c = [];
  c = p29_r8vec ( 'G', 'C', dim_num, c );
%
%  Here, we need to generate all possible DIM_NUM tuples with
%  values of 0 or 1.
% 
  total = 0.0;

  rank = 0;
  ivec = [];

  while ( 1 )

    [ rank, ivec ] = tuple_next ( 0, 1, dim_num, rank, ivec );

    if ( rank == 0 )
      break
    end

    total = total + (-1.0)^sum(ivec(1:dim_num)) ...
      / ( 1.0 ...
      + ( ivec(1:dim_num) * c(1:dim_num)' ) )^r;

  end

  a = 1.0;
  for i = 0 : dim_num-1
    a = a * ( r + i );
  end

  value = total / ( a * prod ( c(1:dim_num) ) );

  return
end
