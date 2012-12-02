function w = r8vec_direct_product2 ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, w )

%*****************************************************************************80
%
%% R8VEC_DIRECT_PRODUCT2 creates a direct product of R8VEC's.
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
%    This routine carries out that task for the weights W.
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
%      W(1:4) = ( 2, 3, 5, 7 )
%
%    Rule 2:
%      Order = 3
%      W(1:3) = ( 11, 13, 17 )
%
%    Rule 3:
%      Order = 2
%      W(1:2) = ( 19, 23 )
%
%    Product Rule:
%      Order = 24
%      W(1:24) =
%        ( 2 * 11 * 19 )
%        ( 3 * 11 * 19 )
%        ( 4 * 11 * 19 )
%        ( 7 * 11 * 19 )
%        ( 2 * 13 * 19 )
%        ( 3 * 13 * 19 )
%        ( 5 * 13 * 19 )
%        ( 7 * 13 * 19 )
%        ( 2 * 17 * 19 )
%        ( 3 * 17 * 19 )
%        ( 5 * 17 * 19 )
%        ( 7 * 17 * 19 )
%        ( 2 * 11 * 23 )
%        ( 3 * 11 * 23 )
%        ( 5 * 11 * 23 )
%        ( 7 * 11 * 23 )
%        ( 2 * 13 * 23 )
%        ( 3 * 13 * 23 )
%        ( 5 * 13 * 23 )
%        ( 7 * 13 * 23 )
%        ( 2 * 17 * 23 )
%        ( 3 * 17 * 23 )
%        ( 5 * 17 * 23 )
%        ( 7 * 17 * 23 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR_INDEX, the index of the factor being processed.
%    The first factor processed must be factor 1.
%
%    Input, integer FACTOR_ORDER, the order of the factor.
%
%    Input, real FACTOR_VALUE(FACTOR_ORDER), the factor values for
%    factor FACTOR_INDEX.
%
%    Input, integer FACTOR_NUM, the number of factors.
%
%    Input, integer POINT_NUM, the number of elements in the direct product.
%
%    Input/output, real W(POINT_NUM), the elements of the
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
    w(1:point_num) = 1.0;
  end

  rep = rep / factor_order;
  skip = skip * factor_order;

  for j = 1 : factor_order

    start = 1 + ( j - 1 ) * contig;

    for k = 1 : rep
      w(start:start+contig-1) = w(start:start+contig-1) * factor_value(j);
      start = start + skip;
    end

  end

  contig = contig * factor_order;

  return
end
