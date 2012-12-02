function [ n_unique, a_unique ] = r8vec_sorted_unique ( n, a, tol )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE finds the unique elements in a sorted R8VEC.
%
%  Discussion:
%
%    Because real numbers are being compared, it is sometimes desirable
%    to allow a positive tolerance for equality.  This can be done by
%    resetting the internal variable TOL to a positive value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in A.
%
%    Input, real A(N), the sorted integer array.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer N_UNIQUE, the number of unique elements in A.
%
%    Output, real A_UNIQUE[N_UNIQUE], the unique elements.
%
  n_unique = 0;
  a_unique = [];

  if ( n <= 0 )
    return;
  end

  n_unique = 1;
  a_unique = [ a_unique a(1) ];

  for i = 2 : n

    if ( tol < abs ( a(i) - a_unique(n_unique) ) )
      n_unique = n_unique + 1;
      a_unique = [ a_unique a(i) ];
    end

  end

  return
end
