function ierror = chinese_check ( n, m )

%*****************************************************************************80
%
%% CHINESE_CHECK checks the Chinese remainder moduluses.
%
%  Discussion:
%
%    For a Chinese remainder representation, the moduluses M(I) must
%    be positive and pairwise prime.  Also, in case this is not obvious,
%    no more than one of the moduluses may be 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of moduluses.
%
%    Input, integer M(N), the moduluses.  These should be positive
%    and pairwise prime.
%
%    Output, integer IERROR, an error flag.
%    0, no error was detected.
%    nonzero, an error was detected.
%

%
%  Do not allow nonpositive entries.
%
  if ( any ( m(1:n) <= 0 ) )
    ierror = 1;
    return
  end
%
%  Allow one entry to be 1, but not two entries.
%
  for i = 1 : n
    for j = i+1 : n
      if ( m(i) == 1 & m(j) == 1 )
        ierror = 2;
        return
      end
    end
  end
%
%  Now check pairwise primeness.
%
  if ( ~i4vec_pairwise_prime ( n, m ) )
    ierror = 3;
    return
  end

  ierror = 0;

  return
end
