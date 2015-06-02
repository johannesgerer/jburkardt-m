function ntree = tree_rooted_enum ( nnode )

%*****************************************************************************80
%
%% TREE_ROOTED_ENUM counts the number of unlabeled rooted trees.
%
%  Example:
%
%    Input    Output
%
%      1         1
%      2         1
%      3         2
%      4         4
%      5         9
%      6        20
%      7        48
%      8       115
%      9       286
%     10       719
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
%    MATLAB version by John Burkardt.
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
%    Output, integer NTREE(NNODE).  NTREE(I) is the number of 
%    rooted, unlabeled trees on I nodes, for I = 1, 2, ... NNODE.
%
  ntree = zeros ( nnode, 1 );

  ntree(1) = 1;
 
  for nlast = 2 : nnode
 
    isum = 0;
 
    for id = 1 : nlast - 1
 
      i = nlast;
      itd = ntree(id) * id;
 
      for j = 1 : nlast - 1

        i = i - id;

        if ( i <= 0 )
          break
        end

        isum = isum + ntree(i) * itd;

      end
 
    end
 
    ntree(nlast) = floor ( isum / ( nlast - 1 ) );

  end

  return
end
