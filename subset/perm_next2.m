function [ p, invers, done ] = perm_next2 ( n, p, invers, done )

%*****************************************************************************80
%
%% PERM_NEXT2 generates all the permutations of N objects.
%
%  Discussion:
%
%    The routine generates the permutations one at a time.  It uses a
%    particular ordering of permutations, generating them from the first
%    (which is the identity permutation) to the N!-th.  The same ordering
%    is used by the routines PERM_RANK and PERM_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set to be permuted.
%
%    Input, integer P(N), the previous permutation, that is, the output value
%    of P from the previous call.  However, on an initialization call,
%    with DONE = TRUE, the value of P is not needed.
%
%    Input, integer INVERS(N), the value of INVERS from the previous
%    call.  However, on an initialization call, with DONE = TRUE, the value
%    of INVERS is not needed.
%
%    Input, logical DONE, is TRUE if this is an initialization call.
%    Otherwise, DONE should be FALSE.
%
%    Output, integer P(N), the next permutation.
%
%    Output, logical DONE, is TRUE as long as another permutation
%    was computed.  However, if there are no more permutations to compute,
%    DONE is returned FALSE.
%
%    Output, integer INVERS(N), the inverse permutation of P.
%
%  Local Parameters:
%
%    Local, integer ACTIVE(N), DIR(N).
%
  persistent active;
  persistent dir;
%
%  An input value of TRUE for DONE is assumed to mean a new
%  computation is beginning.
%
  if ( done )

    p = i4vec_indicator ( n );
    invers(1:n) = i4vec_indicator ( n );

    dir = [];
    dir(1:n) = -1;

    active = [];
    active(1) = 0;
    active(2:n) = 1;
%
%  Set the DONE flag to FALSE, signifying there are more permutations
%  to come.  Except, of course, that we must take care of the trivial case!
%
    if ( 1 < n )
      done = 0;
    else
      done = 1;
    end
%
%  Otherwise, assume we are in a continuing computation
%
  else

    nactiv = 0;

    for i = 1 : n
      if ( active(i) ~= 0 )
        nactiv = i;
      end
    end

    if ( nactiv <= 0 )

      done = 1;

    else

      j = invers(nactiv);

      p(j) = p(j+dir(nactiv));
      p(j+dir(nactiv)) = nactiv;

      invers(nactiv) = invers(nactiv) + dir(nactiv);
      invers(p(j)) = j;

      if ( j + 2 * dir(nactiv) < 1 | n < j + 2 * dir(nactiv) )
        dir(nactiv) = -dir(nactiv);
        active(nactiv) = 0;
      elseif ( nactiv < p(j+2*dir(nactiv)) )
        dir(nactiv) = -dir(nactiv);
        active(nactiv) = 0;
      end

      active(nactiv+1:n) = 1;

    end

  end

  return
end
