function fnm = perm_fixed_enum ( n, m )

%*****************************************************************************80
%
%% PERM_FIXED_ENUM enumerates the permutations of N objects with M fixed.
%
%  Discussion:
%
%    A permutation of N objects with M fixed is a permutation in which
%    exactly M of the objects retain their original positions.  If
%    M = 0, the permutation is a "derangement".  If M = N, the
%    permutation is the identity.
%
%  Formula:
%
%    F(N,M) = ( N! / M! ) * ( 1 - 1/1! + 1/2! - 1/3! ... 1/(N-M)! )
%           = COMB(N,M) * D(N-M)
%
%    where D(N-M) is the number of derangements of N-M objects.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects to be permuted.
%    N should be at least 1.
%
%    Input, integer M, the number of objects that retain their
%    position.  M should be between 0 and N.
%
%    Output, integer FNM, the number of derangements of N objects
%    in which M objects retain their positions.
%
  if ( n <= 0 )

    fnm = 1;

  elseif ( m < 0 )

    fnm = 0;

  elseif ( n < m )

    fnm = 0;

  elseif ( m == n )

    fnm = 1;

  elseif ( n == 1 )

    if ( m == 1 )
      fnm = 1;
    else
      fnm = 0;
    end

  else

    fnm = i4_choose ( n, m ) * derange_enum ( n - m );

  end

  return
end
