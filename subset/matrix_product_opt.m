function [ cost, order ] = matrix_product_opt ( n, rank )

%*****************************************************************************80
%
%% MATRIX_PRODUCT_OPT determines the optimal cost of a matrix product.
%
%  Discussion:
%
%    The cost of multiplying an LxM matrix by an M by N matrix is
%    assessed as L*M*N.
%
%    Any particular order of multiplying a set of N matrices is equivalent
%    to parenthesizing an expression of N objects.
%
%    The actual number of ways of parenthesizing an expression
%    of N objects is C(N), the N-th Catalan number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Sedgewick,
%    Algorithms,
%    Addison-Wesley, 1984, pages 486-489.
%
%  Parameters:
%
%    Input, integer N, the number of matrices to be multiplied.
%
%    Input, integer RANK(N+1), the rank information for the matrices.
%    Matrix I has RANK(I) rows and RANK(I+1) columns.
%
%    Output, integer COST, the cost of the multiplication if the optimal
%    order is used.
%
%    Output, integer ORDER(N-1), indicates the order in which the N-1
%    multiplications are to be carried out.  ORDER(1) is the first
%    multiplication to do, and so on.
%
  order = zeros ( n - 1, 1 );

  cost2 = zeros( n, n );
%
%  Initialize the cost matrix.
%
  for i = 1 : n

    cost2(i,1:i) = 0;
    cost2(i,i+1:n) = i4_huge ( );

  end
%
%  Initialize the BEST matrix.
%
  best(1:n,1:n) = 0;
%
%  Compute the cost and best matrices.
%
  for j = 1 : n-1
    for i = 1 : n-j
      for k = i+1 : i+j
        cost3 = cost2(i,k-1) + cost2(k,i+j) + rank(i) * rank(k) * rank(i+j+1);
        if ( cost3 < cost2(i,i+j) )
          cost2(i,i+j) = cost3;
          best(i,i+j) = k;
        end
      end
    end
  end
%
%  Pick off the optimal cost.
%
  cost = cost2(1,n);
%
%  Backtrack to determine the optimal order.
%
  stack_num = 0;
  stacks = zeros ( 100, 1 );

  i1 = 1;
  i2 = n;

  if ( i1 + 1 < i2 )
    stack_num = stack_num + 1;
    stacks(stack_num) = i1;
    stack_num = stack_num + 1;
    stacks(stack_num) = i2;
  end

  step = n - 1;
%
%  Take an item off the stack.
%
  while ( 0 < stack_num )

    i3 = stacks(stack_num);
    stack_num = stack_num - 1;
    i1 = stacks(stack_num);
    stack_num = stack_num - 1;

    i2 = best(i1,i3);

    order(step) = i2 - 1;
    step = step - 1;
%
%  The left chunk is matrices (I1...I2-1)
%
    if ( i1 == i2-1 )

    elseif ( i1+1 == i2-1 )
      order(step) = i2 - 2;
      step = step - 1;
    else
      stack_num = stack_num + 1;
      stacks(stack_num) = i1;
      stack_num = stack_num + 1;
      stacks(stack_num) = i2 - 1;
    end
%
%  The right chunk is matrices (I2...I3)
%
    if ( i2 == i3 )

    elseif ( i2+1 == i3 )
      order(step) = i2;
      step = step - 1;
    else
      stack_num = stack_num + 1;
      stacks(stack_num) = i2;
      stack_num = stack_num + 1;
      stacks(stack_num) = i3;
    end

  end

  return
end
