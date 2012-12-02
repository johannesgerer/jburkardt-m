function x = r8vec_direct_product ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, x )

%*****************************************************************************80
%
%% R8VEC_DIRECT_PRODUCT creates a direct product of R8VEC's.
%
%  Discussion:
%
%    To explain what is going on here, suppose we had to construct
%    a multidimensional quadrature rule as the product of K rules
%    for 1D quadrature.
%
%    The product rule will be represented as a list of points and weights.
%
%    The J-th item in the product rule will be associated with
%      item J1 of 1D rule 1,
%      item J2 of 1D rule 2, 
%      ..., 
%      item JK of 1D rule K.
%
%    In particular, 
%      X(J) = ( X(1,J1), X(2,J2), ..., X(K,JK))
%    and
%      W(J) = W(1,J1) * W(2,J2) * ... * W(K,JK)
%
%    So we can construct the quadrature rule if we can properly
%    distribute the information in the 1D quadrature rules.
%
%    This routine carries out that task.
%
%    Another way to do this would be to compute, one by one, the
%    set of all possible indices (J1,J2,...,JK), and then index
%    the appropriate information.  An advantage of the method shown
%    here is that you can process the K-th set of information and
%    then discard it.
%
%  Example:
%
%    Rule 1: 
%      Order = 4
%      X(1:4) = ( 1, 2, 3, 4 )
%
%    Rule 2:
%      Order = 3
%      X(1:3) = ( 10, 20, 30 )
%
%    Rule 3:
%      Order = 2
%      X(1:2) = ( 100, 200 )
%
%    Product Rule:
%      Order = 24
%      X(1:24) = 
%        ( 1, 10, 100 )
%        ( 2, 10, 100 )
%        ( 3, 10, 100 )
%        ( 4, 10, 100 )
%        ( 1, 20, 100 )
%        ( 2, 20, 100 )
%        ( 3, 20, 100 )
%        ( 4, 20, 100 )
%        ( 1, 30, 100 )
%        ( 2, 30, 100 )
%        ( 3, 30, 100 )
%        ( 4, 30, 100 )
%        ( 1, 10, 200 )
%        ( 2, 10, 200 )
%        ( 3, 10, 200 )
%        ( 4, 10, 200 )
%        ( 1, 20, 200 )
%        ( 2, 20, 200 )
%        ( 3, 20, 200 )
%        ( 4, 20, 200 )
%        ( 1, 30, 200 )
%        ( 2, 30, 200 )
%        ( 3, 30, 200 )
%        ( 4, 30, 200 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR_INDEX, the index of the factor being processed.
%    The first factor processed must be factor 1%
%
%    Input, integer FACTOR_ORDER, the order of the factor.
%
%    Input, real FACTOR_VALUE(FACTOR_ORDER), the factor values
%    for factor FACTOR_INDEX.
%
%    Input, integer FACTOR_NUM, the number of factors.
%
%    Input, integer POINT_NUM, the number of elements in the direct product.
%
%    Input, real X(FACTOR_NUM,POINT_NUM), the elements of the
%    direct product, which are built up gradually.  
%
%    Output, real X(FACTOR_NUM,POINT_NUM), the elements of the
%    direct product, updated by the latest factor.
%
%  Local Parameters:
%
%    Local, integer START, the first location of a block of values to set.
%
%    Local, integer CONTIG, the number of consecutive values to set.
%
%    Local, integer SKIP, the distance from the current value of START
%    to the next location of a block of values to set.
%
%    Local, integer REP, the number of blocks of values to set.
%
  persistent contig;
  persistent rep;
  persistent skip;

  if ( factor_index == 1 )
    contig = 1;
    skip = 1;
    rep = point_num;
    x(1:factor_num,1:point_num) = 0.0;
  end

  rep = rep / factor_order;
  skip = skip * factor_order;

  for j = 1 : factor_order

    start = 1 + ( j - 1 ) * contig;

    for k = 1 : rep
      x(factor_index,start:start+contig-1) = factor_value(j);
      start = start + skip;
    end

  end

  contig = contig * factor_order;

  return
end
