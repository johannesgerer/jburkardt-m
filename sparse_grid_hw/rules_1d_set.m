function [ x1d, w1d ] = rules_1d_set ( k, sym, f_size, f_set, r1d_size, r1d )

%*****************************************************************************80
%
%% RULES_1D_SET sets the packed vectors of 1D nodes and weights.
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
%    Input, ORDER = F_SIZE ( K ), for any level K,
%    returns in ORDER the size of the corresponding 1D rule.
%
%    Input, [ X, W ] = F_SET ( ORDER, X, W ), for any level K,
%    returns the ORDER values of nodes and weights.
%
%    Input, integer R1D_SIZE, the dimension required for the
%    X1D and W1D arrays.
%
%    Input, integer R1D(K+1), a pointer array.  
%    For 1 <= LEVEL <= K, the X values for rule I are stored in 
%    X1D(R1D(LEVEL)) through X1D(R1D(LEVEL+1)-1), and similarly for W.
%
%    Output, real X1D(R1D_SIZE), the nodes for levels 1 to K.
%
%    Output, real W1D(R1D_SIZE), the weights for levels 1 to K.
%
  x1d = zeros ( r1d_size, 1 );
  w1d = zeros ( r1d_size, 1 );

  ihi = 0;

  for level = 1 : k

    order = f_size ( level );

    [ x, w ] = f_set ( order );

    if ( sym )
      jlo = floor ( ( order + 2 ) / 2 );
      jhi = order;
      order = floor ( ( order + 1 ) / 2 );
    else
      jlo = 1;
      jhi = order;
    end

    jhi = jlo + order - 1;

    ilo = ihi + 1;
    ihi = ilo + order - 1;

    x1d(ilo:ihi) = x(jlo:jhi);
    w1d(ilo:ihi) = w(jlo:jhi);

  end

  return
end
