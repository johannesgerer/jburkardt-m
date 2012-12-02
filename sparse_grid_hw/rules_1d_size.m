function [ r1d_size, r1d ] = rules_1d_size ( k, sym, f_size )

%*****************************************************************************80
%
%% RULES_1D_SIZE determines the size of the packed RULES_1D array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the maximum level.
%    1 <= K.
%
%    Input, logical SYM, is TRUE if the rule is symmetric, so that symmetric
%    storage should be applied.
%
%    Input, int F_SIZE ( K ), for any level K,
%    returns in ORDER the size of the corresponding 1D rule.
%
%    Output, int R1D_SIZE, the dimension required for the
%    X1D and W1D arrays.
%
%    Output, int R1D(K+1), a pointer array.  
%    For 1 <= LEVEL <= K, the X values for rule I are stored in 
%    X1D(R1D(LEVEL)) through X1D(R1D(LEVEL+1)-1), and similarly for W.
%
  r1d_size = 0;
  r1d(1) = 1;

  for level = 1 : k

    order = f_size ( level );

    if ( sym )
      order = floor ( ( order + 1 ) / 2 );
    end

    r1d_size = r1d_size + order;
    r1d(level+1) = r1d(level) + order;

  end

  return
end
