function p = perm_inverse ( n, p )

%*****************************************************************************80
%
%% PERM_INVERSE inverts a permutation "in place".
%
%  Discussion:
%
%    This algorithm assumes that the entries in the permutation vector are
%    strictly positive.  In particular, the value 0 must not occur.
%
%    When necessary, this function shifts the data temporarily so that
%    this requirement is satisfied.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%
%    Output, integer P(N), the inverse permutation.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'PERM_INVERSE - Fatal error!' );
  end
%
%  Find the least value, and shift data so it begins at 1.
%
  p_min = i4vec_min ( n, p );
  base = 1;
  p(1:n) = p(1:n) - p_min + base;
%
%  Check the permutation.
%
  ierror = perm_check ( n, p, base );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_INVERSE - Fatal error!' );
  end
%
%  Invert the permutation.
%
  is = 1;

  for i = 1 : n

    i1 = p(i);

    while ( i < i1 )
      i2 = p(i1);
      p(i1) = -i2;
      i1 = i2;
    end

    is = -i4_sign ( p(i) );
    p(i) = i4_sign ( is ) * abs ( p(i) );

  end

  for i = 1 : n

    i1 = -p(i);

    if ( 0 <= i1 )

      i0 = i;

      while ( 1 )

        i2 = p(i1);
        p(i1) = i0;

        if ( i2 < 0 )
          break;
        end

        i0 = i1;
        i1 = i2;

      end

    end

  end
%
%  Reverse the shift.
%
  p(1:n) = p(1:n) + p_min - base;

  return
end
