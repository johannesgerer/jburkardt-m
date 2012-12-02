function p = perm_inverse ( n, p )

%*****************************************************************************80
%
%% PERM_INVERSE inverts a permutation "in place".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2005
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
%    Output, integer P(N), the inverse permutation
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'PERM_INVERSE - Fatal error!' );
  end

  ierror = perm_check ( n, p );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_INVERSE - Fatal error!' );
  end

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

  return
end
