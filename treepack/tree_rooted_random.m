function [ ntree, itree, seed ] = tree_rooted_random ( nnode, seed )

%*****************************************************************************80
%
%% TREE_ROOTED_RANDOM selects a random unlabeled rooted tree.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, integer NTREE(NNODE).  NTREE(I) is the number of 
%    rooted, unlabeled trees on I nodes, for I = 1, 2, ... NNODE.
%
%    Output, integer ITREE(NNODE).  (I,ITREE(I)) is the I-th edge
%    of the output tree for I = 2,NNODE.  ITREE(1)=0.
%
  if ( nnode <= 0  )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TREE_ROOTED_RANDOM - Fatal error!\n' );
    fprintf ( 1, '  NNODE = %d\n', nnode );
    fprintf ( 1, '  but NNODE must be at least 1.\n' );
    error ( 'TREE_ROOTED_RANDOM - Fatal error!' );
  end
%
%  Compute a table of the number of such trees for a given number of nodes.
%
  ntree = tree_rooted_enum ( nnode );
%
%  Now select one such tree at random.
%
  l = 0;

  nval = nnode;
  is1 = 0;
  is2 = 0;
  
  while ( 1 )

    while ( 2 < nval )
 
      [ r, seed ] = r8_uniform_01 ( seed );

      iz = floor ( ( nval - 1 ) * ntree(nval) * r );

      id = 0;
  
      id = id + 1;
      itd = id * ntree(id);
      m = nval;
      j = 0;
 
      while ( 1 )
 
        j = j + 1;
        m = m - id;

        if ( m < 1 )
          id = id + 1;
          itd = id * ntree(id);
          m = nval;
          j = 0;
          continue
        end

        iz = iz - ntree(m) * itd;

        if ( iz < 0 )
          break
        end

      end

      is1 = is1 + 1;
      stack(1,is1) = j;
      stack(2,is1) = id;
      nval = m;
 
    end
 
    itree(is2+1) = l;
    l = is2 + 1;
    is2 = is2 + nval;

    if ( 1 < nval )
      itree(is2) = is2 - 1;
    end
 
    while ( 1 )
 
      nval = stack(2,is1);
 
      if ( nval ~= 0 )
        stack(2,is1) = 0;
        break
      end
 
      j = stack(1,is1);
      is1 = is1 - 1;
      m = is2 - l + 1;
      ll = itree(l);
      ls = l + ( j - 1 ) * m - 1;
 
      if ( j ~= 1 )
        for i = l : ls
          itree(i+m) = itree(i) + m;
          if ( mod(i-l,m) == 0 )
            itree(i+m) = ll;
          end
        end
      end
 
      is2 = ls + m;
 
      if ( is2 == nnode )
        return
      end

      l = ll;
 
    end

  end
 
  return
end

