function cond = condition_hager ( n, a )

%*****************************************************************************80
%
%% CONDITION_HAGER estimates the L1 condition number of a matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Hager,
%    Condition Estimates,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 5, Number 2, June 1984, pages 311-316.
%
%  Parameters:
%
%    Input, integer N, the dimension of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real COND, an estimate of the L1 condition number.
%
  i1 = -1;
  c1 = 0.0;
%
%  Factor the matrix.
%
  b(1:n,1) = 1.0 / n;

  while ( 1 )

    b = a \ b;

    c2 = sum ( abs ( b(1:n,1) ) );

    b = sign ( b );

    i = find ( b == 0.0 );
    b(i) = 1.0;

    b = a' \ b;

    i2 = r8vec_max_abs_index ( n, b );

    if ( 1 <= i1 )
      if ( i1 == i2 || c2 <= c1 )
        break
      end
    end

    i1 = i2;
    c1 = c2;

    b(1:n,1) = 0.0;
    b(i1,1) = 1.0;

  end

  cond = c2 * norm ( a, 1 );

  return
end
