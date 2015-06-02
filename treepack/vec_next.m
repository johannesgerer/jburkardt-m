function [ iarray, more ] = vec_next ( n, ibase, iarray, more )

%*****************************************************************************80
%
%% VEC_NEXT generates all N-vectors of integers modulo a given base.
%
%  Discussion:
%
%    The items are produced one at a time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Parameters:
%
%    Input, integer N, the size of the vectors to be used.
%
%    Input/output, integer IARRAY(N).  On each return from VECNEX,
%    IARRAY will contain entries in the range 0 to IBASE-1.
%
%    Input/output, logical MORE.  Set this variable .FALSE. before
%    the first call.  Normally, MORE will be returned .TRUE. but
%    once all the vectors have been generated, MORE will be
%    reset .FALSE. and you should stop calling the program.
%
%    Input, integer IBASE, the base to be used.  IBASE = 2 will
%    give vectors of 0's and 1's, for instance.
%
  persistent kount
  persistent last

  if ( ~ more )
 
    kount = 1;
    last = ibase ^ n;
    more = 1;
    iarray(1:n) = 0;
 
  else
 
    kount = kount + 1;

    if ( kount == last )
      more = 0;
    end

    iarray(n) = iarray(n) + 1;
 
    for i = 1 : n

      nn = n - i;

      if ( iarray(nn+1) < ibase )
        return
      end

      iarray(nn+1) = 0;

      if ( nn ~= 0 )
        iarray(nn) = iarray(nn) + 1;
      end

    end
 
  end
 
  return
end

