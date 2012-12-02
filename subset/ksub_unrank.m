function a = ksub_unrank ( k, rank )

%*****************************************************************************80
%
%% KSUB_UNRANK returns the subset of a given rank.
%
%  Discussion:
%
%    The routine is given a rank and returns the corresponding subset of K
%    elements of a set of N elements.  
%
%    It uses the same ranking that KSUB_NEXT2 uses to generate all the subsets 
%    one at a time.  
%
%    Note that the value of N itself is not input, nor is it needed.
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
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer K, the number of elements in the subset.
%
%    Input, integer RANK, the rank of the desired subset.
%    There are ( N*(N-1)*...*(N+K-1)) / ( K*(K-1)*...*2*1) such
%    subsets, so RANK must be between 1 and that value.
%
%    Output, integer A(K), K distinct integers in order between
%    1 and N, which define the subset.
%
  jrank = rank - 1;

  for i = k : -1 : 1

    ip = i - 1;
    iprod = 1;

    while ( 1 )

      ip = ip + 1;

      if ( ip ~= i )
        iprod = floor ( ( ip * iprod ) / ( ip - i ) );
      end

      if ( jrank < iprod )
        break;
      end

    end

    if ( ip ~= i )
      iprod = floor ( ( ( ip - i ) * iprod ) / ip );
    end

    jrank = jrank - iprod;
    a(i) = ip;

  end

  return
end
